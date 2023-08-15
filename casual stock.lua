local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()



local Window = Library.CreateLib("Casual Stock", "RJTheme6", true)


local Tab = Window:NewTab("Functions")



local Section = Tab:NewSection("Misc")


Section:NewToggle("AutoBuy, Sport Master", "Auto Buy Sport Master", function(state)
    if state then
        print("Auto buy On")
    else
        print("Auto buy Off")
    end
end)


Section:NewToggle("AutoBuy, Zara", "Auto Buy Zara", function(state)
    if state then
        print("Auto buy On")
    else
        print("Auto buy Off")
    end
end)

Section:NewButton("Fps Unlocker", "+100 fps", function()
    for _,v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "Part"
			or v.ClassName == "SpawnLocation"
			or v.ClassName == "WedgePart"
			or v.ClassName == "Terrain"
			or v.ClassName == "MeshPart" then
			v.Material = "Plastic"
		end
	end
end)

-- Слайдер
Section:NewSlider("Speed Player", "SliderInfo", 36, 16, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewToggle("AutoSell", "AutoSell", function(state)
    if state then
        print("Auto Sell On")
    else
        print("Auto Sell Off")
    end
end)

Section:NewButton("FakeMoney", "ButtonInfo", function()
   
local player = game.Players.LocalPlayer

local leaderstats = player:WaitForChild("leaderstats")

local rubles = leaderstats:FindFirstChild("Рубли")

if rubles then
rubles.Value = rubles.Value + 1000000
end
end)

local Section = Tab:NewSection("Visual")

Section:NewToggle("Chams Sport Master", "Chams Sport Master", function(state)
    if state then
        print("Chams Sport Master On")
    else
        print("Chams Sport Master Off")
    end
end)

Section:NewButton("Chams Player", "ButtonInfo", function()
   local FillColor = Color3.fromRGB()
local DepthMode = "AlwaysOnTop"
local FillTransparency = 1
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
   end)


