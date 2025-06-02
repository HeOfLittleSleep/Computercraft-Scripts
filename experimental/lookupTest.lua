rednet.open("top")

local lookupID = {rednet.lookup("TestProto")}

for i=1,#lookupID do
	print("Found a server on channel: "..lookupID[i])
end