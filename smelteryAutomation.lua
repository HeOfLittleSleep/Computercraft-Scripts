--This program is designed to automate the process of smelting with tinker's
--construct. Proper setup has the computer above the smeltery spout and a 
--hopper underneath the casting bin to pull cooled blocks out of it. 

while true do
	term.clear()
	term.setCursorPos(1, 1)
	print("Amount of things to un-molten:")

	local input = read()

	for i = 1, input, 1 do
		term.clear()
		term.setCursorPos(1, 1)
		print("un-moltened "..(i - 1).." out of "..input.." things")

		redstone.setOutput("bottom", true)
		sleep()
		redstone.setOutput("bottom", false)

		sleep(45)   --The number in parentheses is how long the program will
	end				--wait in seconds before pouring the next block.
end