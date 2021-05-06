local tArgs = { ... }

if tArgs[1] == nil then
	dataTest = "toggle"
	print(dataTest)
else
	dataTest = tArgs[1]
	print(dataTest)
end