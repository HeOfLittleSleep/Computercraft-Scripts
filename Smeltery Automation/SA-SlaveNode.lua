local sQueue, WaitTimer = ...
sQueue = tonumber(sQueue)
WaitTimer = tonumber(WaitTimer)

for i = 1, sQueue, 1 do
	term.clear()
	term.setCursorPos(1, 1)
	print("un-moltened "..(i - 1).." out of "..sQueue.." things")

	redstone.setOutput("bottom", true)
	sleep()
	redstone.setOutput("bottom", false)

	sleep(WaitTimer)
end

term.clear()
term.setCursorPos(1, 1)
print("un-moltened "..sQueue.." out of "..sQueue.." things")