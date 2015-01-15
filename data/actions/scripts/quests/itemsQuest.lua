local coalPos = {x=1005,y=1030,z=7}
local firePos = {x=1007,y=1030,z=7}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 41000 then
		local items = getTileItemById(firePos, 2151)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Item: " .. items.itemid)
		if (items ~= nil) then
			local count = items.type
			if count ~= 0 then
				if count == 100 then
					doCreateItem(2275,1,coalPos)
					doRemoveItem(items.uid,100)
				else
					doCreatureSay(cid,"You must put 100 talons",MESSAGE_EVENT_ORANGE)	
				end
			else
				doCreatureSay(cid,"Wrong item.",MESSAGE_EVENT_ORANGE)	
			end
		else
			doCreatureSay(cid,"Wrong item",MESSAGE_EVENT_ORANGE)	
		end
	end
	return true
end