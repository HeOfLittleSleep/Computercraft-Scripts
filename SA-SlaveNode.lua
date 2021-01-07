local QueueNum, WaitTimer = ...
QueueNum = tonumber(QueueNum)
WaitTimer = tonumber(WaitTimer)

for i = 1, QueueNum, 1 do
	term.clear()
	term.setCursorPos(1, 1)
	print("un-moltened "..(i - 1).." out of "..QueueNum.." things")

	redstone.setOutput("bottom", true)
	sleep()
	redstone.setOutput("bottom", false)

	sleep(WaitTimer)
end

term.clear()
term.setCursorPos(1, 1)
print("un-moltened "..QueueNum.." out of "..QueueNum.." things")