local walkable = {"grass", "floor", "tile", "debris", "sand"}

function canTeleport(name)
	for i = 1, table.getn(walkable), 1 do
		if string.find(name, walkable[i], 1) then
			return true
		end
	end
	return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local thing = getThingFromPos(toPosition)
	local name = getItemNameById(thing.itemid)
	local info = getTileInfo(toPosition)

	--if ( string.find(name, "water", 1) == nil) then
	if canTeleport(name) then
		if(not isPlayer(thing.uid)) then
			if not info.house then
				doTeleportThing(cid, toPosition)
				doSendMagicEffect(toPosition,CONST_ME_PURPLEENERGY)	
			else
				doCreatureSay(cid,"Que tramas -___-",MESSAGE_EVENT_ORANGE)	
			end
		else
			doCreatureSay(cid,"Hay un player ahi XD.",MESSAGE_EVENT_ORANGE)
		end
	else
		doCreatureSay(cid,"No te puedes teletransportar ahi.",MESSAGE_EVENT_ORANGE)
	end
end