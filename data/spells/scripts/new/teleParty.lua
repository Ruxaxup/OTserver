local combat = createCombatObject()
local area = createCombatArea(AREA_CIRCLE2X2)

setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function doTeleportParty(cid, affectedList)
	local casterTown = getPlayerTown(cid)
	local templePos = getTownTemplePosition(casterTown)

	for _, pid in ipairs(affectedList) do
		doTeleportThing(pid, templePos)
		doSendMagicEffect(templePos, CONST_ME_HOLYDAMAGE)
		doCreatureSetNoMove(pid, false)
	end

end

function onCastSpell(cid, var)
	local pos, memberlist = getCreaturePosition(cid), getPartyMembers(cid)
	if(memberlist == nil or type(memberlist) ~= 'table' or table.maxn(memberlist) <= 1) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
		doSendMagicEffect(pos, CONST_ME_POFF)
		return false
	end

	local affectedList = {}
	for _, pid in ipairs(memberlist) do
		if(getDistanceBetween(getCreaturePosition(pid), pos) <= 36) then
			table.insert(affectedList, pid)
		end
	end

	local tmp = table.maxn(affectedList)
	if(tmp <= 1) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
		doSendMagicEffect(pos, CONST_ME_POFF)
		return false
	else
		for _, pid in ipairs(affectedList) do
			doCreatureSetNoMove(pid, true)
		end
	end

	if(not doCombat(cid, combat, var)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(pos, CONST_ME_POFF)
		return false
	else
		doTeleportParty(cid, affectedList)
	end



	return true

end
