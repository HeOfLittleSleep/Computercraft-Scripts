--variable initialization--------------
doLoop = true

distance = 1
number = 1

SlotNum = 1

NextRowNum = -1            --Which column, out of "tColumns", Will the bot be on next
--config-------------------------------
tColumns = 5           --Set this to the number of tree columns your farm has
tRows = 6              --Set this to the number of tree rows your farm has

MaxSaps = tColumns * tRows    --max amount of saplings that could be planted in a single run
------functions------------------------
function Go(distance)                             --this moves the turtle forward [distance] times.
	print("moving "..distance." blocks forward")  --Good for moving without repeating turtle.forward 20 times
	for i = 1, distance, 1 do
		while turtle.forward() == false do
			sleep(1)
		end
	end
end

function GetAboveBlockId()                    --returns the block ID of the block above the turtle
	BlockState, BlockName = turtle.inspectUp()
	
	return BlockName.name
end

function GetFrontBlockId()                    --returns the block ID of the block in front the turtle
	BlockState, BlockName = turtle.inspect()
	
	return BlockName.name
end

function GetItemID()                          --returns the item ID of the item in the item slot
	local ItemData = turtle.getItemDetail()   --selected by the turtle
	
	return ItemData.name
end

function DetectLeaves(number)                 --same as Go() except it checks for leaves in front of the turtle
	for i = 1, number, 1 do                   --and breaks them to clear a path
	
		if GetFrontBlockId() == "minecraft:leaves" or GetFrontBlockId() == "ic2:leaves" then
			turtle.dig()
			Go(1)
		elseif turtle.detect() == true then
			HarvestTree()
		else
			Go(1)
		end
	end
end

function HarvestTree() -- This function instructs the 
	turtle.dig()       -- bot to chop down a tree when called
	Go(1)
	turtle.digDown()
	while GetItemID() ~= "minecraft:sapling" and GetItemID() ~= "ic2:sapling" do
		if SlotNum == 16 then
			error("ran out of saplings")
		else
			SlotNum = SlotNum + 1
			turtle.select(SlotNum)
		end
	end
	
	turtle.placeDown()
	
	while GetAboveBlockId() ~= "minecraft:leaves" and GetAboveBlockId() ~= "ic2:leaves" and turtle.inspectUp() ~= false do
		turtle.digUp()
		turtle.up()
	end
	
	while turtle.detectDown() == false do
		turtle.down()
	end
end

function HarvestRow()                     -- This function instructs the bot to harvest the entire row of 
	for i = 1, ((tRows * 3) - 2), 1 do    -- trees by calling HarvestTree() whenever it detects a tree
		if turtle.detect() == true then
			DetectLeaves(1)
		else
			Go(1)
		end
	end
end

function NextRowNumLeft()     --the turtle prepares to sweep the next row of trees to it's left
	DetectLeaves(1)
	turtle.turnLeft()
	DetectLeaves(3)
	turtle.turnLeft()	
end

function NextRowNumRight()    --the turtle prepares to sweep the next row of trees to it's right
	DetectLeaves(1)
	turtle.turnRight()
	DetectLeaves(3)
	turtle.turnRight()
end

function Fuel()                              --this function checks fuel levels. If there is 
	if turtle.getFuelLevel() < 500 then      --less than 500 fuel it will attempt to grab a stack
		turtle.select(16)                    --of fuel stuff from a nearby chest and use it
		turtle.turnRight()
		if turtle.suck(64) == false then
			turtle.turnLeft()
			error("Fuel reserves are depleted")
		end
		turtle.refuel(64)
		turtle.turnLeft()
		turtle.select(1)
	end
end

function EmptyInv()           --this function deposits the entire turtle 
	for i = 1, 16, 1 do       --inventory below the turtle
        turtle.select(i)
        turtle.dropDown()
    end
    turtle.select(1)
end
------------------------functions end and commands start here---------------------------------
while doLoop == true do
	print("Initializing")
	term.clear()
	NextRowNum = 1
	SlotNum = 1
	
	print("Checking fuel levels")
	Fuel()
	print("fuel levels nominal")
	Go(1)
	turtle.turnRight()
	print("getting saplings")
	turtle.suck(MaxSaps)
	if turtle.getItemCount(1) < MaxSaps then
		turtle.turnLeft()
		turtle.back()
		error("Not Enough Saplings")
	end
	turtle.turnLeft()
	DetectLeaves(3)

	for i = 1, tColumns, 1 do
		HarvestRow()
		if NextRowNum < tColumns then
			NextRowNum = (NextRowNum + 1)
			if (NextRowNum % 2) == 0 then
				NextRowNumLeft()
			else
				NextRowNumRight()
			end
		else
			if (NextRowNum % 2) == 0 then
				DetectLeaves(5)
				turtle.turnLeft()
			else
				turtle.turnLeft()
				DetectLeaves(1)
				turtle.turnLeft()
				DetectLeaves((tRows * 3) + 2)
				turtle.turnLeft()
				Go(1)
			end
		end
	end
	
	print("going home")
	Go((tColumns - 1) * 3)

	turtle.turnLeft()

	print("Depositing Inventory")
	EmptyInv()
	
	term.clear()
	print("Waiting for trees to grow")
	sleep(1500)
end