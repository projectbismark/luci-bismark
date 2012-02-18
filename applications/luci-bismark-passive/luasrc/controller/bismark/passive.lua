module("luci.controller.bismark.passive", package.seeall)

function index()
    entry({"bismark", "passive"}, cbi("bismark-passive/general", {autoapply=true}), "Passive measurements", 30).dependent=false
end
