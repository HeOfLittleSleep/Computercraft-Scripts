--this script will contimually wait for messages from a client computer and will
--change the redstone output accordingly. works best if you name the file startup.lua.

rednet.open("top")  --replace top with whatever side the modem is on
rednet.host("RPC", "PC-Hostname")  --be sure to change "PC-Hostname" to whatever you want
                                   --this computer's hostname to be

while true do
	print("waiting for input from clients...")
	id, msg = rednet.receive()  --waits for message via rednet

	--this block checks the recieved message and sets redstone output accordingly.
	--It also sneds a confirmation back to the sender and prints the completed
	--operation and the id of the computer that sent the command
	if msg == "0" then  -- set power to off
		redstone.setOutput("top", false)
		rednet.send(id, "redstone output has been turned off")
		print("redstone output has been turned off by client: "..id)
	elseif msg == "1" then  --set power to on
		redstone.setOutput("top", true)
		rednet.send(id, "redstone output has been turned on")
		print("redstone output has been turned on by client: "..id)
	elseif msg == "toggle" then  -- toggle power status
		if redstone.getOutput("top") == false then
			redstone.setOutput("top", true)
			rednet.send(id, "redstone output has been turned on")
			print("redstone output has been turned on by client: "..id)
		else
			redstone.setOutput("top", false)
			rednet.send(id, "redstone output has been turned off")
			print("redstone output has been turned off by client: "..id)
		end
	elseif msg == "q" then  -- query power status
		rednet.send(id, "redstone status is: "..redstone.getOutput())
		print("status queried by client: "..id)
	else
		rednet.send(id, "invalid input received")
		print("invalid input received from client: "..id)
	end
end