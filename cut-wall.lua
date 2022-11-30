-- Check Direction
-- Measure X
-- Measure Y
-- Move in
-- Cut

--check what end of the wall we are on 
local function onLeftSide()
    turtle.turnRight()
    local blockRight = turtle.inspect()
    turtle.turnLeft()
    if blockRight then
        return false
    end
    return true
end

local function measure(moveCommand)
    local i = 0
    repeat
        i = i + 1
    until (not moveCommand())
    return i
end

local function measureX()
    local count = measure(turtle.forward)
    measure(turtle.back)
    return count
end

local function measureY()
    local count = measure(turtle.up)
    measure(turtle.down)
    return count
end

local onLeft = onLeftSide()
if onLeft then
    turtle.turnRight()
else
    turtle.turnLeft()
end

local width = measureX()
local height = measureY()

print(width)
print(height)

if onLeft then
    turtle.turnLeft()
    repeat
    until (not turtle.dig())
    turtle.forward()
    turtle.turnRight()
else
    turtle.turnRight()
    repeat
    until (not turtle.dig())
    turtle.forward()
    turtle.turnLeft()
end

local ix = 1
while (ix <= height) do
    print("new height")
    local mineMode = 1
    if ix+2 <= height then
        ix = ix + 2
        mineMode = 3
    elseif ix+1 <= height then
        ix = ix + 1
        mineMode = 2
    end
    if mineMode >= 2 then
        turtle.digUp()
        turtle.up()
    end
    print("Mine mode is ", mineMode)
    print("ix is ", ix)
    local iy = 1
    while (iy <= width) do
        print("iy is ", iy)
        if mineMode >= 3 then
            repeat
            until (not turtle.digUp())
            print("digUp")
        end
        if mineMode >= 2 then
            repeat
            until (not turtle.digDown())
            print("digDown")
        end
        if not (iy == width) then
            repeat
            until (not turtle.dig())
            print("dig")
            turtle.forward()
        end
        iy = iy + 1
    end
    if mineMode >= 2 then
        turtle.up()
    end
    if not (ix >= height) then
        turtle.digUp()
        turtle.up()
        turtle.turnLeft()
        turtle.turnLeft()
    end
    ix = ix + 1
end

repeat
until (not turtle.down())