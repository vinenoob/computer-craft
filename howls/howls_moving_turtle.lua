rednet.open("left")

while true do
    senderId, message, distance = rednet.receive()
    print(message)
    turtle.refuel()
    if message == "up" then 
        turtle.digUp()
        turtle.up()
        turtle.placeUp()
    elseif message == "down" then
        turtle.digUp()
        turtle.down()
        turtle.placeUp()
    elseif message == "forward" then
        turtle.digUp()
        turtle.forward()
        turtle.placeUp()
    elseif message == "back" then
        turtle.digUp()
        turtle.back()
        turtle.placeUp()
    elseif message == "right" then
        turtle.digUp()
        turtle.turnRight()
        turtle.placeUp()
    elseif message == "left" then
        turtle.digUp()
        turtle.turnLeft()
        turtle.placeUp()
    end
end

-- turtle.digUp

-- pastebin get P5d77FSp listener