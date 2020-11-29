rednet.open("left")

turtle.refuel()

while true do
    senderId, message, distance = rednet.receive()
    print(message)
    if message == "up" then 
        turtle.up()
    elseif message == "down" then
        turtle.down()
    elseif message == "forward" then
        turtle.forward()
    elseif message == "back" then
        turtle.back()
    elseif message == "right" then
        turtle.turnRight()
    elseif message == "left" then
        turtle.turnLeft()
    end
end

-- turtle.digUp

-- pastebin get P5d77FSp listener