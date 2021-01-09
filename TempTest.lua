while true do
	term.clear()

	term.setCursorPos(10, 8)
	print("Amount of things to un-molten:")
	term.setCursorPos(24, 10)
	print("[   ]")
	term.setCursorPos(25, 10)

	local QueueNum = read()
	if tonumber(queueNum) == nil then
		term.clear()
		term.setCursorPos(6,10)
		print("That wasn't even a number you fuckwit!")
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

		for i = 1, QueueNum, 1 do
			term.clear()
			term.setCursorPos(1, 1)
			print("un-moltened "..(i - 1).." out of "..QueueNum.." things")

			redstone.setOutput("bottom", true)
			sleep()
			redstone.setOutput("bottom", false)

			sleep(WaitTimer)   --The number in parentheses is how long the program will
		end				       --wait in seconds before pouring the next block.
	end
end