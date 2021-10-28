validNodeNum = false
sNodes = "DEFAULT"
sNodesT = "DEFAULT"

while validNodeNum == false do
	term.clear()
	term.setCursorPos(10, 8)
	print("How many slave nodes are there?")
	term.setCursorPos(24, 10)
	print("[   ]")

	term.setCursorPos(25, 10)
	local sNodes = tonumber(read())
	if tonumber(sNodes) == nil or tonumber(sNodes) < 0 then
		term.clear()
		term.setCursorPos(16,10)
		print("Bad Input Fuckwit!")
		term.setCursorPos(14,11)
		print("Try again in 5 seconds")
		sleep(5)
	else
		print("sNodes "..sNodes)
		sleep(3)

		sNodes = sNodes +1
		print("added 1 to sNodes")
		sleep(2)
		validNodeNum = true
	end	
	term.clear()
	print(sNodes)
	sleep(3)
	sNodesT = sNodes
end

term.clear()
print(sNodes)
--print(sNodesT)
sleep(3)

while true do
	term.clear()
	term.setCursorPos(10, 8)
	print("Amount of things to un-molten:")
	term.setCursorPos(24, 10)
	print("[   ]")
	term.setCursorPos(25, 10)
	local QueueTotal = tonumber(read())
	
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
		local WaitTimer = tonumber(read())
		
		if tonumber(WaitTimer) == nil or tonumber(WaitTimer) < 1 then
			term.clear()
			term.setCursorPos(6,10)
			print("Invalid input fuckwit!")
			term.setCursorPos(14,11)
			print("Try again in 5 seconds")
			sleep(5)
		else
			print("QueueTotal"..QueueTotal.." | ")
			print(sNodesT)
			sleep(3)
			local sQueue = math.floor(QueueTotal / (sNodesT + 1))
			local mQueue = QueueTotal - (sQueue * (sNodesT + 1)) + sQueue

			--if sNodes > 0 then
				--rednet.open("top")
				--rednet.broadcast("SA-SlaveNode "..sQueue.." "..WaitTimer)
				--rednet.close("top")
			--end

			print("mQueue is "..mQueue)
			sleep(3)

			for i = 1, mQueue, 1 do
				print("got into for loop")
				sleep(3)
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