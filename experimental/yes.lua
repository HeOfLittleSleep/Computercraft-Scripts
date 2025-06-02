-- local has_block, data = turtle.inspect()
-- if has_block then
--   print(textutils.serialise(data))
--   -- {
--   --   name = "minecraft:oak_log",
--   --   state = { axis = "x" },
--   --   tags = { ["minecraft:logs"] = true, ... },
--   -- }
-- else
--   print("No block in front of the turtle")
-- end



-- function isRedSideValid(uInput)
-- 	local validSides = {"left", "right", "front", "back"}
-- 	local valueFound = false
-- 
-- 	for i = 1, #validSides, 1 do
-- 		if validSides[i] == uInput then
-- 			valueFound = true
-- 		end
-- 	end
-- 
-- 	return valueFound
-- end

--term.clear()
--if fs.exists("rc-RedIn") == false then
--	term.setCursorPos(1, 1)
--	print("Define which side to monitor for redstone power.")
--	print("  Options are: front, back, left, or right")
--	term.setCursorPos(13, 9)
--	print("------------------------")
--	term.setCursorPos(13, 10)
--	print("|                      |")
--	term.setCursorPos(13, 11)
--	print("------------------------")
--
--	term.setCursorPos(14, 10)
--	input = read()
--
--	if isRedSideValid(input) == true then
--		redSide = input
--		local fh = fs.open("rc-RedIn", "a")
--		fh.flush()
--		fh.writeLine(input)
--		fh.close()
--	else
--		error("Invalid input submited. Run program again")
--	end
--
--	term.clear()
--	term.setCursorPos(1, 1)
--end







has_block, data = turtle.inspect()
print(has_block)
fh = fs.open("inspect-output.txt", "w+")
fh.flush()
fh.writeLine(textutils.serialise(data))
fh.close()
print("check inspect-output.txt for output")



has_block, data = turtle.inspect()
if data.tags["minecraft:logs"] then
	print("This is a log!")
else
	print("This is not a log.")
end
