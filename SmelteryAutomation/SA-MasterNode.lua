term.clear()
term.setCursorPos(1,1)
print("Searching for available slave nodes...")
fndNodes = {rednet.lookup("smelteryAuto")}
sNodes = #fndNodes
print("found "..sNodes.." slave nodes!\nContinuing in 3 seconds")
sleep(3)

while true do
	term.clear()
	term.setCursorPos(10, 8)
	print("Amount of things to un-molten:")
	term.setCursorPos(24, 10)
	print("[   ]")
	term.setCursorPos(25, 10)
	QueueTotal = tonumber(read())
	
	if tonumber(QueueTotal) == nil or tonumber(QueueTotal) < 1 then
		term.clear()
		term.setCursorPos(16,10)
		print("Invalid input fuckwit!")
		term.setCursorPos(14,11)
		print("Try again in 5 seconds")
		sleep(5)
	else
		term.clear()
		term.setCursorPos(9, 8)
		print("Un-molten frequency (wait timer):")
		term.setCursorPos(9, 9)
		print("^(Add 2s for ingots, or 8s for blocks)")
		term.setCursorPos(24, 10)
		print("[   ]")
		term.setCursorPos(25, 10)
		WaitTimer = tonumber(read())
		
		if tonumber(WaitTimer) == nil or tonumber(WaitTimer) < 1 then
			term.clear()
			term.setCursorPos(16,10)
			print("Invalid input fuckwit!")
			term.setCursorPos(14,11)
			print("Try again in 5 seconds")
			sleep(5)
		else
			sQueue = math.floor(QueueTotal / (sNodes + 1))
			mQueue = QueueTotal - (sQueue * (sNodes + 1)) + sQueue

			if sNodes > 0 then
				rednet.open("top")
				rednet.broadcast("SA-SlaveNode "..sQueue.." "..WaitTimer, "smelteryAuto")
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
