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

    splitArgs = split(args, ",")
    info["who"] = splitArgs[1]
    info["what"] = splitArgs[2]

    return (info)
end

function push ()
    redstone.setOutput("forward", true)
end

function pull ()
    redstone.setOutput("forward", false)
end

local myName = "puller"

while true do
    senderId, message, distance = rednet.receive()
    local info = parseArgs(message)
    if info["who"] == myName then
        if info["what"] == "push" then
            push()
        elseif info["what"] == "pull" then
            pull()
        elseif info["what"] == "forward" then
            turtle.forward()
        elseif info["what"] == "back" then
            turtle.back()
        end
    end
end