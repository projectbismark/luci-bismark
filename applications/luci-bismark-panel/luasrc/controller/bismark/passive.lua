module("luci.controller.bismark.passive", package.seeall)

function index()
    local page = entry({"bismark"}, alias("bismark", "passive"), "Bismark", 10)
    page.sysauth = "root"
    page.sysauth_authenticator = "htmlauth"
    page.index = true

    entry({"bismark", "passive"}, cbi("bismark-passive/general", {autoapply=true}), "Passive measurements", 30).dependent=false
end
