m = Map("bismark-experiments", "Bismark Experiments")
m.on_after_commit = function()
    luci.sys.exec("/usr/bin/setup-and-teardown-experiments")
end

s = m:section(TypedSection, "experiment", "")
s.anonymous = true
s.addremove = false
s:option(DummyValue, "name", "Experiment name")
s:option(DummyValue, "description", "Experiment description")
en = s:option(Flag, "installed", "Participate in this experiment")
en.rmempty = false

return m -- Returns the map
