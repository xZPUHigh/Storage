function Library()
    local UserInputService = game:GetService("UserInputService")
    local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()
    local everyClipboard = setclipboard or toclipboard or set_clipboard or setrbxclipboard or (Clipboard and Clipboard.set)
    local CoreGui = game:GetService("CoreGui")

    local Library = {}

    pcall(function()
        OldInstance:Destroy()
    end)

    local KeyUI = Instance.new("ScreenGui")
    KeyUI.Name = "KeyUI"
    KeyUI.Parent = game.CoreGui
    KeyUI.ZIndexBehavior = Enum.ZIndexBehavior.Global

    if gethui then
        KeyUI.Parent = gethui()
    elseif syn.protect_gui then
        syn.protect_gui(KeyUI)
        KeyUI.Parent = CoreGui
    else
        KeyUI.Parent = CoreGui
    end

    getgenv().OldInstance = KeyUI

    local function MakeDraggable(gui)
        local dragging
        local dragInput
        local dragStart
        local startPos
        local function update(input)
            local delta = input.Position - dragStart
            gui.Position =
                UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        gui.InputBegan:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch
            then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        gui.InputChanged:Connect(function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch
            then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end


    function Library:Window(Tablela)
        Tablela.Title = Tablela.Title or "Title"
        Tablela.ServiceID = Tablela.ServiceID or "Identifier Name"
        Tablela.APIToken = Tablela.APIToken or "API Token (For Library Encryption)"
        Tablela.Callback = Tablela.Callback or function() end

        local Window = {
            Created = 0
        }

        local PandaAuth = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/VAL", true))()

        local Identifier = tostring(Tablela.ServiceID)
        local API_Token = tostring(Tablela.APIToken)

        local InternalTable = { -- change
            Service = Identifier, -- Identifier Name *
            APIToken = API_Token, -- API Token (For Library Encryption) *
            VigenereKey = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32) % os.time() + os.clock()),
            TrueEndpoint = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32) % os.time() + os.clock()),
            FalseEndpoint = tostring({}) .. tostring(function() end) .. tostring(workspace["GetServerTimeNow" .. ("\0"):rep(math.random(2, 32))](workspace) + math.random(os.clock(), 999999999 or os.time())) .. ("\0"):rep(math.random(2, 32) % os.time() + os.clock()),
            Webhook = nil,
            Debug = false
        }

        local Internal = setmetatable({}, {
            __index = function(self, key)
                return rawget(InternalTable, key)
            end;
            __newindex = function(self, key, value)
                while true do end; repeat until false; print(debug.traceback()) return
            end;
            __tostring = function(self)
                while true do end; repeat until false; print(debug.traceback()) return
            end;
        })

        local SetInternal = PandaAuth.SetInternal; PandaAuth:SetInternal(Internal)
        local Directory = "ELGATO HUB/SavedKey.txt"

        local function __CheckKey()
            local result = PandaAuth:ValidateKey(readfile(Directory))
            local Crypt = PandaAuth:GetInternal().Crypt
            local SHA256 = Crypt:SHA256(Internal.TrueEndpoint, Internal.VigenereKey, nil, nil)
            local SyncTrue = Crypt:EncryptC(SHA256, Internal.VigenereKey, nil)
            local IteratedTables = {}

            local ValueSpoofed; ValueSpoofed = function(val, tbl)
                local ret = nil

                for i, v in pairs(tbl) do
                    if v == val then
                        print(i, v, val)

                        ret = true

                        break
                    elseif type(tbl) == "table" and not IteratedTables[tbl] then
                        IteratedTables[tbl] = true

                        ret = ValueSpoofed(val, tbl)

                        break
                    end
                end

                table.clear(IteratedTables)

                return ret
            end

            if ValueSpoofed(result["KEY"], {result, SHA256, SyncTrue})
                or ValueSpoofed(result["Encrypted"], {result}) then
                while true do end do return end
            end

            if getmetatable(getfenv(PandaAuth.SetInternal)["getrenv\0"])["__newindex"]() == SetInternal and PandaAuth.SetInternal ~= SetInternal and getmetatable(getfenv(select(2, PandaAuth:SetInternal(Internal)))["getrenv\0"])["__newindex"]() == SetInternal and PandaAuth:SetInternal(Internal) == SetInternal then
                if result and result["KEY"] and type(result["ENV"]) == type(getfenv(1)) and result["Raw"] == Internal.TrueEndpoint and result["Encrypted"] == SyncTrue and type(result["Premium"]) == "boolean" and PandaAuth.Validated[1] == Internal.TrueEndpoint and PandaAuth.Validated[2] == true then
                    if result["Premium"] then
                        NotificationLibrary:SendNotification("Success", "Key is Valid " .. "Premium: " .. tostring(result["Premium"]), 3)
                        writefile(Directory, result["KEY"])
                        Tablela.Callback()
                        KeyUI:Destroy()
                        return
                    else
                        NotificationLibrary:SendNotification("Success", "Key is Valid " .. " Premium: " .. tostring(result["Premium"]), 3)
                        writefile(Directory, result["KEY"])
                        Tablela.Callback()
                        KeyUI:Destroy()
                        return
                    end
                elseif result and result["Raw"] == Internal.FalseEndpoint and PandaAuth.Validated[1] == Internal.FalseEndpoint and PandaAuth.Validated[2] == false then
                    NotificationLibrary:SendNotification("Warning", "Key is Invalid or Check Failed", 3)
                    delfile(Directory)
                    return false
                else
                    while true do end do return end
                end
            else
                while true do end do return end
            end
        end

        if isfile(Directory) then
            if not __CheckKey() then
            end
        end

        local KeySys = Instance.new("CanvasGroup", KeyUI)
        KeySys.GroupTransparency = 0.2
        KeySys.BorderSizePixel = 0
        KeySys.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        KeySys.AnchorPoint = Vector2.new(0.5, 0.5)
        KeySys.Size = UDim2.new(0, 400, 0, 210)
        KeySys.Position = UDim2.new(0.5, 0, 0.5, 0)
        KeySys.BorderColor3 = Color3.fromRGB(0, 0, 0)
        KeySys.Name = "KeySys"
        MakeDraggable(KeySys)

        local UIStroke = Instance.new("UIStroke", KeySys)
        UIStroke.Color = Color3.fromRGB(255, 255, 255)

        local whitelist = Instance.new("TextBox", KeySys)
        whitelist.BorderSizePixel = 2
        whitelist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        whitelist.TextSize = 16
        whitelist.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        whitelist.TextColor3 = Color3.fromRGB(0, 0, 0)
        whitelist.BackgroundTransparency = 0.9
        whitelist.Size = UDim2.new(0, 336, 0, 129)
        whitelist.BorderColor3 = Color3.fromRGB(0, 0, 0)
        whitelist.Text = ""
        whitelist.PlaceholderText = "Insert Key..."
        whitelist.Name = "whitelist"
        whitelist.TextWrapped = true
        whitelist.Position = UDim2.new(0.08, 0, 0.16942, 0)

        local whitelistUIStroke = Instance.new("UIStroke", whitelist)
        whitelistUIStroke.Thickness = 0.2

        local Frame = Instance.new("Frame", KeySys)
        Frame.BorderSizePixel = 0
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.Size = UDim2.new(0, 400, 0, 19)
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)

        local TextLabel = Instance.new("TextLabel", Frame)
        TextLabel.BorderSizePixel = 0
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 15
        TextLabel.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.Size = UDim2.new(0, 400, 0, 19)
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.Text = Tablela.Title

        local getkey = Instance.new("TextButton", KeySys)
        getkey.BorderSizePixel = 0
        getkey.TextSize = 20
        getkey.TextColor3 = Color3.fromRGB(255, 255, 255)
        getkey.BackgroundColor3 = Color3.fromRGB(101, 101, 121)
        getkey.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        getkey.Size = UDim2.new(0, 130, 0, 32)
        getkey.Name = "Get Key"
        getkey.BorderColor3 = Color3.fromRGB(0, 0, 0)
        getkey.Text = "GET KEY"
        getkey.Position = UDim2.new(0.01, 0, 0.83, 0)
        getkey.MouseButton1Click:Connect(function()
            everyClipboard(PandaAuth:GetKey())
            NotificationLibrary:SendNotification("Success", "Check Clipboard", 2)
        end)

        local howToGetKey = Instance.new("TextButton", KeySys)
        howToGetKey.BorderSizePixel = 0
        howToGetKey.TextSize = 20
        howToGetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
        howToGetKey.BackgroundColor3 = Color3.fromRGB(101, 101, 121)
        howToGetKey.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        howToGetKey.Size = UDim2.new(0, 120, 0, 32)
        howToGetKey.Name = "howToGetKey"
        howToGetKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
        howToGetKey.Text = "TUTORIAL"
        howToGetKey.Position = UDim2.new(0.35, 0, 0.83, 0)
        howToGetKey.MouseButton1Click:Connect(function()
            setclipboard("https://youtu.be/_7pJAZkPE9U")
            NotificationLibrary:SendNotification("Success", "Paste it into your browser to view how to get key", 7)
        end)

        local howToGetKeyUICorner = Instance.new("UICorner", howToGetKey)


        local login = Instance.new("TextButton", KeySys)
        login.BorderSizePixel = 0
        login.TextSize = 20
        login.TextColor3 = Color3.fromRGB(255, 255, 255)
        login.BackgroundColor3 = Color3.fromRGB(101, 101, 121)
        login.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        login.Size = UDim2.new(0, 130, 0, 32)
        login.Name = "login"
        login.BorderColor3 = Color3.fromRGB(0, 0, 0)
        login.Text = "CHECK KEY"
        login.Position = UDim2.new(0.66, 0, 0.83, 0)
        login.MouseButton1Click:Connect(function()
            local result = PandaAuth:ValidateKey(whitelist.Text) or PandaAuth:ValidateKeyless()
            local Crypt = PandaAuth:GetInternal().Crypt
            local SHA256 = Crypt:SHA256(Internal.TrueEndpoint, Internal.VigenereKey, nil, nil)
            local SyncTrue = Crypt:EncryptC(SHA256, Internal.VigenereKey, nil)
            local IteratedTables = {}

            local ValueSpoofed; ValueSpoofed = function(val, tbl)
                local ret = nil

                for i, v in pairs(tbl) do
                    if v == val then
                        print(i, v, val)

                        ret = true

                        break
                    elseif type(tbl) == "table" and not IteratedTables[tbl] then
                        IteratedTables[tbl] = true

                        ret = ValueSpoofed(val, tbl)

                        break
                    end
                end

                table.clear(IteratedTables)

                return ret
            end

            if ValueSpoofed(result["KEY"], {result, SHA256, SyncTrue})
                or ValueSpoofed(result["Encrypted"], {result}) then
                while true do end do return end
            end

            if getmetatable(getfenv(PandaAuth.SetInternal)["getrenv\0"])["__newindex"]() == SetInternal and PandaAuth.SetInternal ~= SetInternal and getmetatable(getfenv(select(2, PandaAuth:SetInternal(Internal)))["getrenv\0"])["__newindex"]() == SetInternal and PandaAuth:SetInternal(Internal) == SetInternal then
                if result and result["KEY"] and type(result["ENV"]) == type(getfenv(1)) and result["Raw"] == Internal.TrueEndpoint and result["Encrypted"] == SyncTrue and type(result["Premium"]) == "boolean" and PandaAuth.Validated[1] == Internal.TrueEndpoint and PandaAuth.Validated[2] == true then
                    if result["Premium"] then
                        NotificationLibrary:SendNotification("Success", "Key is Valid " .. "Premium: " .. tostring(result["Premium"]), 2)
                        writefile(Directory, result["KEY"])
                        Tablela.Callback()
                        KeyUI:Destroy()
                        return
                    else
                        NotificationLibrary:SendNotification("Success", "Key is Valid " .. "Premium: " .. tostring(result["Premium"]), 2)
                        writefile(Directory, result["KEY"])
                        Tablela.Callback()
                        KeyUI:Destroy()
                        return
                    end
                elseif result and result["Raw"] == Internal.FalseEndpoint and PandaAuth.Validated[1] == Internal.FalseEndpoint and PandaAuth.Validated[2] == false then
                    NotificationLibrary:SendNotification("Warning", "Key is Invalid", 2)
                else
                    while true do end do return end
                end
            else
                while true do end do return end
            end
        end)
        return Window
    end
    return Library
end

local Library = Library()

local Window = Library:Window({
    Title = "PROJECT SPECTRUM | KEY SYSTEM [BY XZPUHIGH]",
    ServiceID = "spectrum",
    APIToken = "UF108RTaLAE3i3YS",
    Callback = function()
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/x2CPUz/Backup/refs/heads/main/riot.html"))()
        end
    end
})
