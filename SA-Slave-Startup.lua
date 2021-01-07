rednet.open("top")

while true do
	--term.clear()
	term.setCursorPos(1, 1)
	print("Waiting for orders from Master node...")
	id, msg = rednet.receive()

	shell.run(msg)
end