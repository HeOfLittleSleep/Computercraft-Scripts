--To use this program, run it with 2 parameters: remote hostname, message to send.
--this will send the chosen message (which needs to be one of 4 options, look in 
--the host script code) to the specified computer hostname. running the program with
--just the hostname parameter will default the message to "toggle"

local tArgs = { ... }

hostname = tArgs[1]   --sets hostname to first parameter
if tArgs[2] == nil then  --sets message to second parameter, or "toggle" if none is given
	messageToSend = "toggle"
else
	messageToSend = tArgs[2]
end

rednet.open("back")
rednet.host("RPC", "client-PC")  --be sure to change "client-PC" to whatever you want
                                   --this computer's hostname to be
rednet.send(rednet.lookup("RPC", hostname), messageToSend, "RPC")

id, rMessage = rednet.receive("RPC", 5) --waits for confirmation from host PC. returns
if rMessage == nil then					 --an error message if no message is received after 5 seconds
	print("never got response from remote host")
else
	print(rMessage)
end