rednet.open("left")

function clear ()
    for i = 4, 1, -1 do
        turtle.dig()
        turtle.turnRight()
    end
end

function build ()
    for i = 4, 1, -1 do
        turtle.place()
        turtle.turnRight()
    end
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