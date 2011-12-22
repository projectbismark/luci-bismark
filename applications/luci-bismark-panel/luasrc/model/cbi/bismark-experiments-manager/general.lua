m = Map("bismark-experiments", "Bismark Experiments")
m.on_after_commit = function()
    luci.sys.call("/usr/bin/setup-and-teardown-experiments")
end

s = m:section(TypedSection, "experiment", "")
s.anonymous = false
s.addremove = false
s:option(Flag, "installed", "Installed", "Participate in this experiment")

return m -- Returns the map
