local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))();
local notifications = notificationLibrary.new({            
    NotificationLifetime = 7, 
    NotificationPosition = "Middle",
    
    TextFont = Enum.Font.Code,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 15,
    
    TextStrokeTransparency = 0, 
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
});

notifications:BuildNotificationUI();
notifications:Notify("Welcome To Project Spectrum 8.0")
notifications:Notify(" ")
notifications:Notify("by xZPUHigh & Exclusive Edition")

local _, library = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Osmium/main/OsmiumLibrary.lua")))

local window = library:CreateWindow("Project Spectrum 8.0 | by xZPUHigh & Exclusive Edition // .gg/C3MpUNwsDU")

local test = window:CreateTab("Main")
local info = window:CreateTab("Info")
local cred = window:CreateTab("Credits")

local dropdown = test:CreateDropdown("DropDown Exemple",{"Nami","Robin","Yamato"},function(val)
	print(val)
end)

local label = test:CreateLabel("This is a Title","this is an exemple of description")

local sld = test:CreateSlider("Slider Exemple",-100,100,function(arg)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = arg
end)

test:CreateTextbox("TextBox Exemple", function(value)
    print("Value = ", value)
end, "Write Here")

local toggle = test:CreateToggle("Toggle Exemple",false,function()
    
end)

local batp = test:CreateButton("Button Exemple", function()
    print("c")
end)

local label = info:CreateLabel("KeyBind :","KeyBind to Close/Open the Gui Is 'Left Control'")

local label = cred:CreateLabel("Interface :","Made by Trix#2794")
local label = cred:CreateLabel("Interface Scripts :","Made by Trix#2794")
local label = cred:CreateLabel("Scripting :","by Trix#2794 / JulMan#1234")
local batp = cred:CreateButton("Discord Server", function()
    setclipboard("discord.gg/C3MpUNwsDU")
end)

local MessageBox = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))()


--[[
   MessageBoxIcons:
      • Question
      • Error
      • Warning

   MessageBoxButtons:
      • YesNo
      • OKCancel
      • OK
--]]
-- AnchorPoint is 0.5,0.5
MessageBox.Show({Position = UDim2.new(0.5,0,0.5,0), Text = "Notification", Description = "Windows 10 MessageBox\nMade by : xHeptc\n \nDo you like this?", MessageBoxIcon = "Question", MessageBoxButtons = "YesNo", Result = function(res)
   if (res == "Yes") then
       MessageBox.Show({MessageBoxButtons = "OK", Description = "Wow, you said Yes! Thank you", Text = "YAYYY!"})
   elseif (res == "No") then
       MessageBox.Show({MessageBoxButtons = "OK", Description = "Ahh, sorry to dissapoint, I'll try better next time!", Text = "Nooooo"})
   end
end})