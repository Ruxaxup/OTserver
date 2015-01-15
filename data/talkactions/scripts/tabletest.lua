local affectedList = {}

function onSay(cid, words, param, channel)
	local players = getPlayersOnline()	
	for _, pid in ipairs(players) do
		affectedList[pid] = getCreatureName(pid)
	end

	for i, v in pairs(affectedList) do
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, i .. ","..v)
	end
end