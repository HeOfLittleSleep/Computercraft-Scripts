--This program is designed to automate the process of smelting with tinker's
--construct. Proper setup has the computer above the smeltery spout and a 
--hopper underneath the casting bin to pull cooled blocks out of it. 

while true do
	term.clear()
	term.setCursorPos(1, 1)
	print("Amount of things to un-molten:")
	local QueueNum = tonumber(read())

	term.clear()
	term.setCursorPos(1, 1)
	print("Un-molten frequency (wait timer):")
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