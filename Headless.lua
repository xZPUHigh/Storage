local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

while wait() do
    pcall(function()
        -- // Headless
        LocalPlayer.Character.Head.Transparency = 1
        if LocalPlayer.Character.Head:FindFirstChild("face") then
            LocalPlayer.Character.Head.face:Destroy()
        end

        -- // Right Leg (Korblox)
        LocalPlayer.Character.RightUpperLeg.MeshId = "rbxassetid://9598310133"
        LocalPlayer.Character.RightUpperLeg.TextureID = "rbxassetid://902843398"
        LocalPlayer.Character.RightLowerLeg.Transparency = 1
        LocalPlayer.Character.RightFoot.Transparency = 1
    end)
end
