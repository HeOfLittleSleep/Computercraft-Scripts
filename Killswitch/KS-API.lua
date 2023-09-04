-- KillSwitch API!! Have you ever wanted the option to
-- run an existing script with the option to kill it
-- remotely at any point? Well, that is what this API
-- hopes to provide. Basically using ks.run(scriptName, netID)
-- will launch a specified script in a new multishell tab,
-- then then wait for a kill signal from clients. Running
-- ks.kill(hostname) will send a kill signal over rednet to the
-- specified hostname.

