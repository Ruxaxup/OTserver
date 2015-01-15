function onSay(cid, words, param, channel)	
	local guid = getPlayerGUID(cid)
	local resultId = db.storeQuery("SELECT * FROM `players` WHERE `id` = " .. guid)
	db.executeQuery("UPDATE `players` SET `skull` = 0 WHERE `id` = " .. guid)
	db.executeQuery("UPDATE `players` SET `skulltime` = 0 WHERE `id` = " .. guid)
	db.executeQuery("DELETE FROM `player_killers` WHERE `player_id` = " .. guid)
	doCreatureSetSkullType(cid, 0)
	doCreatureSay(cid,"Ya puedo matar mas 3:]",MESSAGE_EVENT_ORANGE)
end