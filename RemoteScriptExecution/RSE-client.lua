-- add descriptive comment here
local tArgs = { ... } --collect parameters from run command

if tArgs[1] == nil then  --sets hostname to first parameter if first parameter is not nil
	error('Error:  missing hostname parameter. Please run again like so:\n"[script].lua [remote hostname] [message]"')
else
	hostname = tArgs[1]
end

messageToSend = tArgs[2]

sides = {"top","back","left","right","bottom","front"} -- this block iterates through each side of
for i=1, #sides do                                     -- the computer find a modem, and opens rednet 
	if peripheral.getType(sides[i]) == "modem" then    -- on the first side that it finds one on
		mside = sides[i]
		break
	end
end

rednet.open(mside)
rednet.host("RSE", "RSE-Client")  --be sure to change "client-PC" to whatever you want
                                 --this computer's hostname to be
if rednet.lookup("RSE", hostname) == nil then  --checks that hostname is valid
	error("Error:  host not found")
end

rednet.send(rednet.lookup("RSE", hostname), messageToSend, "RSE")
id, rMessage, protocol = rednet.receive("RSE") --waits for confirmation from host PC. returns
if rMessage == nil then					       --an error message if no message is received after 5 seconds
	print("never got response from remote host")
	rednet.close(mside)
else
	term.clear()
	term.setCursorPos(1,1)
	print(rMessage)
	rednet.close(mside)
end