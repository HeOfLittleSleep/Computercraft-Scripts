term.clear()
term.setCursorPos(1, 1)
rednet.open("top")

while true do
	--term.clear()
	term.setCursorPos(1, 1)
	print("Waiting for orders from Master node...")
	id, msg = rednet.receive()

	print(msg)
	shell.run(msg)
end