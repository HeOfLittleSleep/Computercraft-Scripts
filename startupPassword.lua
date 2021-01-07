while true do
	term.clear()
	term.setCursorPos(1, 1)
	print("PLEASE ENTER SECURE PASSPHRASE:")

	--term.setCursorPos()
	local input = read("*")
	if input == "EnterPasswordHere" then
		redstone.setOutput("back", true)
		redstone.setOutput("right", true)
		
		term.clear()
		term.setCursorPos(1, 10)
		print("*******************ACCESS*GRANTED******************")
		sleep(10)
		
		restone.setOutput("left", false)
		restone.setOutput("right", false)
	else
		term.clear()
		term.setCursorPos(1, 10)
		print("*******************ACCESS*DENIED*******************")
		sleep(4)
	end
end