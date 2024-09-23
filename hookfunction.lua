--[[
    hookfunction.lua

    Trash Hookfunction For Celery
    No Credits to Void (me) and free to use and modify.

    Usage: 

    loadstring(game:HttpGet("https://raw.githubusercontent.com/xZPUHigh/Storage/refs/heads/main/hookfunction.lua"))()

     hookfunction(print, function()
     warn("hooked print")
    end)

]]

function hookfunction(old, hook)
    local funcName = debug.getinfo(old).name
    getgenv()[funcName] = function(...)
        return hook(...)
    end
    return old
end

getgenv().hookfunction = hookfunction
print("loaded trash hookfunction")
