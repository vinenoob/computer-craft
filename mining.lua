turtle.refuel()
miningDistance = 100
for i = 1, 3, 1 do 
    local distanceToMine = i * miningDistance
    for j = distanceToMine - miningDistance, 1, -1 do
        turtle.forward()
    end
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
