local function isCoal(block)
    if block == "No block to inspect" then
        return false
    end
    print("checking ", block, " if is coal")
    local loc = string.find(block.name, "coal")
    if loc == nil then
        return false
    end
    return true
end

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

local function checkFrontForCoal()
    local _, block = turtle.inspect()
    if isCoal(block) then
        return "forward"
    end
    return ""
end

local function checkLeftForCoal()
    turtle.turnLeft()
    local _, block = turtle.inspect()
    if isCoal(block) then
        return "forward"
    end
    return ""
end

local function checkRightForCoal()
    turtle.turnRight()
    local _, block = turtle.inspect()
    if isCoal(block) then
        return "forward"
    end
    return ""
end

local function checkUpForCoal()
    local _, block = turtle.inspectUp()
    if isCoal(block) then
        return "up"
    end
    return ""
end

local function checkDownForCoal()
    local _, block = turtle.inspectDown()
    if isCoal(block) then
        return "down"
    end
    return ""
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

local function digMove(direction)
    refuel()
    if direction == "forward" then
        turtle.dig()
        turtle.forward()
    elseif direction == "up" then
        turtle.digUp()
        turtle.up()
    elseif direction == "down" then
        turtle.digDown()
        turtle.down()
    end
end

local directions = {"forward", "up", "down", "left", "right"}

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
            turtle.dig()
            turtle.forward()
        elseif direction == "up" then
            turtle.digUp()
            turtle.up()
        elseif direction == "down" then
            turtle.digDown()
            turtle.down()
        elseif direction == "left" then
            turtle.turnLeft()
            turtle.dig()
            turtle.forward()
        elseif direction == "right" then
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
        end
        recursiveMine()
        if direction == "forward" then
            turtle.back()
        elseif direction == "up" then
            turtle.down()
        elseif direction == "down" then
            turtle.up()
        elseif direction == "left" then
            turtle.back()
            turtle.turnRight()
        elseif direction == "right" then
            turtle.back()
            turtle.turnLeft()
        end
    end
end

turtle.select(1)

recursiveMine()

-- while true do

--     -- inspect blocks in front of us and to the sides
--     local where = checkFrontForCoal()
--     if where == "" then
--         where = checkLeftForCoal()
--         if where == "" then
--             -- need to reset position
--             turtle.turnRight()
--             where = checkRightForCoal()
--             if where == "" then
--                 turtle.turnLeft()
--                 where = checkUpForCoal()
--                 if where == "" then
--                     where = checkDownForCoal()
--                     if where == "" then
--                         where = "forward"                  
--                     end
--                 end
--             end
--         end
--     end
    
--     -- actually mine and move
--     digMove(where)
-- end
