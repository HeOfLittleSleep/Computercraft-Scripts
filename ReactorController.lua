--program that will monitor and regulate a big reactor

function isRedSideValid()
	validSides = {"left", "right", "front", "back"}

	local fh = fs.open("rc-RedIn", "r")
	redSide = fh.readLine()
	h.close()

	local valueFound = false
	for i = 1, #list, 1 do
		if list[i] == redSide then
			valueFound = true
		end
	end

	return valueFound
end