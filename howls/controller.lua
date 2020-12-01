rednet.open("back")

local motor = "motor"
local base = "base"

local extend = "extend"
local retract = "retract"
local back = "back"
local forward = "forward"
local breakBlock = "break"
local placeBlock = "place"

function sendCommand (str1, str2)
    rednet.broadcast(str1..","..str2)
    os.sleep(2.5)
end

turtle.equipLeft()
shell.execute("base")
shell.execute("motor")

while true do
    print("what direction?")
    local direction = read()
    local dMotor = direction.." "..motor
    local dBase = direction.." "..base
    print("how far?")
    local distance = tonumber(read())
    for i=distance, 1, -1 do
        sendCommand(dMotor, breakBlock)
        sendCommand(dMotor, extend)
        sendCommand(dMotor, retract)
        sendCommand(dBase, extend)
        sendCommand(dBase, retract)
        sendCommand(dMotor, placeBlock)
    end
end

