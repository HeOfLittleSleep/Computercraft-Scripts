--program that will monitor and regulate a big reactor

redSide = nil
reactors = {peripheral.find("BigReactors-Reactor")}
reactor = reactors[1]

function isRedSideValid(uInput)
	local validSides = {"left", "right", "front", "back"}
	local valueFound = false

	for i = 1, #list, 1 do
		if list[i] == uInput then
			valueFound = true
		end
	end

	return valueFound
end

term.clear()
if
	fs.exists("rc-RedIn") == false  --checks if file exists
then
	term.setCursorPos(1, 1)
	print("Define which side to monitor for redstone power.")
	print("  Options are: front, back, left, or right")
	term.setCursorPos(13, 9)
	print("------------------------")
	term.setCursorPos(13, 10)
	print("|                      |")
	term.setCursorPos(13, 11)
	print("------------------------")

	term.setCursorPos(14, 10)
	input = read()

	if input == "left" or
	input == "right" or
	input == "front" or
	input == "back" then
		fs.open("rc-RedIn", "w")
		local fh = fs.open("rc-RedIn", "a")
		h.flush()
		h.writeLine(input)
		h.close()

		redSide = input
	else
		error("Invalid input submited. Run program again")
	end



	term.clear()
	term.setCursorPos(1, 1)
else
	local fh = fs.open("rc-RedIn", "r")
	redSide = fh.readLine()
	print(redSide)
	h.close()
end

if redSide ~= nil then
	--redstone.setOutput(redSide, true)
	print("redstone monitor side was set to "..redSide)
else
	error("data read from config was NIL")
end

if
	reactor ~= nil
then
	if
		reactor.mbIsAssembled()
	then
		print("reactor was found!")
		print(redstone.getAnalogInput(redSide))
	else
		print("Reactor was found, but is not functional")
	end
else
	print("Reactor was not found")
end
