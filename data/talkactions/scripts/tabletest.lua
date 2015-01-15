local affectedList = {}
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area = createCombatArea(AREA_FULL)
setCombatArea(combat, area)

local area = createCombatArea(AREA_FULL)

function onCallBack(cid)
	
end
function onSay(cid, words, param, channel)
	local players = getPlayersOnline()	
	for _, pid in ipairs(players) do
		affectedList[pid] = getCreatureName(pid)
	end

	for i, v in pairs(affectedList) do
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, i .. ","..v)
	end

	setCombatCallBack (combat, CALLBACK_PARAM_LEVELMAGICVALUE, "")
	
end