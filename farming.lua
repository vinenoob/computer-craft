turnLeft = true
while true do
    -- check underneath for crop and harvest/plant
    below, crop = turtle.inspectDown()
    if below == true then
        if crop.state.age == 7 then
            turtle.digDown()
            turtle.placeDown()
        end
    end
    if turtle.forward() == false then
        if turnLeft == true then
            turtle.turnLeft()
        else
            turtle.turnRight()
        end

        if turtle.forward() == true then
            if turnLeft == true then
                turtle.turnLeft()
            else
                turtle.turnRight()
            end
        else
            if turnLeft == true then
                turtle.turnLeft()
                turtle.turnLeft()
            else
                turtle.turnRight()
                turtle.turnRight()
            end
        end
        turnLeft = not turnLeft
    end
end