--program that will monitor and regulate a big reactor

redSide = nil
reactors = {peripheral.find("BigReactors-Reactor")}
reactor = reactors[1]

function isRedSideValid(uInput)
	local validSides = {"left", "right", "front", "back"}
	local valueFound = false

	for i = 1, #validSides, 1 do
		if validSides[i] == uInput then
			valueFound = true
		end
	end

	return valueFound
end

term.clear()
if fs.exists("rc-RedIn") == false then
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

	if isRedSideValid(input) == true then
		redSide = input
		local fh = fs.open("rc-RedIn", "a")
		fh.flush()
		fh.writeLine(input)
		fh.close()
	else
		error("Invalid input submited. Run program again")
	end

	term.clear()
	term.setCursorPos(1, 1)
else
	local fh = fs.open("rc-RedIn", "r")
	readConf = fh.readLine()
	--print(redSide)
	fh.close()

	if isRedSideValid(readConf) == true then
		redSide = readConf	
	else
		error("\nInvalid Config data. Check rc-RedIn")
	end
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
