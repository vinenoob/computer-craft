rednet.open("back")

local east = "east"

local motor = "motor"
local base = "base"

local eastMotor = east.. " ".. motor
local eastBase = east.. " ".. base

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

sendCommand(eastMotor, breakBlock)
sendCommand(eastMotor, extend)
sendCommand(eastMotor, retract)
sendCommand(eastBase, extend)
sendCommand(eastBase, retract)
sendCommand(eastMotor, placeBlock)


while true do print("hi") os.sleep(.1) end
