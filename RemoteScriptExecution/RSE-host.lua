-- add descriptive comment here
sides = {"top","back","left","right","bottom","front"} -- this block iterates through each side of
for i=1, #sides do                                     -- the computer find a modem, and opens rednet 
	if peripheral.getType(sides[i]) == "modem" then    -- on the first side that it finds one on
		mside = sides[i]
		break
	end
end

secretCode = nil                    -- recplace nil with whatever you want the code to be
rednet.open(mside)
rednet.host("RSE", "RSE-host")  --be sure to change "host-pc" to whatever you want
                                   --this computer's hostname to be
while true do
	print("waiting for input from clients...")
	id, msg, proto = rednet.receive("RSE")  --waits for message via rednet

	--this block checks the recieved message and sets redstone output accordingly.
	--It also sneds a confirmation back to the sender and prints the completed
	--operation and the id of the computer that sent the command
	if msg == secretCode then  -- allow script execution
		os.run({},"[script].lua")
		rednet.send(id, "Authorization successful, script execution successful", "RSE")
		print("Successful script execution via client: "..id)
	else                       -- reject script execution request
		rednet.send(id, "Access code invalid. Remote script execution request is denied", "RSE")
		print("Access code invalid. Remote script execution request from PC "..id.." is denied")
	end
end