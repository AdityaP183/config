function Linemode:size_and_btime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
        time = ""
    elseif os.date("%Y", time) == os.date("%Y") then
        -- Current year: show "05 Aug"
        time = os.date("%d %b", time)
    else
        -- Different year: show "05 Aug, 25"
        time = os.date("%d %b, %y", time)
    end

    -- Getting the size in natural foramt KB, MB, GB
	local size = self._file:size()
    local size_str = ""
    if size then
        if size >= 1024^3 then
            size_str = string.format("%.2f GB", size / 1024^3)
        elseif size >= 1024^2 then
            size_str = string.format("%.2f MB", size / 1024^2)
        elseif size >= 1024 then
            size_str = string.format("%.2f KB", size / 1024)
        else
            size_str = string.format("%d B", size)
        end
    end

    return string.format("%s %s", size_str, time)
end
