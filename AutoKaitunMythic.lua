 local args = {
        [1] = "RELEASE"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    wait(1)
    
    local args = {
        [1] = "DELAY"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    wait(1)
    
    local args = {
        [1] = "200KLIKES"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    wait(1)
    
    local args = {
        [1] = "100KLIKES"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    wait(1)
    
    local args = {
        [1] = "300KLIKES"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    
    wait(1)
    
    local args = {
        [1] = "10MVISITS"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    
    wait(1)
    
    local args = {
        [1] = "10KLIKES"
    }
    
    game:GetService("ReplicatedStorage").Networking.CodesEvent:FireServer(unpack(args))
    
    
    while wait(0) do
    local args = {
        [1] = "SummonTen",
        [2] = "Special"
    }
    game:GetService("ReplicatedStorage").Networking.Units.SummonEvent:FireServer(unpack(args))
