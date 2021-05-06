--To use this program, run it with 2 parameters: remote hostname, message to send.
--this will send the chosen message (which needs to be one of 4 options, look in 
--the host script code) to the specified computer hostname. running the program with
--just the hostname parameter will default the message to "toggle"
local tArgs = { ... }

hostname = tArgs[1]
if tArgs[2] == nil then
	messageToSend = "toggle"
else
	messageToSend = tArgs[2]
end

rednet.open("back")
rednet.host("RPC", "PC-Hostname")  --be sure to change "PC-Hostname" to whatever you want
                                   --this computer's hostname to be
rednet.send(rednet.lookup(hostname), messageToSend, "RPC")

id, rMessage,  = rednet.receive("RPC", 5)
if rMessage == nil then
	print("never got response from remote host")
else
	print(rMessage)
end