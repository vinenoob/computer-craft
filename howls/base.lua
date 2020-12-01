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

function extend ()
    redstone.setOutput("bottom", false)
end

function retract ()
    redstone.setOutput("bottom", true)
end

function readDirection ()
    f = fs.open("direction.txt", "r")
    return f.readAll()
end

local myName = readDirection().. " ".. "base"


redstone.setOutput("bottom", true)
rednet.open("left")

while true do
    senderId, message, distance = rednet.receive()
    local info = parseArgs(message)
    if info["who"] == myName then
        if info["what"] == "extend" then
            extend()
        elseif info["what"] == "retract" then
            retract()
        elseif info["what"] == "forward" then
            turtle.forward()
        elseif info["what"] == "back" then
            turtle.back()
        end
    end
end