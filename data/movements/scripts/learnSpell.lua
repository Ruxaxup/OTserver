function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(item.actionid == 40000) then
		if (getPlayerLearnedInstantSpell(cid, "Fierce Berserk Maton") ~= 0) then
			doPlayerLearnInstantSpell(cid, "Fierce Berserk Maton")
		else
			doPlayerBroadcastMessage(cid, "You've already learned this spell.")
		end
	end
end