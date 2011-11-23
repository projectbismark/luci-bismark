m = Map("bismark-passive", "Bismark Passive")
m.on_after_commit = function()
    luci.sys.call("/tmp/etc/init.d/bismark-passive restart")
end

s = m:section(TypedSection, "general", "General settings")
s.anonymous = true

v = s:option(Flag, "enabled", "Enable Bismark Passive")
v.default = 1

return m
