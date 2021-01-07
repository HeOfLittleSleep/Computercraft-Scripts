while true do
	term.clear()
	term.setCursorPos(10, 1)
	print("PLEASE ENTER SECURE PASSPHRASE")

	term.setCursorPos(13, 9)
	print("------------------------")
	term.setCursorPos(13, 10)
	print("|                      |")
	term.setCursorPos(13, 11)
	print("------------------------")

	term.setCursorPos(14, 10)
	local input = read("*")
	if input == "EnterPasswordHere" then
		redstone.setOutput("left", true)
		redstone.setOutput("right", true)
		
		term.clear()
		term.setCursorPos(1, 10)
		print("*******************ACCESS*GRANTED******************")
		sleep(7)
		
		redstone.setOutput("left", false)
		redstone.setOutput("right", false)
	else
		term.clear()
		term.setCursorPos(1, 10)
		print("*******************ACCESS*DENIED*******************")
		sleep(3)
	end
end