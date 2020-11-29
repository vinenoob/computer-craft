rednet.open("back")

while true do
    senderId, message, distance = rednet.receive()
    print(senderId..":)")
    print(distance)
    print(message)
end
