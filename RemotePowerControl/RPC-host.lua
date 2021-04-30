rednet.open("top")  --replace top with whatever side the modem is on

while true do
	id, msg = rednet.receive()

	if msg == "0" then  -- set power to off
		redstone.setOutput("left", false)
	end
	if msg == "1" then  --set power to on
		redstone.setOutput("left", false)
	end
	if msg == "toggle" then  -- toggle power status
		if redstone.getOutput("left") == false then
			redstone.setOutput("left", true)
		else
			redstone.setOutput("left", false)
		end
	end
	if msg == "q" then  -- query power status
		redstone.getOutput("left")
	end
end