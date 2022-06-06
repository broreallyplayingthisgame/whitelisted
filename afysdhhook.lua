local afy
afy = hookmetamethod(game,"__index",function(i,v)
    if i:IsA("Mouse") and v == "Hit" or v == "Target" and Aiming.Check() then
        local SelectedPart = Aiming.SelectedPart
        if DaHoodSettings.SilentAim and v == "Hit" or v == "Target" then
            local Hit = SelectedPart.CFrame + SelectedPart.Velocity * DaHoodSettings.Prediction
            return v == "Hit" and Hit or SelectedPart
        end
    end
    return afy(i,v)
end)
