turnLeft = true
while true do
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
    -- check underneath for crop and harvest/plant
end