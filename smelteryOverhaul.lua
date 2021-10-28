validNodeNum = false
sNodes = 0

while validNodeNum == false do
	term.clear()
	term.setCursorPos(10, 8)
	print("How many slave nodes are there?")
	term.setCursorPos(24, 10)
	print("[   ]")

	term.setCursorPos(25, 10)
	local sNodes = read()
	if tonumber(sNodes) == nil or tonumber(sNodes) < 0 then
		term.clear()
		term.setCursorPos(16,10)
		print("Bad Input Fuckwit!")
		term.setCursorPos(14,11)
		print("Try again in 5 seconds")
		sleep(5)
	else
		validNodeNum = true
	end

	return sNodes
end

while true do
	term.clear()
	term.setCursorPos(10, 8)
	print("Amount of things to un-molten:")
	term.setCursorPos(24, 10)
	print("[   ]")
	term.setCursorPos(25, 10)
	local QueueTotal = read()
	
	if tonumber(QueueTotal) == nil or tonumber(QueueTotal) < 1 then
		term.clear()
		term.setCursorPos(6,10)
		print("Invalid input fuckwit!")
		term.setCursorPos(14,11)
		print("Try again in 5 seconds")
		sleep(5)
	else
		term.clear()
		term.setCursorPos(9, 8)
		print("Un-molten frequency (wait timer):")
		term.setCursorPos(24, 10)
		print("[   ]")
		term.setCursorPos(25, 10)
		local WaitTimer = read()
		
		if tonumber(WaitTimer) == nil or tonumber(WaitTimer) < 1 then
			term.clear()
			term.setCursorPos(6,10)
			print("Invalid input fuckwit!")
			term.setCursorPos(14,11)
			print("Try again in 5 seconds")
			sleep(5)
		else
			local sQueue = math.floor(QueueTotal / (sNodes + 1))
			local mQueue = QueueTotal - (sQueue * (sNodes + 1)) + sQueue

			if sNodes > 0 then
				rednet.open("top")
				rednet.broadcast("SA-SlaveNode "..sQueue.." "..WaitTimer)
				rednet.close("top")
			end

			for i = 1, mQueue, 1 do
				term.clear()
				term.setCursorPos(1, 1)
				print("un-moltened "..(i - 1).." out of "..mQueue.." things")

				redstone.setOutput("bottom", true)
				sleep()
				redstone.setOutput("bottom", false)

				sleep(WaitTimer)   --The number in parentheses is how long the program will
			end					   --wait in seconds before pouring the next block.
		end
	end
end