--this script will contimually wait for messages from a client computer and will
--change the redstone output accordingly. works best if you name the file startup.lua.

redOutSide = "right"  -- This variable determines which side the computer will output the redstone signal.
                      -- Option for this variable are:  front, back, top, bottom, left, or right
sides = {"top","back","left",redOutSide,"bottom","front"} -- this block iterates through each side of
for i=1, #sides do                                     -- the computer find a modem, and opens rednet 
	if peripheral.getType(sides[i]) == "modem" then    -- on the first side that it finds one on
		mside = sides[i]
		break
	end
end
rednet.open(mside)
rednet.host("RPC", "host-pc")  --be sure to change "host-pc" to whatever you want
                                   --this computer's hostname to be

while true do
	print("waiting for input from clients...")
	id, msg, proto = rednet.receive("RPC")  --waits for message via rednet

	--this block checks the recieved message and sets redstone output accordingly.
	--It also sneds a confirmation back to the sender and prints the completed
	--operation and the id of the computer that sent the command
	if msg == "0" then  -- set power to off
		redstone.setOutput(redOutSide, false)
		rednet.send(id, "redstone output has been turned off", "RPC")
		print("redstone output has been turned off by client: "..id)
	elseif msg == "1" then  --set power to on
		redstone.setOutput(redOutSide, true)
		rednet.send(id, "redstone output has been turned on", "RPC")
		print("redstone output has been turned on by client: "..id)
	elseif msg == "toggle" then  -- toggle power status
		if redstone.getOutput(redOutSide) == false then
			redstone.setOutput(redOutSide, true)
			rednet.send(id, "redstone output has been turned on", "RPC")
			print("redstone output has been turned on by client: "..id)
		else
			redstone.setOutput(redOutSide, false)
			rednet.send(id, "redstone output has been turned off", "RPC")
			print("redstone output has been turned off by client: "..id)
		end
	elseif msg == "q" then  -- query power status
		rednet.send(id, "redstone status is: "..tostring(redstone.getOutput(redOutSide)), "RPC")
		print("status queried by client: "..id)
	else                    -- returns an error if none of the previous ifs execute
		rednet.send(id, "invalid input received", "RPC")
		print("invalid input received from client: "..id)
	end
end