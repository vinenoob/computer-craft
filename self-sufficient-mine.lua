local function isCoal(block)
    if block == "No block to inspect" then
        return false
    end
    print("checking ", block, " if is coal")
    local loc = string.find(block.name, "coal")
    if loc == nil then
        return false
    end
    return false
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

local function checkFront()
    local _, block = turtle.inspect()
    if isCoal(block) then
        return "front"
    end
    return nil
end

local function checkLeft()
    turtle.turnLeft()
    local _, block = turtle.inspect()
    if isCoal(block) then
        return "front"
    end
    return nil
end

local function checkRight()
    turtle.turnRight()
    local _, block = turtle.inspect()
    if isCoal(block) then
        return "front"
    end
    return nil
end

local function checkUp()
    local _, block = turtle.inspectUp()
    if isCoal(block) then
        return "front"
    end
    return nil
end

local function checkDown()
    local _, block = turtle.inspectDown()
    if isCoal(block) then
        return "front"
    end
    return nil
end


turtle.select(1)

while true do

    refuel()
    -- inspect blocks in front of us and to the sides
    local where = "front"
    local where = checkFront()
    if where == nil then
        where = checkLeft()
        if where == nil then
            -- need to reset position
            turtle.turnRight()
            where = checkRight()
            if where == nil then
                turtle.turnLeft()
                where = checkUp()
                if where == nil then
                    where = checkDown()
                end
            end
        end
    end
    
    -- actually mine and move
    if where == "front" then
        turtle.dig()
        turtle.forward()
    elseif where == "up" then
        turtle.digUp()
        turtle.up()
    elseif where == "down" then
        turtle.digDown()
        turtle.down()
    end
end
