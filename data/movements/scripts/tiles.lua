local config = {
	maxLevel = getConfigInfo('maximumDoorLevel')
}

local increasingItems = {[416] = 417, [426] = 425, [446] = 447, [3216] = 3217, [3202] = 3215, [11059] = 11060}
local decreasingItems = {[417] = 416, [425] = 426, [447] = 446, [3217] = 3216, [3215] = 3202, [11060] = 11059}
local depots = {2589, 2590, 2591, 2592}

local checkCreature = {isPlayer, isMonster, isNpc}
local function pushBack(cid, position, fromPosition, displayMessage)
	doTeleportThing(cid, fromPosition, false)
	doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
	if(displayMessage) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The tile seems to be protected against unwanted intruders.")
	end
end
 
function onStepIn(cid, item, position, fromPosition)
	if(not increasingItems[item.itemid]) then
		return false
	end
 
	if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, increasingItems[item.itemid])
	end

	if(item.actionid >= 194 and item.actionid <= 196) then
		local f = checkCreature[item.actionid - 193]
		if(f(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg1")
			pushBack(cid, position, fromPosition, false)
		end

		return true
	end
 
	if(item.actionid >= 191 and item.actionid <= 193) then
		local f = checkCreature[item.actionid - 190]
		if(not f(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg2")
			pushBack(cid, position, fromPosition, false)
		end

		return true
	end
 
	if(not isPlayer(cid)) then
		return true
	end

	if(item.actionid == 189 and not isPremium(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg3")
		pushBack(cid, position, fromPosition, true)
		return true
	end
 
	local gender = item.actionid - 186
	if(isInArray({PLAYERSEX_FEMALE,  PLAYERSEX_MALE, PLAYERSEX_GAMEMASTER}, gender)) then
		if(gender ~= getPlayerSex(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg4")
			pushBack(cid, position, fromPosition, true)
		end

		return true
	end
 
	local skull = item.actionid - 180
	if(skull >= SKULL_NONE and skull <= SKULL_BLACK) then
		if(skull ~= getCreatureSkullType(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg5")
			pushBack(cid, position, fromPosition, true)
		end
 
		return true
	end

	local group = item.actionid - 150
	if(group >= 0 and group < 30) then
		if(group > getPlayerGroupId(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg6")
			pushBack(cid, position, fromPosition, true)
		end
 
		return true
	end
 
	local vocation = item.actionid - 100
	if(vocation >= 0 and vocation < 50) then
		local playerVocationInfo = getVocationInfo(getPlayerVocation(cid))
		if(playerVocationInfo.id ~= vocation and playerVocationInfo.fromVocation ~= vocation) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg7")
			pushBack(cid, position, fromPosition, true)
		end

		return true
	end
 
	if(item.actionid >= 1000 and item.actionid <= config.maxLevel) then
		if(getPlayerLevel(cid) < item.actionid - 1000) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg8")
			pushBack(cid, position, fromPosition, true)
		end
 
		return true
	end
 
	if(item.actionid == 40000) then --LEARN SPELLS	
		if(getPlayerVocation(cid) == 0)	 then
			if (not getPlayerLearnedInstantSpell(cid, "Fierce Berserk Maton")) then
				doPlayerLearnInstantSpell(cid, "Fierce Berserk Maton")
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE ,"You've learned 'Fierce Berserk Maton'. Use 'super duper exori gran' to cast this spell. = ")
				doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "You've already learned this spell.")
				doSendMagicEffect(position, CONST_ME_BLOCKHIT)
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Only players with no vocation can learn this spell.")
			pushBack(cid, position, fromPosition, false)
		end		
		return true
	end

	if(item.actionid == 40001) then --LEARN SPELLS			
		if (not getPlayerLearnedInstantSpell(cid, "Teleport Island")) then
			doPlayerLearnInstantSpell(cid, "Teleport Island")
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE ,"You've learned 'Teleport Island'. Use 'utamo ina island' to cast this spell. = ")
			doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "You've already learned this spell.")
			doSendMagicEffect(position, CONST_ME_BLOCKHIT)		
		end		
		return true
	end	

	if(item.actionid ~= 0 and getPlayerStorageValue(cid, item.actionid) <= 0) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Msg9 " .. item.actionid)
		pushBack(cid, position, fromPosition, true)
		return true
	end
 
	if(getTileInfo(position).protection) then
		local depotPos, depot = getCreatureLookPosition(cid), {}
		depotPos.stackpos = STACKPOS_GROUND
		while(true) do
			if(not getTileInfo(depotPos).depot) then
				break
			end
 
			depotPos.stackpos = depotPos.stackpos + 1
			depot = getThingFromPos(depotPos)
			if(depot.uid == 0) then
				break
			end
 
			if(isInArray(depots, depot.itemid)) then
				local depotItems = getPlayerDepotItems(cid, getDepotId(depot.uid))
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Your depot contains " .. depotItems .. " item" .. (depotItems > 1 and "s" or "") .. ".")
				break
			end
		end

		return true
	end

	return false
end
 
function onStepOut(cid, item, position, fromPosition)
	if(not decreasingItems[item.itemid]) then
		return false
	end
 
	if(not isPlayerGhost(cid)) then
		doTransformItem(item.uid, decreasingItems[item.itemid])
		return true
	end

	return false
end
