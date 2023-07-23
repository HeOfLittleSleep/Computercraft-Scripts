--this program will dig out and build a tree farm for use with https://pastebin.com/5hUAPTRE.
--It will assume it has 30 saplings in slot 16 and 30 dirt blocks in slot 15.
--Digs a 17x20 block hole multiple blokcs deep (depending on the section)

function GoDig(distance)                             --this moves the turtle forward [distance] times and dig if there's a block infront of it.
	print("DIGGING "..distance.." blocks forward")  --Good for moving without repeating turtle.forward 20 times
	for i = 1, distance, 1 do
		if turtle.detect() == true then
			turtle.dig()
			turtle.forward()
		else
			turtle.forward()
		end
	end
end

function NextRowLeft()
	turtle.turnLeft()
	GoDig(1)
	turtle.turnLeft()
end

function NextRowRight()
	turtle.turnRight()
	GoDig(1)
	turtle.turnRight()
end

function DigFullLayer()
	turtle.digDown()
	turtle.down()

	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
	NextRowRight()
	GoDig(19)
	NextRowLeft()
	GoDig(19)
end

DigFullLayer()
turtle.turnRight()
turtle.turnRight()
DigFullLayer()

turtle.turnLeft()
GoDig(8)
turtle.turnLeft()

turtle.digDown()
GoDig(19)
NextRowRight()
GoDig(19)
NextRowLeft()
GoDig(19)
NextRowRight()
GoDig(19)
NextRowLeft()
GoDig(19)
NextRowRight()
GoDig(19)
NextRowLeft()
GoDig(19)
NextRowRight()
GoDig(19)
NextRowLeft()

turtle.digDown()
GoDig(19)

turtle.up()
turtle.up()
turtle.up()
turtle.up()