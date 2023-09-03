-- A program that will monitor the power status of an extreme reactor.
-- It will turn the reactor off when the external battery bank is low
-- and turn the reactor off when the internal power bank is full. It
-- monitors the external battery bank levels by measuring it's
-- redstone signal strength to a configured side of the computer.
-- The program prompts you to configure the redstone monitoring side
-- on first run, then saves it to the file "rc-RedIn". You can change
-- which side is listening after the first run by either deleting or
-- editing "rc-RedIn". if you don't wish to use an external power bank,
-- then you can simply set up the redstone output with a reactor
-- redstone port.

reactors = {peripheral.find("BigReactors-Reactor")}
reactor = reactors[1]
redSide = nil
secs = 0
-------------------------functions----------------------------
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
----------------------end-Functions---------------------------
---------------------initialization---------------------------
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
	fh.close()

	if isRedSideValid(readConf) == true then
		redSide = readConf	
	else
		error("\nInvalid Config data. Check rc-RedIn")
	end
end

if reactor ~= nil then
	if reactor.mbIsAssembled() then
		print("reactor was found!")
	else
		print("Reactor was found, but is not functional")
	end
else
	error("Reactor was not found")
end

reactor.setAllControlRodLevels(0)
print("reactor initialization complete, monitoring power levels...")
-----------------end-initialization-------------------------
while true do
	if redstone.getAnalogInput(redSide) < 8 and reactor.getActive() == false then
		reactor.setActive(true)
		print("energy storage levels are low after "..secs.." seconds. Activating reactor until full")
		secs = 0
	elseif reactor.getEnergyStored() > (reactor.getEnergyCapacity() - 100)
	and reactor.getActive() == true then
		reactor.setActive(false)
		print("enrgy storage is filled after "..secs.." seconds, deactivating reactor")
		secs = 0
	end
	sleep(1)
	secs = secs + 1
end