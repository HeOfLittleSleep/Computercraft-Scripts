term.clear()
term.setCursorPos(10, 8)
print("How many slave nodes are there?")
term.setCursorPos(24, 10)
print("[   ]")

term.setCursorPos(25, 10)
local sNodes = tonumber(read())

while true do
	term.clear()
	term.setCursorPos(10, 8)
	print("Amount of things to un-molten:")
	term.setCursorPos(24, 10)
	print("[   ]")

	term.setCursorPos(25, 10)
	local QueueTotal = tonumber(read())

	term.clear()
	term.setCursorPos(9, 8)
	print("Un-molten frequency (wait timer):")
	term.setCursorPos(24, 10)
	print("[   ]")

	term.setCursorPos(25, 10)
	local WaitTimer = tonumber(read())

	local sQueue = math.floor(QueueTotal / (sNodes + 1))
	local mQueue = sQueue * (sNodes + 1)

	rednet.open("top")
	rednet.broadcast("SA-SlaveNode "..sQueue.." "..WaitTimer)
	rednet.close("top")


	for i = 1, mQueue, 1 do
		term.clear()
		term.setCursorPos(1, 1)
		print("un-moltened "..(i - 1).." out of "..mQueue.." things")

		redstone.setOutput("bottom", true)
		sleep()
		redstone.setOutput("bottom", false)

		sleep(WaitTimer)   --The number in parentheses is how long the program will
	end				       --wait in seconds before pouring the next block.
end