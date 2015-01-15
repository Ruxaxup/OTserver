function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 100 then
		leverPos = {x=997,y=1026,z=7,stackpos=1}
		lever = getThingFromPos(leverPos)
		stonePos = {x=1000,y=1026,z=7,stackpos=1}
		stone = getThingFromPos(stonePos)

		if item.itemid == 1945 then
			doRemoveItem(stone.uid,1)			
		  elseif item.itemid == 1946 then
		  	doCreateItem(1304,1,stonePos)
		end

	end
end