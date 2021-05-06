local tArgs = { ... }

hostname = tArgs[1]
if tArgs[1] == nil then
	messageToSend = "toggle"
else
	messageToSend = tArgs[1]
end

rednet.open("back")
rednet.host("RPC", "PC-Hostname")

rednet.send(rednet.lookup(hostname), messageToSend, "RPC")

id, rMessage,  = rednet.receive("RPC")
print(rMessage)