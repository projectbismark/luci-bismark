m = Map("bismark-passive", "Bismark Passive")
m.on_after_commit = function()
    luci.sys.call("/tmp/etc/init.d/bismark-passive restart")
end

s = m:section(TypedSection, "whitelist", "Domain whitelist")
s.addremove = false
s.anonymous = true
s.template = "cbi/tblsection"

en = s:option(Flag, "enabled", "Enable recording of whitelisted domains")
en.rmempty = false

domain = s:option(DynamicList, "domain", "Domain name to whitelist")
domain.datatype = "hostname"
domain.rmempty = true
domain.size = 32

return m -- Returns the map
