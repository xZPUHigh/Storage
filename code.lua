print("Claim CODES")
function sendCode(code)
    local args = {
        [1] = code
    }
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
end

sendCode("RELEASE")
sendCode("DELAY")
sendCode("10KLIKES")
sendCode("100KLIKES")
sendCode("200KLIKES")
sendCode("300KLIKES")
sendCode("400KLIKES")
sendCode("AV500KLIKES")
sendCode("600KLIKES")
sendCode("10MVISITS")
sendCode("25MVISITS")
sendCode("AV50MIL")
sendCode("70MVISITS")
sendCode("300KPLAYERS")
sendCode("100MVISITS")
sendCode("800KLIKES")
