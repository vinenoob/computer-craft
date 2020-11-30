rednet.open("left")

function push ()
    redstone.setOutput("bottom", false)
end

function pull ()
    redstone.setOutput("bottom", true)
end

local myName = "pusher"

while true do
    senderId, message, distance = rednet.receive()
    local info = parseArgs(message)
    if info["who"] == myName then
        if info["what"] == "push" then
            push()
        elseif info["what"] == "pull" then
            pull()
        end
    end
end