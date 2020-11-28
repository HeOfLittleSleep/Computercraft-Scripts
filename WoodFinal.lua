--Global Variables-------------------------------
cont = "y"

distance = 1
number = 1

VerticalRows = 5           --Amount of vertical rows of trees
HorizontalRows = 6         --Amount of horizontal rows of trees

NextRowNum = -1            --Which row, out of "VerticalRows", Will the bot be on next

MaxSaps = VerticalRows * HorizontalRows    --max amount of saplings that could be planted in a single iteration

SlotNum = 1
-------------------------------------------------

function Go(distance)
	for i = 1, distance, 1 do
		while turtle.forward() == false do
			sleep(1)
		end
	end
end

function GetAboveBlockId()
	BlockState, BlockName = turtle.inspectUp()
	
	return BlockName.name
end

function GetFrontBlockId()
	BlockState, BlockName = turtle.inspect()
	
	return BlockName.name
end

function GetItemID()
	local ItemData = turtle.getItemDetail()
	
	return ItemData.name
end

function DetectLeaves(number)
	for i = 1, number, 1 do
	
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
	turtle.dig()       -- bot to chop down tree when called
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

function HarvestRow()                              -- This function instructs the bot to harvest the entire row of 
	for i = 1, ((HorizontalRows * 3) - 2), 1 do    -- trees when by calling HarvestTree() whenever it detects a tree
		if turtle.detect() == true then
			DetectLeaves(1)
		else
			Go(1)
		end
	end
end

function NextRowNumLeft()
	DetectLeaves(1)
	turtle.turnLeft()
	DetectLeaves(3)
	turtle.turnLeft()	
end

function NextRowNumRight()
	DetectLeaves(1)
	turtle.turnRight()
	DetectLeaves(3)
	turtle.turnRight()
end

function Fuel()
	if turtle.getFuelLevel() < 500 then
		turtle.select(16)
		turtle.turnLeft()
		if turtle.suck(64) == false then
			error("No Available Fuel")
		end
		turtle.refuel(64)
		turtle.turnRight()
		turtle.select(1)
	end
end
------------------------functions end and commands start here---------------------------------
while cont == "y" do
	--monitor.clear()
	NextRowNum = 1
	SlotNum = 1
	
	Go(1)
	Fuel()
	turtle.turnRight()
	turtle.suck(MaxSaps)
	if turtle.getItemCount(1) < MaxSaps then
		turtle.turnLeft()
		turtle.back()
		error("Not Enough Saplings")
	end
	turtle.turnLeft()
	DetectLeaves(3)

	for i = 1, VerticalRows, 1 do
		HarvestRow()
		if NextRowNum < VerticalRows then
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
				DetectLeaves((HorizontalRows * 3) + 2)
				turtle.turnLeft()
				Go(1)
			end
		end
	end
	
	Go((VerticalRows - 1) * 3)

	turtle.turnLeft()
	print("Waiting for trees to grow")
	sleep(1500)
end