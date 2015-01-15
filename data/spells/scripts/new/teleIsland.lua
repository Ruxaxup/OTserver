local islandPosition = {x=997,y=1032,z=7}

function onCastSpell(cid, var)
	if not isPlayerPzLocked(cid) then
		doTeleportThing(cid, islandPosition, true)
		doSendMagicEffect(islandPosition,CONST_ME_HOLYDAMAGE)
	end
	return true
end