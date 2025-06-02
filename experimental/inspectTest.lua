has_block, data = turtle.inspect()
if data.tags["minecraft:logs"] then
	print("This is a log!")
else
	print("This is not a log.")
end