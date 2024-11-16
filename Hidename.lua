local Config =
{
   ProtectedName = "Name Protect by\n Project Spectrum", --What the protected name should be called.
   OtherPlayers = false, --If other players should also have protected names.
   OtherPlayersTemplate = "NameProtect", --Template for other players protected name (ex: "NamedProtect" will turn into "NameProtect1" for first player and so on)
   RenameTextBoxes = false, --If TextBoxes should be renamed. (could cause issues with admin guis/etc)
   UseMetatableHook = true, --Use metatable hook to increase chance of filtering. (is not supported on wrappers like bleu)
   UseAggressiveFiltering = false --Use aggressive property renaming filter. (renames a lot more but at the cost of lag)
}

local ProtectedNames = {}
local Counter = 1
if Config.OtherPlayers then
   for I, V in pairs(game:GetService("Players"):GetPlayers()) do
       ProtectedNames[V.Name] = Config.OtherPlayersTemplate .. tostring(Counter)
       Counter = Counter + 1
   end

   game:GetService("Players").PlayerAdded:connect(function(Player)
       ProtectedNames[Player.Name] = Config.OtherPlayersTemplate .. tostring(Counter)
       Counter = Counter + 1
   end)
end

local LPName = game:GetService("Players").LocalPlayer.Name
local IsA = game.IsA

local function FilterString(S)
   local RS = S
   if Config.OtherPlayers then
       for I, V in pairs(ProtectedNames) do
           RS = string.gsub(RS, I, V)
       end
   end
   RS = string.gsub(RS, LPName, Config.ProtectedName)
   return RS
end

for I, V in pairs(game:GetDescendants()) do
   if Config.RenameTextBoxes then
       if IsA(V, "TextLabel") or IsA(V, "TextButton") or IsA(V, "TextBox") then
           V.Text = FilterString(V.Text)

           if Config.UseAggressiveFiltering then
               V:GetPropertyChangedSignal("Text"):connect(function()
                   V.Text = FilterString(V.Text) 
               end)
           end
       end
   else
       if IsA(V, "TextLabel") or IsA(V, "TextButton") then
           V.Text = FilterString(V.Text)

           if Config.UseAggressiveFiltering then
               V:GetPropertyChangedSignal("Text"):connect(function()
                   V.Text = FilterString(V.Text) 
               end)
           end
       end
   end
end

if Config.UseAggressiveFiltering then
   game.DescendantAdded:connect(function(V)
       if Config.RenameTextBoxes then
           if IsA(V, "TextLabel") or IsA(V, "TextButton") or IsA(V, "TextBox") then
               V:GetPropertyChangedSignal("Text"):connect(function()
                   V.Text = FilterString(V.Text) 
               end)
           end
       else
           if IsA(V, "TextLabel") or IsA(V, "TextButton") then
               V:GetPropertyChangedSignal("Text"):connect(function()
                   V.Text = FilterString(V.Text) 
               end)
           end
       end
   end)
end

if Config.UseMetatableHook then
   if not getrawmetatable then
       error("GetRawMetaTable not found")
   end

   local NewCC = function(F)
       if newcclosure then return newcclosure(F) end
       return F
   end

   local SetRO = function(MT, V)
       if setreadonly then return setreadonly(MT, V) end
       if not V and make_writeable then return make_writeable(MT) end
       if V and make_readonly then return make_readonly(MT) end
       error("No setreadonly found")
   end

   local MT = getrawmetatable(game)
   local OldNewIndex = MT.__newindex
   SetRO(MT, false)

   MT.__newindex = NewCC(function(T, K, V)
       if Config.RenameTextBoxes then
           if (IsA(T, "TextLabel") or IsA(T, "TextButton") or IsA(T, "TextBox")) and K == "Text" and type(V) == "string" then
               return OldNewIndex(T, K, FilterString(V))
           end
       else
           if (IsA(T, "TextLabel") or IsA(T, "TextButton")) and K == "Text" and type(V) == "string" then
               return OldNewIndex(T, K, FilterString(V))
           end
       end

       return OldNewIndex(T, K, V)
   end)

   SetRO(MT, true)
end

game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
end
