#!/bin/sh
### sh as Alpine uses Ash by default ###

ALP_PKGS="git stow ncurses shadow yazi zsh zsh-autosuggestions zsh-syntax-highlighting zsh-vcs jq fd ripgrep fzf zoxide neovim"
ARCH_PKGS="git stow zsh zsh-autosuggestions zsh-syntax-highlighting eza bat jq fd ripgrep fzf zoxide python-pynvim neovim which"
DEB_PKGS="git stow zsh zsh-autosuggestions zsh-syntax-highlighting eza bat npm python3-venv ffmpeg 7zip jq unzip curl fuse poppler-utils fd-find ripgrep fzf zoxide imagemagick python3-pynvim"
DEB_LITE_PKGS="git stow zsh zsh-autosuggestions zsh-syntax-highlighting jq fd-find ripgrep fzf zoxide unzip curl fuse"

DOT_URL="https://github.com/jnines/dotfiles"
YAZI_URL="https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip"
NVIM_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage"
DOTS_DIR="$HOME/git/dots"
DATE=$(date '+%m%d%Y')

yazi_deb() {
	cd /tmp || exit 1
	echo "Downloading yazi"
	wget -q "${YAZI_URL}" \
		&& echo "Extracting files" \
		&& unzip "yazi-x86_64-unknown-linux-gnu.zip" \
		&& cd "yazi-x86_64-unknown-linux-gnu" || exit
	echo "Moving files"
	sudo mv yazi ya /usr/local/bin/
	cd "completions" || exit
	sudo mv _yazi _ya /usr/share/zsh/vendor-completions/
	echo "Yazi Installed"
	rm -r /tmp/yazi*
}

nvim_deb_fpk() {
	cd /tmp || exit 1
	echo "Downloading"
	wget -q "${NVIM_URL}" \
		&& echo "Moving and setting permissions"
	sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim.appimage \
		&& sudo chmod +x /usr/local/bin/nvim.appimage \
		&& if [ ! -L /usr/local/bin/nvim ]; then
			sudo ln -s /usr/local/bin/nvim.appimage /usr/local/bin/nvim
		fi
	echo "Neovim Installed"
}

backup() {
	_f=$(for finder in "fd" "fdfind"; do command -v "$finder"; done)
	while IFS= read -r file; do
		if [ -f "${HOME}/${file}" ]; then
			mv "${HOME}/${file}" "${HOME}/${file}._dotsb_.${DATE}"
			echo "${file} exists and has been backed up as ${file}.${DATE}"
		fi
	done <<EOF
$($_f -H --type f . --base-directory "${DOTS_DIR}/${_SPEC}")
EOF
}

install() {
	_pkg_manager=$(for manager in "pacman" "apt-get" "apk"; do
		command -v "$manager" | xargs basename 2>/dev/null
	done)

	echo "Creating .cache..."
	mkdir -p "$HOME/.cache/zsh"

	echo "Creating zsh history file..."
	touch "$HOME/.cache/.zshistory"

	echo "Creating dots dir..."
	mkdir -p "${DOTS_DIR}"

	if [ -n "${SPEC}" ]; then
		case ${SPEC} in
		alpine | alp)
			_SPEC="alpine"
			;;
		arch)
			_SPEC="arch"
			;;
		debian | deb)
			_SPEC="debian"
			;;
		debian-lite | debian_lite | debl | dl)
			_SPEC="debian_lite"
			;;
		*)
			echo "Incorrect spec ENV.  Exiting..."
			;;
		esac

	elif [ "${_pkg_manager}" = "pacman" ]; then
		_SPEC="arch"
		echo "Arch dotfiles selected"

	elif [ "${_pkg_manager}" = "apk" ]; then
		_SPEC="alpine"
		echo "Alpine dotfiles selected"

	elif [ "${_pkg_manager}" = "apt-get" ]; then
		printf "Debian(d) or Debian Lite(l) dotfiles (d/l)?"
		read -r selection </dev/tty
		case ${selection} in
		d | D)
			_SPEC="debian"
			echo "Debian dotfiles selected"
			;;
		l | L)
			_SPEC="debian_lite"
			echo "Debian Lite dotfiles selected"
			;;
		*)
			echo "Invalid spec selection, exiting"
			exit 1
			;;
		esac
	fi

	_elevate=$(
		if [ "$(id -u)" -eq 0 ]; then
			_elevate=""
		else
			for cmd in "sudo" "doas"; do
				command -v "${cmd}"
			done
		fi
	)

	case ${_SPEC} in
	arch)
		${_elevate} pacman -S --needed --noconfirm ${ARCH_PKGS:+ $ARCH_PKGS}
		;;
	debian)
		${_elevate} apt-get update && ${_elevate} apt-get install -y ${DEB_PKGS:+ $DEB_PKGS} \
			&& yazi_deb \
			&& nvim_deb_fpk \
			&& echo "PATH=~/.local/bin:$PATH" >>.profile \
			&& npm config set prefix "$HOME/.local" \
			&& npm install -g neovim
		;;
	debian_lite)
		${_elevate} apt-get update && ${_elevate} apt-get install -y ${DEB_LITE_PKGS:+ $DEB_LITE_PKGS} \
			&& yazi_deb \
			&& nvim_deb_fpk
		;;
	alpine)
		${_elevate} apk update && ${_elevate} apk add ${ALP_PKGS:+ $ALP_PKGS} --no-cache
		;;
	*)
		exit 1
		;;
	esac
}

main() {
	echo "Installing packages..." \
		&& install \
		&& echo "Cloning repo..." \
		&& git clone "${DOT_URL}" "${DOTS_DIR}" \
		&& echo "_SPEC=${_SPEC}" >"${DOTS_DIR}/.spec" \
		&& echo "Backing up files..." \
		&& backup \
		&& echo "Stowing dotfiles" \
		&& stow --no-folding --dir="${DOTS_DIR}" --target="${HOME}" "${_SPEC}" \
		&& echo "Changing user shell..." \
		&& ${_elevate} chsh -s "$(which zsh)" "${USER}" \
		&& exec zsh \
		&& echo "Done... If ssh you will need to relog"
}
main
