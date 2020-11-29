rednet.open("left")

function forwardDigUp()
    turtle.forward()
    turtle.digUp()
end

function forwardPlaceUp()
    turtle.forward()
    turtle.placeUp()
end

function clear ()
    turtle.digUp()
    forwardDigUp()
    turtle.turnLeft()
    forwardDigUp()

    for i = 3, 1, -1 do
        turtle.turnLeft()
        forwardDigUp()
        forwardDigUp()
    end

    turtle.back()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
end

function build ()
    turtle.placeUp()
    forwardPlaceUp()
    turtle.turnLeft()
    forwardPlaceUp()

    for i = 3, 1, -1 do
        turtle.turnLeft()
        forwardPlaceUp()
        forwardPlaceUp()
    end

    turtle.back()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
end

turtle.refuel()

while true do
    senderId, message, distance = rednet.receive()
    print(message)
    if message == "up" then 
        clear()
        turtle.up()
        build()
    elseif message == "down" then
        clear()
        turtle.down()
        build()
    elseif message == "forward" then
        clear()
        turtle.forward()
        build()
    elseif message == "back" then
        clear()
        turtle.back()
        build()
    elseif message == "right" then
        turtle.turnRight()
    elseif message == "left" then
        turtle.turnLeft()
    elseif message == "clear" then
        clear()
    elseif message == "build" then
        build()
    end
end

-- turtle.digUp

-- pastebin get P5d77FSp listener