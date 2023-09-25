term.clear()
term.setCursorPos(1, 1)
print("Is this terminal the master or slave node?\n(master/slave)")
local input = read()

if input == "master" then
	shell.run("pastebin get GjcRHtyC startup.lua")
elseif input == "slave" then
	shell.run("pastebin get bXpAsQL6 startup.lua")
	shell.run("pastebin get GZYKvk0W SA-SlaveNode.lua")
else
	error("Bad Input. please run the program again.")
end