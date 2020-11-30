rednet.open("back")

local motor = "puller"
local base = "pusher"

local extend = "push"
local retract = "pull"
local back = "back"
local forward = "forward"

function sendCommand (str1, str2)
    rednet.broadcast(str1..","..str2)
    os.sleep(5)
end

sendCommand(motor, push)
sendCommand(base, back)
sendCommand(motor, retract)
sendCommand(base, extend)
sendCommand(base, retract)
sendCommand(motor, forward)
