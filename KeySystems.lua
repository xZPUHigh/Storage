local PandaAuth = loadstring(game:HttpGet('https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/library/LuaLib/ROBLOX/PandaSVALLib.lua'))()
-- Initialize the PandaAuth library
PandaAuth:Initialize({
    Service = "spectrum",          -- Your service name
    DisplayName = "Project Spectrum", -- Display name
    API_Key = "UF108RTaLAE3i3YS",         -- Your API key
    IsDebug = true,                   -- Enable debug mode to see detailed logs (optional)
    Allow_BlacklistUsers = false,     -- Disable blacklisted users (optional)
    Save_Key = false,                 -- Do not save keys to user data (optional)
    DiagnosticLogs = true             -- Enable diagnostic logs (optional)
})

-- Get Key from the initialized service
local key = PandaAuth:GetKey()
print("Retrieved Key URL:", key)

local isValid = PandaAuth:ValidateKey("pandadev_d503888153d95e5a642b72af50b6a6a74d211e9e6060f54e868c1bdeb8561622")
if isValid then
    print("The key is valid!")
else
    print("The key is invalid.")
end
