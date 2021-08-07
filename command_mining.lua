rednet.open("left")
while true do
    _, message, _ = rednet.receive()
    move = tonumber(message)
    for i = move, 1, -1 do
        turtle.dig()
        turtle.forward()
    end
end