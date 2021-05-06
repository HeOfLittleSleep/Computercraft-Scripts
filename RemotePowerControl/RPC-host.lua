rednet.open("top")  --replace top with whatever side the modem is on
rednet.host("RPC", "PC-Hostname")

while true do
	id, msg = rednet.receive()

	if msg == "0" then  -- set power to off
		redstone.setOutput("top", false)
		rednet.send(id, "redstone output was turned off")
	end
	if msg == "1" then  --set power to on
		redstone.setOutput("top", true)
		rednet.send(id, "redstone output was turned on")
	end
	if msg == "toggle" then  -- toggle power status
		if redstone.getOutput("top") == false then
			redstone.setOutput("top", true)
		rednet.send(id, "redstone output was turned on")
		else
			redstone.setOutput("top", false)
		rednet.send(id, "redstone output was turned off")
		end
	end
	if msg == "q" then  -- query power status
		rednet.send(id, "redstone status is: "..redstone.getOutput())
	end
end