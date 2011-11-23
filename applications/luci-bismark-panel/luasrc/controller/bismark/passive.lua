module("luci.controller.bismark.passive", package.seeall)

function index()
    local page = entry({"bismark"}, alias("bismark", "general"), "Bismark", 10)
    page.sysauth = "root"
    page.sysauth_authenticator = "htmlauth"
    page.index = true

    entry({"bismark", "whitelist"}, cbi("bismark-passive/whitelist", {autoapply=true}), "Domain whitelist", 30).dependent=false
    entry({"bismark", "general"}, cbi("bismark-passive/general", {autoapply=true}), "General", 30).dependent=false
end
