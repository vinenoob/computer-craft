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

sendCommand(motor, breakBlock)
sendCommand(motor, extend)
sendCommand(motor, retract)
sendCommand(base, extend)
sendCommand(base, retract)
sendCommand(motor, placeBlock)


while true do print("hi") os.sleep(.1) end
