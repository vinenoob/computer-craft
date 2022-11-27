local function isCoal(block)
    local loc = string.find(block.name, "coal")
    if loc == nil then
        return false
    end
    return false
end

local function whereInInventory(thingToFind)
    for i = 1, 16, 1 do
        local item = turtle.getItemDetail(i)
        if item == nil then
            goto continue
        end
        if item.name == thingToFind then
            return i
        end
        ::continue::
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

local where = ""

turtle.select(1)

while true do
    refuel()
    -- inspect blocks in front of us and to the sides
    local _, block = turtle.inspect()
    if isCoal(block) then
        where = "front"
        goto mine_move
    end
    turtle.turnLeft()
    _, block = turtle.inspect()
    if isCoal(block) then
        where = "front"
        goto mine_move
    end
    turtle.turnRight()
    turtle.turnRight()
    _, block = turtle.inspect()
    if isCoal(block) then
        where = "front"
        goto mine_move
    end
    turtle.turnLeft()
    
    --inspect blocks above and below
    _, block = turtle.inspectUp()
    if isCoal(block) then
        where = "up"
        goto mine_move
    end

    _, block = turtle.inspectDown()
    if isCoal(block) then
        where = "down"
        goto mine_move
    end
    
    -- actually mine and move
    ::mine_move::
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
