local Hit
local old2
old2 = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit")) then
        if (k == "Hit") then
            return (k == "Hit" and Hit)
        end
    end
    -- // Return
    return old2(t, k)
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/broreallyplayingthisgame/whitelisted/main/untitledhood.lua"))()
