rednet.open("top")

while true do
	id, msg = rednet.receive()

	if msg == "jesus time" then
		if redstone.getOutput("left") == false then
			redstone.setOutput("left", true)
		else
			redstone.setOutput("left", false)
		end
	end
end