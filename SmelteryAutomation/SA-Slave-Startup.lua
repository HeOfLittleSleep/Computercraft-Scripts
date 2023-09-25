term.clear()
term.setCursorPos(1, 1)
rednet.open("top")
rednet.host("smelteryAuto", tostring(os.getComputerID()))

--id, msg = rednet.receive("smelteryAuto")

while true do
	--term.clear()
	term.setCursorPos(1, 1)
	print("Waiting for orders from Master node...")
	id, msg = rednet.receive("smelteryAuto")

	print(msg)
	shell.run(msg)
end