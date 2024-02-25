
local function isBlock(questionBlock, targetName)
    if questionBlock == "No block to inspect" then
        return false
    end
    print("checking ", questionBlock, " if is ", targetName)
    local loc = string.find(questionBlock.name, targetName)
    if loc == nil then
        return false
    end
    return true
end

local function whereInInventory(thingToFind)
    for i = 1, 16, 1 do
        local item = turtle.getItemDetail(i)
        if item ~= nil then
            if item.name == thingToFind then
                return i
            end
        end
    end
    return nil
end

local function refuel()
    local fuel = turtle.getFuelLevel()
    if fuel ~= 0 then
        return
    end
    local coalLocation = whereInInventory("minecraft:coal")
    if coalLocation == nil then
        print("No coal :(")
        return
    end
    turtle.select(coalLocation)
    turtle.refuel(1)
    --see if we need fuel
    --inspect inventory for coal
end


local function checkForBlock(direction, name)
    local block
    if direction == "forward" then
        _, block = turtle.inspect()
    elseif direction == "up" then
        _, block = turtle.inspectUp()
    elseif direction == "down" then
        _, block = turtle.inspectDown()
    elseif direction == "right" then
        turtle.turnRight()
        _, block = turtle.inspect()
        turtle.turnLeft()
    elseif direction == "left" then
        turtle.turnLeft()
        _, block = turtle.inspect()
        turtle.turnRight()
    end
    if isBlock(block, name) then
        return true
    end
    return false
end

local function move(direction)
    refuel()
    if direction == "forward" then
        turtle.forward()
    elseif direction == "up" then
        turtle.up()
    elseif direction == "down" then
        turtle.down()
    elseif direction == "back" then
        turtle.back()
    end
end

local function digMove(direction)
    if direction == "forward" then
        turtle.dig()
    elseif direction == "up" then
        turtle.digUp()
    elseif direction == "down" then
        turtle.digDown()
    end
    move(direction)
end

local directions = { "forward", "up", "down", "left", "right" }

local function scanForNearbyOres()
    local oreDirections = {}
    for _, direction in ipairs(directions) do
        if checkForBlock(direction, "ore") then
            table.insert(oreDirections, direction)
        end
    end
    return oreDirections
end

local function recursiveMine()
    local oreDirections = scanForNearbyOres()
    if #oreDirections == 0 then
        return
    end
    for _, direction in ipairs(oreDirections) do
        -- recursiveMine()
        if direction == "forward" then
            digMove(direction)
        elseif direction == "up" then
            digMove(direction)
        elseif direction == "down" then
            digMove(direction)
        elseif direction == "left" then
            turtle.turnLeft()
            digMove("forward")
        elseif direction == "right" then
            turtle.turnRight()
            digMove("forward")
        end
        recursiveMine()
        if direction == "forward" then
            move("back")
        elseif direction == "up" then
            move("down")
        elseif direction == "down" then
            move("up")
        elseif direction == "left" then
            move("back")
            turtle.turnRight()
        elseif direction == "right" then
            move("back")
            turtle.turnLeft()
        end
    end
end

turtle.select(1)

for i = 1, 100, 1 do
    local oreDirections = scanForNearbyOres()
    if #oreDirections > 0 then
        recursiveMine()
    end
    digMove("forward")
end

for i = 1, 100, 1 do
    digMove("back")
end