-- KillSwitch API!! Have you ever wanted the option to
-- run an existing script with the option to kill it
-- remotely at any point? Well, that is what this API
-- hopes to provide. Basically using ks.run(scriptName, netID)
-- will launch a specified script in a new multishell tab,
-- then then wait for a kill signal from clients. Running
-- ks.kill(hostname) will send a kill signal over rednet to the
-- specified hostname.

function run(script, rednetID)
	os.run({multishell = multishell}, "prog", "arg1")  -- god I fucking hate this
	print("launching ecternal program...")

	tabID = multishell.launch(script)

	local sides = {"top","back","left",redOutSide,"bottom","front"} -- this block iterates through each side of
	for i=1, #sides do                                     -- the computer find a modem, and opens rednet 
		if peripheral.getType(sides[i]) == "modem" then    -- on the first side that it finds one on
			mside = sides[i]
			break
		end
	end
	rednet.open(mside)
	rednet.host("KillSwitch", rednetID)

	id, msg, proto = rednet.receive("KillSwitch")
	if msg == "kys" then  -- set power to off
		multishell.setFocus(tabID)
		os.queueEvent(shell.exit())
		sleep(2)
		error("running program was terminated by computer "..id)
	end

end



function kill(remoteID)
	--rednet.send
end