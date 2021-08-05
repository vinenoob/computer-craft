for i = 1, 3, 1 do 
    local distanceToMine = i * 10
    for j = distanceToMine, 1, -1 do
        turtle.dig()
        turtle.forward()
    end
    for j = distanceToMine, 1, -1 do
        turtle.back()
    end
    turtle.turnLeft()
    turtle.turnLeft()

    turtle.drop()

    turtle.turnLeft()
    turtle.turnLeft()
end
