term.clear()
term.setCursorPos(1, 1)
rednet.open("top")
rednet.host("smelteryAuto", tostring(os.getComputerID()))

while true do
	term.setCursorPos(1, 1)
	print("Waiting for orders from Master node...")
	id, msg = rednet.receive("smelteryAuto")
	queue = msg[1]
	timer = msg[2]

	for i = 1, queue, 1 do
		term.clear()
		term.setCursorPos(1, 1)
		print("un-moltened "..(i - 1).." out of "..queue.." things")

		redstone.setOutput("bottom", true)
		sleep()
		redstone.setOutput("bottom", false)

		sleep(timer)
	end
end