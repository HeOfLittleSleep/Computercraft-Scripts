--To use this program, run it with 2 parameters: remote hostname, message to send.
--this will send the chosen message (which needs to be one of 4 options, look in 
--the host script code) to the specified computer hostname. running the program with
--just the hostname parameter will default the message to "toggle"

local tArgs = { ... } --collect parameters from run command

if tArgs[1] == nil then  --sets hostname to first parameter if first parameter is not nil
	error('Error:  missing hostname parameter.\nPlease run again as "script.lua [remote hostname]"')
else
	hostname = tArgs[1]
end
if rednet.lookup("RPC", hostname) == nil then  --checks that hostname is valid
	error("Error:  host not found")
end

if tArgs[2] == nil then  --sets message to second parameter, or to "toggle" if nil
	messageToSend = "toggle"
else
	messageToSend = tArgs[2]
end

rednet.open("back")
rednet.host("RPC", "client-PC")  --be sure to change "client-PC" to whatever you want
                                 --this computer's hostname to be
rednet.send(rednet.lookup("RPC", hostname), messageToSend, "RPC")
id, rMessage, protocol = rednet.receive("RPC") --waits for confirmation from host PC. returns
if rMessage == nil then					       --an error message if no message is received after 5 seconds
	print("never got response from remote host")
	rednet.close("back")
else
	print(rMessage)
	rednet.close("back")
end