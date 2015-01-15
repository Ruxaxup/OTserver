local combat = createCombatObject()
local combatStun = createCombatObject()
local combatArea = createCombatArea(AREA_PRISON)
local combatAreaStun = createCombatArea(AREA_STUN)
local teamList = {}
local affectedList = {}
local teleportPositions = {}
local centerArea = {x=817, y=893, z=0}
-------------------------------------------------------------------
local combatS1 = createCombatObject()
local combatS2 = createCombatObject()
local combatS3 = createCombatObject()
local combatS4 = createCombatObject()
local combatS5 = createCombatObject()

setCombatParam(combatS1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatS1, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
--setAttackFormula(combatS1, COMBAT_FORMULA_LEVELMAGIC, 1, 0, 1, 0)

setCombatParam(combatS2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatS2, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
--setAttackFormula(combatS2, COMBAT_FORMULA_LEVELMAGIC, 1, 0, 1, 0)

setCombatParam(combatS3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatS3, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
--setAttackFormula(combatS3, COMBAT_FORMULA_LEVELMAGIC, 1, 0, 1, 0)

setCombatParam(combatS4, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatS4, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
--setAttackFormula(combatS4, COMBAT_FORMULA_LEVELMAGIC, 1, 0, 1, 0)

setCombatParam(combatS5, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatS5, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
--setAttackFormula(combatS5, COMBAT_FORMULA_LEVELMAGIC, 1, 0, 1, 0)


local areaS1 = createCombatArea(AREA_EXCRA1)
local areaS2 = createCombatArea(AREA_EXCRA2)
local areaS3 = createCombatArea(AREA_EXCRA3)
local areaS4 = createCombatArea(AREA_EXCRA4)
local areaS5 = createCombatArea(AREA_EXCRA5)

setCombatArea(combatS1,areaS1)
setCombatArea(combatS2,areaS2)
setCombatArea(combatS3,areaS3)
setCombatArea(combatS4,areaS4)
setCombatArea(combatS5,areaS5)

------------------------------------------------------------------
local combatX1 = createCombatObject()
local combatX2 = createCombatObject()
local combatX3 = createCombatObject()
local combatX4 = createCombatObject()
local combatX5 = createCombatObject()
local combatX6 = createCombatObject()
local combatX7 = createCombatObject()
local combatX8 = createCombatObject()
local combatX9 = createCombatObject()
local combatX10 = createCombatObject()
local combatX11 = createCombatObject()
local combatX12 = createCombatObject()
local combatX13 = createCombatObject()
local combatX14 = createCombatObject()
local combatX15 = createCombatObject()
local combatX16 = createCombatObject()
local combatX17 = createCombatObject()
local combatX18 = createCombatObject()
local combatX19 = createCombatObject()
local combatX20 = createCombatObject()

setCombatParam(combatX1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX1, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX2, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX3, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX4, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX4, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX5, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX5, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX6, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX6, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX7, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX7, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX8, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX8, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX9, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX9, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX10, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX10, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX11, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX11, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX12, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX12, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX13, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX13, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX14, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX14, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX15, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX15, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX16, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX16, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX17, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX17, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX18, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX18, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX19, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX19, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

setCombatParam(combatX20, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combatX20, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

local areaX1 = createCombatArea(AREA_EXCRAX1)
local areaX2 = createCombatArea(AREA_EXCRAX2)
local areaX3 = createCombatArea(AREA_EXCRAX3)
local areaX4 = createCombatArea(AREA_EXCRAX4)
local areaX5 = createCombatArea(AREA_EXCRAX5)
local areaX6 = createCombatArea(AREA_EXCRAX6)
local areaX7 = createCombatArea(AREA_EXCRAX7)
local areaX8 = createCombatArea(AREA_EXCRAX8)
local areaX9 = createCombatArea(AREA_EXCRAX9)
local areaX10 = createCombatArea(AREA_EXCRAX10)
local areaX11 = createCombatArea(AREA_EXCRAX11)
local areaX12 = createCombatArea(AREA_EXCRAX12)
local areaX13 = createCombatArea(AREA_EXCRAX13)
local areaX14 = createCombatArea(AREA_EXCRAX14)
local areaX15 = createCombatArea(AREA_EXCRAX15)
local areaX16 = createCombatArea(AREA_EXCRAX16)
local areaX17 = createCombatArea(AREA_EXCRAX17)
local areaX18 = createCombatArea(AREA_EXCRAX18)
local areaX19 = createCombatArea(AREA_EXCRAX19)
local areaX20 = createCombatArea(AREA_EXCRAX20)

setCombatArea(combatX1,areaX1)
setCombatArea(combatX2,areaX2)
setCombatArea(combatX3,areaX3)
setCombatArea(combatX4,areaX4)
setCombatArea(combatX5,areaX5)
setCombatArea(combatX6,areaX6)
setCombatArea(combatX7,areaX7)
setCombatArea(combatX8,areaX8)
setCombatArea(combatX9,areaX9)
setCombatArea(combatX10,areaX10)
setCombatArea(combatX11,areaX11)
setCombatArea(combatX12,areaX12)
setCombatArea(combatX13,areaX13)
setCombatArea(combatX14,areaX14)
setCombatArea(combatX15,areaX15)
setCombatArea(combatX16,areaX16)
setCombatArea(combatX17,areaX17)
setCombatArea(combatX18,areaX18)
setCombatArea(combatX19,areaX19)
setCombatArea(combatX20,areaX20)



-------------------------------------------------------------------
setCombatArea(combat, combatArea)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 1, 1, 1, 1)

setCombatArea(combatStun, combatAreaStun)
setCombatParam(combatStun, COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)
setCombatParam(combatStun, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combatStun, COMBAT_FORMULA_LEVELMAGIC, 1, 1, 1, 1)

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
			doCreatureSetNoMove(param.cid,true)
			affectedList[pid] = getCreaturePosition(pid)
			tempPos = getCreaturePosition(pid)
			diferenceXY.x = param.pos.x - tempPos.x
			diferenceXY.y = param.pos.y - tempPos.y
			teleportPositions[pid] = diferenceXY				
			doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_BLUE, getCreatureName(pid) .. " was added to the list.")
		end		
	end
	return #affectedList ~= 0
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
		return -1
	end

	if isPlayer(memberTmp.uid) then			
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
			return 1
		end
	end	

	-- Case 1 [me] [member1]  [member2]	
	posTmp.x = pos.x + 1
	posTmp.y = pos.y
	posTmp.z = pos.z
	memberTmp = getTopCreature(posTmp)	
	if memberTmp == nil then
		return -1
	end

	if isPlayer(memberTmp.uid) then			
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
			return 2
		end
	end

	-- Case 1 [member1] [member2]  [me]	
	posTmp.x = pos.x - 2
	posTmp.y = pos.y
	posTmp.z = pos.z
	memberTmp = getTopCreature(posTmp)	
	if memberTmp == nil then
		return -1
	end

	if isPlayer(memberTmp.uid) then				
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
			return 3
		end
	end

	return false
end

function returnToOriginalPosition(param)
	
	if #affectedList ~= 0 then
		for i,v in pairs(affectedList) do
			doTeleportThing(i, v)		
			local health = getCreatureMaxHealth(i)
			health = health * (-1)
			doCreatureAddHealth(i,health)
			doSendMagicEffect(v, CONST_ME_YALAHARIGHOST)
		end
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

	db.executeQuery("UPDATE `global_spells` SET `in_use` = " .. 0 .. " WHERE `id` = 1")
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
		if getAffectedPlayers(param) then
			local tempPosition = {x=0,y=0,z=0}
			for i, v in pairs(affectedList) do		
				--doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_RED, "[" .. i .. "]FROM POS TO: {" .. teleportPositions[i].x .. "," .. teleportPositions[i].y .. "," .. teleportPositions[i].z .. "}")			
				doCreatureSetNoMove(i, true)
				tempPosition.x = centerArea.x - teleportPositions[i].x
				tempPosition.y = centerArea.y - teleportPositions[i].y
				--doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_RED, "[" .. i .. "]TELEPORTING TO: {" .. tempPosition.x .. "," .. tempPosition.y .. "," .. tempPosition.z .. "}")	
				doTeleportThing(i, tempPosition)
			end
		end
		tempPosition = {x=0,y=0,z=0}

		tempPosition.x = centerArea.x - 1
		tempPosition.y = centerArea.y
		tempPosition.z = centerArea.z
		doTeleportThing(teamList[1], tempPosition)
		doSendMagicEffect(tempPosition, CONST_ME_YALAHARIGHOST)
		doTeleportThing(teamList[2], centerArea)
		doSendMagicEffect(centerArea, CONST_ME_YALAHARIGHOST)
		tempPosition = {x=0,y=0,z=0}
		tempPosition.x = centerArea.x + 1
		tempPosition.y = centerArea.y
		tempPosition.z = centerArea.z
		doTeleportThing(teamList[3], tempPosition)
		doSendMagicEffect(tempPosition, CONST_ME_YALAHARIGHOST)
		addEvent(returnToOriginalPosition, 8000, param)
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
		if param.casteable == 1 then			
			addEvent(animation, 0, param)
			addEvent(spellCallBack, 5000, param)	
			db.executeQuery("UPDATE `global_spells` SET `in_use` = " .. 1 .. " WHERE `id` = 1")	
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
		db.executeQuery("UPDATE `global_spells` SET `in_use` = " .. 0 .. " WHERE `id` = 1")
	end
end

function ruxaExcramation(cid, pos)
	doCreatureSetNoMove(cid, true)
	local param = {}
	param.cid = cid
	param.pos = getCreaturePosition(cid)
	param.count = 0
	param.casteable = isCasteable(cid, param.pos)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[XX] CASO " .. param.casteable)
	if param.casteable ~= -1 then
		if prepareSpell(cid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[x]Spell Prepared!")
			--if getReadyPlayers(cid) == 3 then	
			--	addEvent(animation, 0, param)
			--	addEvent(spellCallBack, 5000, param)
			--	doCreatureSay(cid,"YOU ARE DOOOOOOMED",MESSAGE_EVENT_ORANGE)	
			--	addEvent(abortSpell, 5000, param)
			--else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[x]Waiting for the others!")
				addEvent(waitTeam, 5000, param)				
			--end
		else
			db.executeQuery("UPDATE `global_spells` SET `in_use` = " .. 0 .. " WHERE `id` = 1")
		end
	end	
end

--setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "ruxaExcramation")

function onCastSpell(cid, var)
	ruxaExcramation(cid, getCreaturePosition(cid))	
	addEvent(doCombat, 1000, cid, combatStun, var)

	addEvent(doCombat, 10000, cid, combatS1, var)
	addEvent(doCombat, 10200, cid, combatS2, var)
	addEvent(doCombat, 10400, cid, combatS3, var)
	addEvent(doCombat, 10600, cid, combatS4, var)
	addEvent(doCombat, 10800, cid, combatS5, var)

	addEvent(doCombat, 11000, cid, combatX1, var)
	addEvent(doCombat, 11200, cid, combatX2, var)
	addEvent(doCombat, 11400, cid, combatX3, var)
	addEvent(doCombat, 11600, cid, combatX4, var)
	addEvent(doCombat, 11800, cid, combatX5, var)
	addEvent(doCombat, 12000, cid, combatX6, var)
	addEvent(doCombat, 12200, cid, combatX7, var)
	addEvent(doCombat, 12400, cid, combatX8, var)
	addEvent(doCombat, 12600, cid, combatX9, var)
	addEvent(doCombat, 12800, cid, combatX10, var)
	addEvent(doCombat, 13000, cid, combatX11, var)
	addEvent(doCombat, 13200, cid, combatX12, var)
	addEvent(doCombat, 13400, cid, combatX13, var)
	addEvent(doCombat, 13600, cid, combatX14, var)
	addEvent(doCombat, 13800, cid, combatX15, var)
	addEvent(doCombat, 14000, cid, combatX16, var)
	addEvent(doCombat, 14200, cid, combatX17, var)
	addEvent(doCombat, 14400, cid, combatX18, var)
	addEvent(doCombat, 14600, cid, combatX19, var)
	addEvent(doCombat, 14800, cid, combatX20, var)


	return doCombat(cid, combat, var)
end