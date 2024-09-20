print("Claim CODES")
function sendCode(code)
    local args = {
        [1] = code
    }
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
end

sendCode("THXFOR1MLIKES")
sendCode("300KPLAYERS")
sendCode("100MVISITS")
sendCode("800KLIKES")
