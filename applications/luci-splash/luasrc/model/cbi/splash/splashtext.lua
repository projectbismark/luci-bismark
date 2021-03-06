--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>
Copyright 2010 Manuel Munz <freifunk@somakoma.de>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0
]]--

local fs = require "nixio.fs"
luci.i18n.loadc("splash")

local splashtextfile = "/usr/lib/luci-splash/splashtext.html" 

f = SimpleForm("splashtext", translate("Edit Splash text"), translate("You can change the text that is displayed to clients here.<br /> It is possible to use the following markers: ###COMMUNITY###, ###COMMUNITY_URL###, ###LEASETIME### and ###ACCEPT###.<br />Click here to <a href='/luci/splash/'>test the splash page</a> after you saved it."))

t = f:field(TextValue, "text")
t.rmempty = true
t.rows = 30
function t.cfgvalue()
	return fs.readfile(splashtextfile) or ""
end

function f.handle(self, state, data)
	if state == FORM_VALID then
		if data.text then
			fs.writefile(splashtextfile, data.text:gsub("\r\n", "\n"))
		end
	end
	return true
end

return f
