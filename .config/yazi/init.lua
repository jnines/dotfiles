function Linemode:my_data()
	local year = os.date("%Y")
	local time = (self._file.cha.modified or 0) // 1

	if time > 0 and os.date("%Y", time) == year then
		time = os.date("%b %d %I:%M%p", time)
	else
		time = time and os.date("%b %d  %Y", time) or ""
	end

	local size = self._file:size()
	local uname = self._file.cha.uid
	local gname = self._file.cha.gid
	local permissions = self._file.cha:permissions()
	return ui.Line(
		string.format(
			"%s:%s %s %s %s ",
			ya.user_name(uname),
			ya.group_name(gname),
			permissions,
			size and ya.readable_size(size) or "-",
			time
		)
	)
end
