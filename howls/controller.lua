rednet.open("back")

local motor = "motor"
local base = "base"

local extend = "push"
local retract = "pull"
local back = "back"
local forward = "forward"

function sendCommand (str1, str2)
    rednet.broadcast(str1..","..str2)
    os.sleep(1)
end

sendCommand(base, back)
sendCommand(motor, extend)
sendCommand(motor, retract)
sendCommand(base, extend)
sendCommand(base, retract)
sendCommand(motor, forward)
