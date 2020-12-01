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

function placeConnector ()
    turtle.select(1)
    turtle.placeUp()
end

function breakConnector ()
    turtle.select(1)
    turtle.digUp()
end

function extend ()
    turtle.select(2)
    turtle.dig()
    -- redstone.setOutput("bottom", false)
end

function retract ()
    turtle.select(2)
    turtle.place()
    -- redstone.setOutput("bottom", true)
end

local myName = "motor"

retract()

rednet.open("left")

while true do
    senderId, message, distance = rednet.receive()
    local info = parseArgs(message)
    if info["who"] == myName then
        if info["what"] == "extend" then
            extend()
        elseif info["what"] == "retract" then
            retract()
        elseif info["what"] == "break" then
            turtle.breakConnector()
        elseif info["what"] == "place" then
            turtle.placeConnector()
        -- elseif info["what"] == "forward" then
        --     turtle.forward()
        -- elseif info["what"] == "back" then
        --     turtle.back()
        end
    end
end