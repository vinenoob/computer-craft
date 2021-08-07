while true do
    print("How far?")
    distance = tonumber(read())
    rednet.broadcast(distance)
end
