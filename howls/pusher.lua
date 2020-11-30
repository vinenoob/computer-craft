rednet.open("left")

function split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function parseArgs(args)
    info = {}

    splitArgs = split(args)
    info["who"] = splitArgs[0]
    info["what"] = splitArgs[1]

    return (info)
end

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