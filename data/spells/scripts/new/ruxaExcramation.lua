local combat = createCombatObject()
local combatArea = createCombatArea(AREA_PRISON)
local teamList = {}
local affectedList = {}
local teleportPositions = {}
local centerArea = {x=817, y=893, z=0}
setCombatArea(combat, combatArea)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)
setAttackFormula(combat, COMBAT_FORMULA_DAMAGE, 1, 1, 1, 1)

function getAffectedPlayers(param)
	local players = getPlayersOnline()
	local index = 1
	local number = #players
	local distance
	local diferenceXY = {x=0,y=0,z=0}
	local tempPos
	for _, pid in ipairs(players) do	
		distance = getDistanceBetween(param.pos, getCreaturePosition(pid))
		diferenceXY = {x=0,y=0,z=0}
		if ( (distance < 6) and not isInArray(teamList, pid) and not isInArray(affectedList, pid) ) then
			--doCreatureSetNoMove(param.cid,true)
			affectedList[pid] = getCreaturePosition(pid)
			tempPos = getCreaturePosition(pid)
			diferenceXY.x = param.pos.x - tempPos.x
			diferenceXY.y = param.pos.y - tempPos.y
			teleportPositions[pid] = diferenceXY				
			doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(pid) .. " was added to the list.")
		end		
	end
end

function spellCallBack(param)
	doCreatureSetNoMove(param.cid,false)
end

function isCasteable(cid, pos)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, pos.x)
	local memberTmp
	local posTmp = {x=0,y=0,z=0}

	-- Case 1 [member1] [me] [member2]	
	posTmp.x = pos.x - 1
	posTmp.y = pos.y
	posTmp.z = pos.z
	memberTmp = getTopCreature(posTmp)		

	if memberTmp == nil then
		return false
	end

	if isPlayer(memberTmp.uid) then	
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[XX] CASO 1")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(memberTmp.uid))	
		teamList[1] = memberTmp.uid
		teamList[2] = cid
		posTmp.x = pos.x + 1
		posTmp.y = pos.y
		posTmp.z = pos.z
		memberTmp = getTopCreature(posTmp)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, posTmp.x)
		if isPlayer(memberTmp.uid) then
			teamList [3] = memberTmp.uid
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(memberTmp.uid))
			return true
		end
	end	

	-- Case 1 [me] [member1]  [member2]	
	posTmp.x = pos.x + 1
	posTmp.y = pos.y
	posTmp.z = pos.z
	memberTmp = getTopCreature(posTmp)	
	if memberTmp == nil then
		return false
	end

	if isPlayer(memberTmp.uid) then	
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[XX] CASO 2")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(memberTmp.uid))	
		teamList[2] = memberTmp
		teamList[1] = cid
		posTmp.x = pos.x + 2
		posTmp.y = pos.y
		posTmp.z = pos.z
		memberTmp = getTopCreature(posTmp)		
		if isPlayer(memberTmp.uid) then
			teamList [3] = memberTmp.uid
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(memberTmp.uid))
			return true
		end
	end

	-- Case 1 [member1] [member2]  [me]	
	posTmp.x = pos.x - 2
	posTmp.y = pos.y
	posTmp.z = pos.z
	memberTmp = getTopCreature(posTmp)	
	if memberTmp == nil then
		return false
	end

	if isPlayer(memberTmp.uid) then		
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[XX] CASO 3")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(memberTmp.uid))
		teamList[1] = memberTmp.uid
		teamList[3] = cid
		posTmp.x = pos.x - 1
		posTmp.y = pos.y
		posTmp.z = pos.z
		memberTmp = getTopCreature(posTmp)		
		if isPlayer(memberTmp.uid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(memberTmp.uid))
			teamList [2] = memberTmp.uid			
			return true
		end
	end

	return false
end

function returnToOriginalPosition(param)
	
	for i,v in pairs(affectedList) do
		doTeleportThing(i, v)
		local health = getCreatureMaxHealth(i)
		health = health * (-1)
		doCreatureAddHealth(i,health)
	end

	local tempPosition = {x=0,y=0,z=0}
	tempPosition.x = param.pos.x - 1
	tempPosition.y = param.pos.y
	tempPosition.z = param.pos.z

	doTeleportThing(teamList[1], tempPosition)

	doTeleportThing(teamList[2], param.pos)

	tempPosition.x = param.pos.x + 1
	tempPosition.y = param.pos.y
	tempPosition.z = param.pos.z
	doTeleportThing(teamList[3], tempPosition)

	doCreatureSetNoMove(teamList[1], false)
	doCreatureSetNoMove(teamList[2], false)
	doCreatureSetNoMove(teamList[3], false)
end

function animation(param)	
	if(param.count ~= 5) then
		param.count = param.count + 1
		doSendMagicEffect(param.pos, CONST_ME_ENERGYHIT)
		doSendMagicEffect(getCreaturePosition(teamList[1]), CONST_ME_ENERGYHIT)
		doSendMagicEffect(getCreaturePosition(teamList[3]), CONST_ME_ENERGYHIT)
		addEvent(animation, 500, param)
	else
		doCreatureSay(param.cid,"DIEEEEEEEEEEEEEE",MESSAGE_EVENT_ORANGE)	
		getAffectedPlayers(param)
		local tempPosition = {x=0,y=0,z=0}
		for i, v in pairs(affectedList) do		
			--doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_RED, "[" .. i .. "]FROM POS TO: {" .. teleportPositions[i].x .. "," .. teleportPositions[i].y .. "," .. teleportPositions[i].z .. "}")			
			doCreatureSetNoMove(i, true)
			tempPosition.x = centerArea.x - teleportPositions[i].x
			tempPosition.y = centerArea.y - teleportPositions[i].y
			--doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_RED, "[" .. i .. "]TELEPORTING TO: {" .. tempPosition.x .. "," .. tempPosition.y .. "," .. tempPosition.z .. "}")	
			doTeleportThing(i, tempPosition)
		end
		tempPosition.x = centerArea.x - 1
		tempPosition.y = centerArea.y
		tempPosition.z = centerArea.z
		doTeleportThing(teamList[1], tempPosition)
		doSendMagicEffect(tempPosition, CONST_ME_YALAHARIGHOST)
		doTeleportThing(teamList[2], centerArea)
		doSendMagicEffect(centerArea, CONST_ME_YALAHARIGHOST)
		tempPosition.x = centerArea.x + 1
		tempPosition.y = centerArea.y
		tempPosition.z = centerArea.z
		doTeleportThing(teamList[3], tempPosition)
		doSendMagicEffect(tempPosition, CONST_ME_YALAHARIGHOST)
		addEvent(returnToOriginalPosition, 3000, param)
	end
end

function prepareSpell(cid)
	local resultId = db.storeQuery("SELECT * FROM `global_spells` WHERE `id` = 1")
	if(result ~= nil) then
		if result.getDataInt("in_use") == 0 then
			local value = result.getDataInt("value")
			value = value + 1
			db.executeQuery("UPDATE `global_spells` SET `value` = " .. value .. " WHERE `id` = 1")
			return true
		end
	end
	return false
end

function getReadyPlayers(cid)
	local readyP = 0
	db.storeQuery("SELECT `value` FROM `global_spells` WHERE `id` = 1")
	readyP = result.getDataInt("value")
	doCreatureSay(cid,"[x] There are: " .. readyP .. " ready.",MESSAGE_EVENT_ORANGE)
	return readyP
end

function abortSpell(param)
	db.storeQuery("SELECT `value` FROM `global_spells` WHERE `id` = 1")
	local value = result.getDataInt("value")
	value = value - 1
	db.executeQuery("UPDATE `global_spells` SET `value` = " .. value .. " WHERE `id` = 1")
	--doCreatureSay(param.cid,"[x]Aborting... :: " .. value,MESSAGE_EVENT_ORANGE)
	doCreatureSetNoMove(param.cid, false)
end

function waitTeam(param)	
	if getReadyPlayers(param.cid) == 3 then						
		if param.cid == teamList[2] then			
			addEvent(animation, 0, param)
			addEvent(spellCallBack, 5000, param)		
			doCreatureSay(param.cid,"YOU ARE DOOOOOOMED",MESSAGE_EVENT_ORANGE)
			addEvent(abortSpell, 5000, param)			
		else
			doCreatureSay(param.cid,"MUAHAHAHAHA",MESSAGE_EVENT_ORANGE)
			addEvent(abortSpell, 5000, param)
		end
		
	else
		doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_BLUE, "The team is not ready")
		doSendMagicEffect(param.pos, CONST_ME_POFF)
		addEvent(abortSpell, 5000, param)
	end
end

function ruxaExcramation(cid, pos)
	doCreatureSetNoMove(cid, true)
	local param = {}
	param.cid = cid
	param.pos = getCreaturePosition(cid)
	param.count = 0
	if isCasteable(cid, param.pos) then
		if prepareSpell(cid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[x]Spell Prepared!")
			if getReadyPlayers(cid) == 3 then	
				addEvent(animation, 0, param)
				addEvent(spellCallBack, 5000, param)
				doCreatureSay(cid,"YOU ARE DOOOOOOMED",MESSAGE_EVENT_ORANGE)	
				addEvent(abortSpell, 5000, param)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[x]Waiting for the others!")
				addEvent(waitTeam, 5000, param)				
			end
		end
	end	
end

--setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "ruxaExcramation")

function onCastSpell(cid, var)
	ruxaExcramation(cid, getCreaturePosition(cid))
	return doCombat(cid, combat, var)
end