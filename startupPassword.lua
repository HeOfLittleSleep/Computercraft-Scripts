while true do
	term.clear()
	term.setCursorPos(1, 1)
	print("PLEASE ENTER SECURE PASSPHRASE:")
	
	local input = read("*")
	if input == "EnterPassswordHere" then
		restone.setOutput("left", true)
		restone.setOutput("right", true)
		
		sleep(10)
		
		restone.setOutput("left", false)
		restone.setOutput("right", false)
	end
end