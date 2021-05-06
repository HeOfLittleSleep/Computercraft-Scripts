rednet.open("top")  --replace top with whatever side the modem is on
rednet.host("RPC", "PC-Hostname")  --be sure to change "PC-Hostname" to whatever you want
                                   --this computer's hostname to be

while true do
	id, msg = rednet.receive()

	if msg == "0" then  -- set power to off
		redstone.setOutput("top", false)
		rednet.send(id, "redstone output was turned off")
	elseif msg == "1" then  --set power to on
		redstone.setOutput("top", true)
		rednet.send(id, "redstone output was turned on")
	elseif msg == "toggle" then  -- toggle power status
		if redstone.getOutput("top") == false then
			redstone.setOutput("top", true)
		rednet.send(id, "redstone output was turned on")
		else
			redstone.setOutput("top", false)
		rednet.send(id, "redstone output was turned off")
		end
	elseif msg == "q" then  -- query power status
		rednet.send(id, "redstone status is: "..redstone.getOutput())
	else
		rednet.send(id, "invalid input received")
	end
end