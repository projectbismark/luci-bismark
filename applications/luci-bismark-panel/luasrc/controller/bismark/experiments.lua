module("luci.controller.bismark.experiments", package.seeall)

function index()
    local page = entry({"bismark"}, alias("bismark", "experiments"), "Bismark", 10)
    page.sysauth = "root"
    page.sysauth_authenticator = "htmlauth"
    page.index = true

    entry({"bismark", "experiments"}, cbi("bismark-experiments-manager/general", {autoapply=true}), "Experiments", 30).dependent=false
end
