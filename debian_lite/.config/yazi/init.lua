function Linemode:my_data()
	local year = os.date("%Y")
	local time = (self._file.cha.mtime or 0) // 1
	local dtime
	if time > 0 and os.date("%Y", time) == year then
		dtime = os.date("%b %d %I:%M%p", time)
	else
		dtime = time and os.date("%b %d  %Y", time) or ""
	end

	local size = self._file:size()
	local uname = self._file.cha.uid
	local permissions = self._file.cha:perm()
	return string.format(
		"%s %s %s %s ",
		ya.user_name(uname),
		permissions,
		size and ya.readable_size(size) or "-",
		dtime
	)
end
