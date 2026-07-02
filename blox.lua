

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local Player = player

local CONFIG_FILE = "FruitSniperConfig.json"
local GITHUB_URL = "https://raw.githubusercontent.com/VenezzaX/BloxFruitTweaks/refs/heads/main/blox.lua" 

local SETTINGS = {
    Team = "Pirates",
    ServerHop = true,
    FastHop = false,
    HideName = false,
    RemoveHats = false,
    Fruits = {
        ["Rocket Fruit"] = true,
        ["Spin Fruit"] = true,
        ["Blade Fruit"] = true,
        ["Spring Fruit"] = true,
        ["Bomb Fruit"] = true,
        ["Smoke Fruit"] = true,
        ["Spike Fruit"] = true,
        ["Flame Fruit"] = true,
        ["Ice Fruit"] = true,
        ["Sand Fruit"] = true,
        ["Dark Fruit"] = true,
        ["Eagle Fruit"] = true,
        ["Diamond Fruit"] = true,
        ["Light Fruit"] = true,
        ["Rubber Fruit"] = true,
        ["Ghost Fruit"] = true,
        ["Magma Fruit"] = true,
        ["Quake Fruit"] = true,
        ["Buddah Fruit"] = true,
        ["Love Fruit"] = true,
        ["Creation Fruit"] = true,
        ["Spider Fruit"] = true,
        ["Sound Fruit"] = true,
        ["Pheonix Fruit"] = true,
        ["Portal Fruit"] = true,
        ["Lightning Fruit"] = true,
        ["Pain Fruit"] = true,
        ["Blizzard Fruit"] = true,
        ["Gravity Fruit"] = true,
        ["Mammoth Fruit"] = true,
        ["T-Rex Fruit"] = true,
        ["Dough Fruit"] = true,
        ["Shadow Fruit"] = true,
        ["Venom Fruit"] = true,
        ["Gas Fruit"] = true,
        ["Spirit Fruit"] = true,
        ["Tiger Fruit"] = true,
        ["Yeti Fruit"] = true,
        ["Kitsune Fruit"] = true,
        ["Control Fruit"] = true,
        ["Dragon Fruit"] = true,
    }
}

local function SaveConfig()
    local success, err = pcall(function()
        if writefile then
            writefile(CONFIG_FILE, HttpService:JSONEncode(SETTINGS))
        end
    end)
    if not success then
        warn("[XZYP FRUITAROO] - Failed to save config: " .. tostring(err))
    end
end

local function LoadConfig()
    if isfile and isfile(CONFIG_FILE) then
        local success, content = pcall(function()
            return readfile(CONFIG_FILE)
        end)
        if success and content then
            local successDec, data = pcall(function()
                return HttpService:JSONDecode(content)
            end)
            if successDec and type(data) == "table" then
                if data.Team then SETTINGS.Team = data.Team end
                if data.ServerHop ~= nil then SETTINGS.ServerHop = data.ServerHop end
                if data.FastHop ~= nil then SETTINGS.FastHop = data.FastHop end
                if data.HideName ~= nil then SETTINGS.HideName = data.HideName end
                if data.RemoveHats ~= nil then SETTINGS.RemoveHats = data.RemoveHats end
                if type(data.Fruits) == "table" then
                    for k, v in pairs(data.Fruits) do
                        SETTINGS.Fruits[k] = v
                    end
                end
            end
        end
    end
end

LoadConfig()
_G.FruitSniperSettings = SETTINGS
_G.FruitSniperGithubUrl = _G.FruitSniperGithubUrl or GITHUB_URL

task.spawn(function()
    local remotes = ReplicatedStorage:WaitForChild("Remotes", 15)
    local commF = remotes and remotes:WaitForChild("CommF_", 15)
    if commF then
        pcall(function()
            commF:InvokeServer("SetTeam", SETTINGS.Team)
        end)
    end
end)

local Character = Player.Character
local HRP = Character and Character:FindFirstChild("HumanoidRootPart")

Player.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")

    task.wait(1)
    if SETTINGS.RemoveHats then
        for _, accessory in pairs(char:GetChildren()) do
            if accessory:IsA("Accessory") then
                accessory:Destroy()
            end
        end
    end
    if SETTINGS.HideName then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
    end
end)

local self = {}
self.xzyp_Fruitaroo = Instance.new("ScreenGui")
self.Main = Instance.new("Frame")
self.UIGradient = Instance.new("UIGradient")
self.UICorner = Instance.new("UICorner")
self.Title = Instance.new("TextLabel")
self.Subtitle = Instance.new("TextLabel")
self.Holder = Instance.new("Frame")
self.UICorner_2 = Instance.new("UICorner")

self.information = Instance.new("Frame")
self.UIListLayout = Instance.new("UIListLayout")
self.Status = Instance.new("TextLabel")
self.TweenStatus = Instance.new("TextLabel")
self.StoringStatus = Instance.new("TextLabel")
self.FruitDistance = Instance.new("TextLabel")
self.FruitType = Instance.new("TextLabel")
self.UIPadding = Instance.new("UIPadding")

self.settings = Instance.new("Frame")
self.UIListLayout_2 = Instance.new("UIListLayout")
self.HideNameButton = Instance.new("Frame")
self.UICorner_3 = Instance.new("UICorner")
self.UIStroke = Instance.new("UIStroke")
self.Title_2 = Instance.new("TextLabel")
self.UIPadding_2 = Instance.new("UIPadding")
self.Value = Instance.new("TextLabel")
self.UIPadding_3 = Instance.new("UIPadding")
self.Interact = Instance.new("TextButton")

self.RemoveHatsButton = Instance.new("Frame")
self.UICorner_4 = Instance.new("UICorner")
self.UIStroke_2 = Instance.new("UIStroke")
self.Title_3 = Instance.new("TextLabel")
self.UIPadding_4 = Instance.new("UIPadding")
self.Value_2 = Instance.new("TextLabel")
self.UIPadding_5 = Instance.new("UIPadding")
self.Interact_2 = Instance.new("TextButton")

self.ServerHopButton = Instance.new("Frame")
self.UICorner_SH = Instance.new("UICorner")
self.UIStroke_SH = Instance.new("UIStroke")
self.Title_SH = Instance.new("TextLabel")
self.UIPadding_SH = Instance.new("UIPadding")
self.Value_SH = Instance.new("TextLabel")
self.UIPadding_SH_Val = Instance.new("UIPadding")
self.Interact_SH = Instance.new("TextButton")

self.FastHopButton = Instance.new("Frame")
self.UICorner_FH = Instance.new("UICorner")
self.UIStroke_FH = Instance.new("UIStroke")
self.Title_FH = Instance.new("TextLabel")
self.UIPadding_FH = Instance.new("UIPadding")
self.Value_FH = Instance.new("TextLabel")
self.UIPadding_FH_Val = Instance.new("UIPadding")
self.Interact_FH = Instance.new("TextButton")

self.AbortButton = Instance.new("Frame")
self.UICorner_5 = Instance.new("UICorner")
self.UIStroke_3 = Instance.new("UIStroke")
self.Title_4 = Instance.new("TextLabel")
self.UIPadding_6 = Instance.new("UIPadding")
self.Value_3 = Instance.new("TextLabel")
self.UIPadding_7 = Instance.new("UIPadding")
self.Interact_3 = Instance.new("TextButton")

self.Buttons = Instance.new("Frame")
self.UIListLayout_3 = Instance.new("UIListLayout")
self.Status_2 = Instance.new("TextButton")
self.UICorner_7 = Instance.new("UICorner")
self.UIStroke_5 = Instance.new("UIStroke")
self.Settings = Instance.new("TextButton")
self.UICorner_8 = Instance.new("UICorner")
self.UIStroke_6 = Instance.new("UIStroke")

self.FruitsBtn = Instance.new("TextButton")
self.UICorner_Fruits = Instance.new("UICorner")
self.UIStroke_Fruits = Instance.new("UIStroke")

self.fruits_panel = Instance.new("ScrollingFrame")
self.UIListLayout_Fruits = Instance.new("UIListLayout")
self.UIPadding_Fruits = Instance.new("UIPadding")

self.RightPanel = Instance.new("Frame")
self.RPTitle = Instance.new("TextLabel")
self.RPList = Instance.new("ScrollingFrame")
self.RPListLayout = Instance.new("UIListLayout")

self.Notifications = Instance.new("Frame")
self.NotificationTemplate = Instance.new("Frame")
self.UICorner_9 = Instance.new("UICorner")
self.UIGradient_2 = Instance.new("UIGradient")
self.Title_6 = Instance.new("TextLabel")
self.Message = Instance.new("TextBox")
self.UICorner_10 = Instance.new("UICorner")
self.UIPadding_10 = Instance.new("UIPadding")
self.Timer = Instance.new("TextLabel")
self.UIListLayout_4 = Instance.new("UIListLayout")
self.UIPadding_11 = Instance.new("UIPadding")
self.Events = Instance.new("Folder")
self.Notification = Instance.new("BindableEvent")

self.xzyp_Fruitaroo.Name = "xzyp Fruitaroo"
self.xzyp_Fruitaroo.Parent = game:GetService('CoreGui')
self.xzyp_Fruitaroo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
self.xzyp_Fruitaroo.ResetOnSpawn = false
self.xzyp_Fruitaroo.IgnoreGuiInset = true

self.Main.Name = "Main"
self.Main.Parent = self.xzyp_Fruitaroo
self.Main.AnchorPoint = Vector2.new(0.5, 0.5)
self.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Main.BorderSizePixel = 0
self.Main.Position = UDim2.new(0.5, 0, 0.5, 0)
self.Main.Size = UDim2.new(0, 551, 0, 364)
self.Main.Visible = false

self.UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 15, 15)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(60, 60, 60)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(240, 240, 240))
}
self.UIGradient.Offset = Vector2.new(0, 0.0450000018)
self.UIGradient.Rotation = 75
self.UIGradient.Parent = self.Main

self.UICorner.CornerRadius = UDim.new(0, 5)
self.UICorner.Parent = self.Main

self.Title.Name = "Title"
self.Title.Parent = self.Main
self.Title.AnchorPoint = Vector2.new(0, 0.5)
self.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title.BackgroundTransparency = 1.000
self.Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title.BorderSizePixel = 0
self.Title.Position = UDim2.new(0.0272232313, 0, 0.068681322, 0)
self.Title.Size = UDim2.new(0, 200, 0, 20)
self.Title.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title.Text = "XZYP FRUITAROO | BloxFruits"
self.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Title.TextSize = 16.000
self.Title.TextXAlignment = Enum.TextXAlignment.Left
self.Title.TextYAlignment = Enum.TextYAlignment.Top

self.Subtitle.Name = "Subtitle"
self.Subtitle.Parent = self.Main
self.Subtitle.AnchorPoint = Vector2.new(0, 0.5)
self.Subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Subtitle.BackgroundTransparency = 1.000
self.Subtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Subtitle.BorderSizePixel = 0
self.Subtitle.Position = UDim2.new(0.0272232313, 0, 0.144230768, 0)
self.Subtitle.Size = UDim2.new(0, 276, 0, 35)
self.Subtitle.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Subtitle.Text = "I hate bloxfruits with my soul now use this loving script to get fruits"
self.Subtitle.TextColor3 = Color3.fromRGB(202, 202, 202)
self.Subtitle.TextSize = 14.000
self.Subtitle.TextWrapped = true
self.Subtitle.TextXAlignment = Enum.TextXAlignment.Left
self.Subtitle.TextYAlignment = Enum.TextYAlignment.Top

self.Holder.Name = "Holder"
self.Holder.Parent = self.Main
self.Holder.AnchorPoint = Vector2.new(0.5, 1)
self.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Holder.BackgroundTransparency = 0.900
self.Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Holder.BorderSizePixel = 0
self.Holder.Position = UDim2.new(0.5, 0, 0.958791196, 0)
self.Holder.Size = UDim2.new(0, 521, 0, 216)

self.UICorner_2.CornerRadius = UDim.new(0, 5)
self.UICorner_2.Parent = self.Holder

self.information.Name = "information"
self.information.Parent = self.Holder
self.information.AnchorPoint = Vector2.new(0.5, 0.5)
self.information.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.information.BackgroundTransparency = 1.000
self.information.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.information.BorderSizePixel = 0
self.information.Position = UDim2.new(0.5, 0, 0.5, 0)
self.information.Size = UDim2.new(0, 521, 0, 216)

self.UIListLayout.Parent = self.information
self.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
self.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
self.UIListLayout.Padding = UDim.new(0, 15)

self.Status.Name = "Status"
self.Status.Parent = self.information
self.Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Status.BackgroundTransparency = 1.000
self.Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Status.BorderSizePixel = 0
self.Status.LayoutOrder = 1
self.Status.Size = UDim2.new(0, 260, 0, 24)
self.Status.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Status.Text = "Status:"
self.Status.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Status.TextSize = 16.000
self.Status.TextWrapped = true
self.Status.TextXAlignment = Enum.TextXAlignment.Left
self.Status.RichText = true

self.TweenStatus.Name = "TweenStatus"
self.TweenStatus.Parent = self.information
self.TweenStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.TweenStatus.BackgroundTransparency = 1.000
self.TweenStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.TweenStatus.BorderSizePixel = 0
self.TweenStatus.LayoutOrder = 2
self.TweenStatus.Size = UDim2.new(0, 260, 0, 24)
self.TweenStatus.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.TweenStatus.Text = "Tweening Status"
self.TweenStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
self.TweenStatus.TextSize = 16.000
self.TweenStatus.TextWrapped = true
self.TweenStatus.TextXAlignment = Enum.TextXAlignment.Left
self.TweenStatus.RichText = true

self.StoringStatus.Name = "StoringStatus"
self.StoringStatus.Parent = self.information
self.StoringStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.StoringStatus.BackgroundTransparency = 1.000
self.StoringStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.StoringStatus.BorderSizePixel = 0
self.StoringStatus.LayoutOrder = 3
self.StoringStatus.Size = UDim2.new(0, 260, 0, 24)
self.StoringStatus.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.StoringStatus.Text = "Storing Status:"
self.StoringStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
self.StoringStatus.TextSize = 16.000
self.StoringStatus.TextWrapped = true
self.StoringStatus.TextXAlignment = Enum.TextXAlignment.Left
self.StoringStatus.RichText = true

self.FruitDistance.Name = "FruitDistance"
self.FruitDistance.Parent = self.information
self.FruitDistance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.FruitDistance.BackgroundTransparency = 1.000
self.FruitDistance.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.FruitDistance.BorderSizePixel = 0
self.FruitDistance.LayoutOrder = 4
self.FruitDistance.Size = UDim2.new(0, 260, 0, 24)
self.FruitDistance.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.FruitDistance.Text = "Fruit Distance:"
self.FruitDistance.TextColor3 = Color3.fromRGB(255, 255, 255)
self.FruitDistance.TextSize = 16.000
self.FruitDistance.TextWrapped = true
self.FruitDistance.TextXAlignment = Enum.TextXAlignment.Left
self.FruitDistance.RichText = true

self.FruitType.Name = "FruitType"
self.FruitType.Parent = self.information
self.FruitType.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.FruitType.BackgroundTransparency = 1.000
self.FruitType.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.FruitType.BorderSizePixel = 0
self.FruitType.LayoutOrder = 5
self.FruitType.Size = UDim2.new(0, 260, 0, 24)
self.FruitType.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.FruitType.Text = "Fruit Type:"
self.FruitType.TextColor3 = Color3.fromRGB(255, 255, 255)
self.FruitType.TextSize = 16.000
self.FruitType.TextWrapped = true
self.FruitType.TextXAlignment = Enum.TextXAlignment.Left
self.FruitType.RichText = true

self.UIPadding.Parent = self.information
self.UIPadding.PaddingLeft = UDim.new(0, 20)

self.settings.Name = "settings"
self.settings.Parent = self.Holder
self.settings.AnchorPoint = Vector2.new(0.5, 0.5)
self.settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.settings.BackgroundTransparency = 1.000
self.settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.settings.BorderSizePixel = 0
self.settings.Position = UDim2.new(0.5, 0, 0.5, 0)
self.settings.Size = UDim2.new(0, 521, 0, 216)
self.settings.Visible = false

self.UIListLayout_2.Parent = self.settings
self.UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
self.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
self.UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
self.UIListLayout_2.Padding = UDim.new(0, 5) 

self.RemoveHatsButton.Name = "RemoveHatsButton"
self.RemoveHatsButton.Parent = self.settings
self.RemoveHatsButton.AnchorPoint = Vector2.new(0.5, 0.5)
self.RemoveHatsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.RemoveHatsButton.BackgroundTransparency = 0.700
self.RemoveHatsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.RemoveHatsButton.BorderSizePixel = 0
self.RemoveHatsButton.LayoutOrder = 1
self.RemoveHatsButton.Size = UDim2.new(0, 491, 0, 34)

self.UICorner_4.CornerRadius = UDim.new(0, 5)
self.UICorner_4.Parent = self.RemoveHatsButton

self.UIStroke_2.Parent = self.RemoveHatsButton
self.UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
self.UIStroke_2.Thickness = 2.000
self.UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Title_3.Name = "Title"
self.Title_3.Parent = self.RemoveHatsButton
self.Title_3.AnchorPoint = Vector2.new(0, 0.5)
self.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title_3.BackgroundTransparency = 1.000
self.Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title_3.BorderSizePixel = 0
self.Title_3.Position = UDim2.new(0, 0, 0.5, 0)
self.Title_3.Size = UDim2.new(0, 200, 0, 21)
self.Title_3.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title_3.Text = "AUTO REMOVE HATS"
self.Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Title_3.TextSize = 16.000
self.Title_3.TextXAlignment = Enum.TextXAlignment.Left

self.UIPadding_4.Parent = self.Title_3
self.UIPadding_4.PaddingLeft = UDim.new(0, 10)

self.Value_2.Name = "Value"
self.Value_2.Parent = self.RemoveHatsButton
self.Value_2.AnchorPoint = Vector2.new(1, 0.5)
self.Value_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Value_2.BackgroundTransparency = 1.000
self.Value_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Value_2.BorderSizePixel = 0
self.Value_2.Position = UDim2.new(1, 0, 0.5, 0)
self.Value_2.Size = UDim2.new(0, 200, 0, 21)
self.Value_2.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Value_2.Text = "button"
self.Value_2.TextColor3 = Color3.fromRGB(230, 230, 230)
self.Value_2.TextSize = 14.000
self.Value_2.TextXAlignment = Enum.TextXAlignment.Right

self.UIPadding_5.Parent = self.Value_2
self.UIPadding_5.PaddingRight = UDim.new(0, 10)

self.Interact_2.Name = "Interact"
self.Interact_2.Parent = self.RemoveHatsButton
self.Interact_2.AnchorPoint = Vector2.new(0.5, 0.5)
self.Interact_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Interact_2.BackgroundTransparency = 1.000
self.Interact_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_2.BorderSizePixel = 0
self.Interact_2.Position = UDim2.new(0.5, 0, 0.5, 0)
self.Interact_2.Size = UDim2.new(0, 491, 0, 34)
self.Interact_2.AutoButtonColor = false
self.Interact_2.Font = Enum.Font.SourceSans
self.Interact_2.Text = ""
self.Interact_2.TextColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_2.TextSize = 14.000

self.HideNameButton.Name = "HideNameButton"
self.HideNameButton.Parent = self.settings
self.HideNameButton.AnchorPoint = Vector2.new(0.5, 0.5)
self.HideNameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.HideNameButton.BackgroundTransparency = 0.700
self.HideNameButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.HideNameButton.BorderSizePixel = 0
self.HideNameButton.LayoutOrder = 2
self.HideNameButton.Size = UDim2.new(0, 491, 0, 34)

self.UICorner_3.CornerRadius = UDim.new(0, 5)
self.UICorner_3.Parent = self.HideNameButton

self.UIStroke.Parent = self.HideNameButton
self.UIStroke.Color = Color3.fromRGB(255, 255, 255)
self.UIStroke.Thickness = 2.000
self.UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Title_2.Name = "Title"
self.Title_2.Parent = self.HideNameButton
self.Title_2.AnchorPoint = Vector2.new(0, 0.5)
self.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title_2.BackgroundTransparency = 1.000
self.Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title_2.BorderSizePixel = 0
self.Title_2.Position = UDim2.new(0, 0, 0.5, 0)
self.Title_2.Size = UDim2.new(0, 200, 0, 21)
self.Title_2.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title_2.Text = "HIDE NAME"
self.Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Title_2.TextSize = 16.000
self.Title_2.TextXAlignment = Enum.TextXAlignment.Left

self.UIPadding_2.Parent = self.Title_2
self.UIPadding_2.PaddingLeft = UDim.new(0, 10)

self.Value.Name = "Value"
self.Value.Parent = self.HideNameButton
self.Value.AnchorPoint = Vector2.new(1, 0.5)
self.Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Value.BackgroundTransparency = 1.000
self.Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Value.BorderSizePixel = 0
self.Value.Position = UDim2.new(1, 0, 0.5, 0)
self.Value.Size = UDim2.new(0, 200, 0, 21)
self.Value.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Value.Text = "button"
self.Value.TextColor3 = Color3.fromRGB(230, 230, 230)
self.Value.TextSize = 14.000
self.Value.TextXAlignment = Enum.TextXAlignment.Right

self.UIPadding_3.Parent = self.Value
self.UIPadding_3.PaddingRight = UDim.new(0, 10)

self.Interact.Name = "Interact"
self.Interact.Parent = self.HideNameButton
self.Interact.AnchorPoint = Vector2.new(0.5, 0.5)
self.Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Interact.BackgroundTransparency = 1.000
self.Interact.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Interact.BorderSizePixel = 0
self.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
self.Interact.Size = UDim2.new(0, 491, 0, 34)
self.Interact.AutoButtonColor = false
self.Interact.Font = Enum.Font.SourceSans
self.Interact.Text = ""
self.Interact.TextColor3 = Color3.fromRGB(0, 0, 0)
self.Interact.TextSize = 14.000

self.ServerHopButton.Name = "ServerHopButton"
self.ServerHopButton.Parent = self.settings
self.ServerHopButton.AnchorPoint = Vector2.new(0.5, 0.5)
self.ServerHopButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.ServerHopButton.BackgroundTransparency = 0.700
self.ServerHopButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.ServerHopButton.BorderSizePixel = 0
self.ServerHopButton.LayoutOrder = 3
self.ServerHopButton.Size = UDim2.new(0, 491, 0, 34)

self.UICorner_SH.CornerRadius = UDim.new(0, 5)
self.UICorner_SH.Parent = self.ServerHopButton

self.UIStroke_SH.Parent = self.ServerHopButton
self.UIStroke_SH.Color = Color3.fromRGB(255, 255, 255)
self.UIStroke_SH.Thickness = 2.000
self.UIStroke_SH.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Title_SH.Name = "Title"
self.Title_SH.Parent = self.ServerHopButton
self.Title_SH.AnchorPoint = Vector2.new(0, 0.5)
self.Title_SH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title_SH.BackgroundTransparency = 1.000
self.Title_SH.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title_SH.BorderSizePixel = 0
self.Title_SH.Position = UDim2.new(0, 0, 0.5, 0)
self.Title_SH.Size = UDim2.new(0, 200, 0, 21)
self.Title_SH.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title_SH.Text = "SERVER HOP"
self.Title_SH.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Title_SH.TextSize = 16.000
self.Title_SH.TextXAlignment = Enum.TextXAlignment.Left

self.UIPadding_SH.Parent = self.Title_SH
self.UIPadding_SH.PaddingLeft = UDim.new(0, 10)

self.Value_SH.Name = "Value"
self.Value_SH.Parent = self.ServerHopButton
self.Value_SH.AnchorPoint = Vector2.new(1, 0.5)
self.Value_SH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Value_SH.BackgroundTransparency = 1.000
self.Value_SH.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Value_SH.BorderSizePixel = 0
self.Value_SH.Position = UDim2.new(1, 0, 0.5, 0)
self.Value_SH.Size = UDim2.new(0, 200, 0, 21)
self.Value_SH.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Value_SH.Text = "button"
self.Value_SH.TextColor3 = Color3.fromRGB(230, 230, 230)
self.Value_SH.TextSize = 14.000
self.Value_SH.TextXAlignment = Enum.TextXAlignment.Right

self.UIPadding_SH_Val.Parent = self.Value_SH
self.UIPadding_SH_Val.PaddingRight = UDim.new(0, 10)

self.Interact_SH.Name = "Interact"
self.Interact_SH.Parent = self.ServerHopButton
self.Interact_SH.AnchorPoint = Vector2.new(0.5, 0.5)
self.Interact_SH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Interact_SH.BackgroundTransparency = 1.000
self.Interact_SH.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_SH.BorderSizePixel = 0
self.Interact_SH.Position = UDim2.new(0.5, 0, 0.5, 0)
self.Interact_SH.Size = UDim2.new(0, 491, 0, 34)
self.Interact_SH.AutoButtonColor = false
self.Interact_SH.Font = Enum.Font.SourceSans
self.Interact_SH.Text = ""
self.Interact_SH.TextColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_SH.TextSize = 14.000

self.FastHopButton.Name = "FastHopButton"
self.FastHopButton.Parent = self.settings
self.FastHopButton.AnchorPoint = Vector2.new(0.5, 0.5)
self.FastHopButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.FastHopButton.BackgroundTransparency = 0.700
self.FastHopButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.FastHopButton.BorderSizePixel = 0
self.FastHopButton.LayoutOrder = 4
self.FastHopButton.Size = UDim2.new(0, 491, 0, 34)

self.UICorner_FH.CornerRadius = UDim.new(0, 5)
self.UICorner_FH.Parent = self.FastHopButton

self.UIStroke_FH.Parent = self.FastHopButton
self.UIStroke_FH.Color = Color3.fromRGB(255, 255, 255)
self.UIStroke_FH.Thickness = 2.000
self.UIStroke_FH.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Title_FH.Name = "Title"
self.Title_FH.Parent = self.FastHopButton
self.Title_FH.AnchorPoint = Vector2.new(0, 0.5)
self.Title_FH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title_FH.BackgroundTransparency = 1.000
self.Title_FH.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title_FH.BorderSizePixel = 0
self.Title_FH.Position = UDim2.new(0, 0, 0.5, 0)
self.Title_FH.Size = UDim2.new(0, 200, 0, 21)
self.Title_FH.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title_FH.Text = "FAST HOP"
self.Title_FH.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Title_FH.TextSize = 16.000
self.Title_FH.TextXAlignment = Enum.TextXAlignment.Left

self.UIPadding_FH.Parent = self.Title_FH
self.UIPadding_FH.PaddingLeft = UDim.new(0, 10)

self.Value_FH.Name = "Value"
self.Value_FH.Parent = self.FastHopButton
self.Value_FH.AnchorPoint = Vector2.new(1, 0.5)
self.Value_FH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Value_FH.BackgroundTransparency = 1.000
self.Value_FH.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Value_FH.BorderSizePixel = 0
self.Value_FH.Position = UDim2.new(1, 0, 0.5, 0)
self.Value_FH.Size = UDim2.new(0, 200, 0, 21)
self.Value_FH.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Value_FH.Text = "button"
self.Value_FH.TextColor3 = Color3.fromRGB(230, 230, 230)
self.Value_FH.TextSize = 14.000
self.Value_FH.TextXAlignment = Enum.TextXAlignment.Right

self.UIPadding_FH_Val.Parent = self.Value_FH
self.UIPadding_FH_Val.PaddingRight = UDim.new(0, 10)

self.Interact_FH.Name = "Interact"
self.Interact_FH.Parent = self.FastHopButton
self.Interact_FH.AnchorPoint = Vector2.new(0.5, 0.5)
self.Interact_FH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Interact_FH.BackgroundTransparency = 1.000
self.Interact_FH.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_FH.BorderSizePixel = 0
self.Interact_FH.Position = UDim2.new(0.5, 0, 0.5, 0)
self.Interact_FH.Size = UDim2.new(0, 491, 0, 34)
self.Interact_FH.AutoButtonColor = false
self.Interact_FH.Font = Enum.Font.SourceSans
self.Interact_FH.Text = ""
self.Interact_FH.TextColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_FH.TextSize = 14.000

self.AbortButton.Name = "AbortButton"
self.AbortButton.Parent = self.settings
self.AbortButton.AnchorPoint = Vector2.new(0.5, 0.5)
self.AbortButton.BackgroundColor3 = Color3.fromRGB(255, 183, 184)
self.AbortButton.BackgroundTransparency = 0.700
self.AbortButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.AbortButton.BorderSizePixel = 0
self.AbortButton.LayoutOrder = 5
self.AbortButton.Size = UDim2.new(0, 491, 0, 34)

self.UICorner_5.CornerRadius = UDim.new(0, 5)
self.UICorner_5.Parent = self.AbortButton

self.UIStroke_3.Parent = self.AbortButton
self.UIStroke_3.Color = Color3.fromRGB(255, 89, 92)
self.UIStroke_3.Thickness = 2.000
self.UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Title_4.Name = "Title"
self.Title_4.Parent = self.AbortButton
self.Title_4.AnchorPoint = Vector2.new(0, 0.5)
self.Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title_4.BackgroundTransparency = 1.000
self.Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title_4.BorderSizePixel = 0
self.Title_4.Position = UDim2.new(0, 0, 0.5, 0)
self.Title_4.Size = UDim2.new(0, 200, 0, 21)
self.Title_4.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title_4.Text = "ABORT SCRIPT"
self.Title_4.TextColor3 = Color3.fromRGB(255, 89, 92)
self.Title_4.TextSize = 16.000
self.Title_4.TextXAlignment = Enum.TextXAlignment.Left

self.UIPadding_6.Parent = self.Title_4
self.UIPadding_6.PaddingLeft = UDim.new(0, 10)

self.Value_3.Name = "Value"
self.Value_3.Parent = self.AbortButton
self.Value_3.AnchorPoint = Vector2.new(1, 0.5)
self.Value_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Value_3.BackgroundTransparency = 1.000
self.Value_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Value_3.BorderSizePixel = 0
self.Value_3.Position = UDim2.new(1, 0, 0.5, 0)
self.Value_3.Size = UDim2.new(0, 200, 0, 21)
self.Value_3.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Value_3.Text = "button"
self.Value_3.TextColor3 = Color3.fromRGB(255, 89, 92)
self.Value_3.TextSize = 14.000
self.Value_3.TextXAlignment = Enum.TextXAlignment.Right

self.UIPadding_7.Parent = self.Value_3
self.UIPadding_7.PaddingRight = UDim.new(0, 10)

self.Interact_3.Name = "Interact"
self.Interact_3.Parent = self.AbortButton
self.Interact_3.AnchorPoint = Vector2.new(0.5, 0.5)
self.Interact_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Interact_3.BackgroundTransparency = 1.000
self.Interact_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_3.BorderSizePixel = 0
self.Interact_3.Position = UDim2.new(0.5, 0, 0.5, 0)
self.Interact_3.Size = UDim2.new(0, 491, 0, 34)
self.Interact_3.AutoButtonColor = false
self.Interact_3.Font = Enum.Font.SourceSans
self.Interact_3.Text = ""
self.Interact_3.TextColor3 = Color3.fromRGB(0, 0, 0)
self.Interact_3.TextSize = 14.000

self.fruits_panel.Name = "fruits_panel"
self.fruits_panel.Parent = self.Holder
self.fruits_panel.AnchorPoint = Vector2.new(0.5, 0.5)
self.fruits_panel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.fruits_panel.BackgroundTransparency = 1.000
self.fruits_panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.fruits_panel.BorderSizePixel = 0
self.fruits_panel.Position = UDim2.new(0.5, 0, 0.5, 0)
self.fruits_panel.Size = UDim2.new(0, 521, 0, 200)
self.fruits_panel.Visible = false
self.fruits_panel.CanvasSize = UDim2.new(0, 0, 0, 0)
self.fruits_panel.AutomaticCanvasSize = Enum.AutomaticSize.Y
self.fruits_panel.ScrollBarThickness = 6
self.fruits_panel.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)

self.UIListLayout_Fruits.Parent = self.fruits_panel
self.UIListLayout_Fruits.HorizontalAlignment = Enum.HorizontalAlignment.Center
self.UIListLayout_Fruits.SortOrder = Enum.SortOrder.LayoutOrder
self.UIListLayout_Fruits.Padding = UDim.new(0, 8)

self.UIPadding_Fruits.Parent = self.fruits_panel
self.UIPadding_Fruits.PaddingTop = UDim.new(0, 10)
self.UIPadding_Fruits.PaddingBottom = UDim.new(0, 10)

self.RightPanel.Name = "RightPanel"
self.RightPanel.Parent = self.Main
self.RightPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.RightPanel.BorderSizePixel = 0
self.RightPanel.Position = UDim2.new(1, 10, 0, 0)
self.RightPanel.Size = UDim2.new(0, 200, 1, 0)

local rpCorner = Instance.new("UICorner")
rpCorner.CornerRadius = UDim.new(0, 5)
rpCorner.Parent = self.RightPanel

local rpGradient = Instance.new("UIGradient")
rpGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 15, 15)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(60, 60, 60)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(240, 240, 240))
}
rpGradient.Offset = Vector2.new(0, 0.045)
rpGradient.Rotation = 75
rpGradient.Parent = self.RightPanel

local rpStroke = Instance.new("UIStroke")
rpStroke.Color = Color3.fromRGB(255, 255, 255)
rpStroke.Thickness = 1.5
rpStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
rpStroke.Parent = self.RightPanel

self.RPTitle.Name = "RPTitle"
self.RPTitle.Parent = self.RightPanel
self.RPTitle.AnchorPoint = Vector2.new(0.5, 0)
self.RPTitle.BackgroundTransparency = 1.000
self.RPTitle.Position = UDim2.new(0.5, 0, 0.05, 0)
self.RPTitle.Size = UDim2.new(0.9, 0, 0, 20)
self.RPTitle.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.RPTitle.Text = "SPAWNED FRUITS"
self.RPTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
self.RPTitle.TextSize = 14.000
self.RPTitle.TextXAlignment = Enum.TextXAlignment.Center

self.RPList.Name = "RPList"
self.RPList.Parent = self.RightPanel
self.RPList.AnchorPoint = Vector2.new(0.5, 0)
self.RPList.BackgroundTransparency = 1.000
self.RPList.BorderSizePixel = 0
self.RPList.Position = UDim2.new(0.5, 0, 0.15, 0)
self.RPList.Size = UDim2.new(0.9, 0, 0.8, 0)
self.RPList.CanvasSize = UDim2.new(0, 0, 0, 0)
self.RPList.AutomaticCanvasSize = Enum.AutomaticSize.Y
self.RPList.ScrollBarThickness = 4
self.RPList.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)

self.RPListLayout.Parent = self.RPList
self.RPListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
self.RPListLayout.SortOrder = Enum.SortOrder.LayoutOrder
self.RPListLayout.Padding = UDim.new(0, 5)

self.Buttons.Name = "Buttons"
self.Buttons.Parent = self.Main
self.Buttons.AnchorPoint = Vector2.new(0.5, 1)
self.Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Buttons.BackgroundTransparency = 1.000
self.Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Buttons.BorderSizePixel = 0
self.Buttons.Position = UDim2.new(0.5, 0, 0.340802193, 0)
self.Buttons.Size = UDim2.new(0, 521, 0, 55)

self.UIListLayout_3.Parent = self.Buttons
self.UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
self.UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
self.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
self.UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
self.UIListLayout_3.Padding = UDim.new(0, 10)

self.Status_2.Name = "Status"
self.Status_2.Parent = self.Buttons
self.Status_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Status_2.BackgroundTransparency = 0.900
self.Status_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Status_2.BorderSizePixel = 0
self.Status_2.LayoutOrder = 1
self.Status_2.Size = UDim2.new(0, 90, 0, 37)
self.Status_2.AutoButtonColor = false
self.Status_2.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
self.Status_2.Text = "STATUS"
self.Status_2.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Status_2.TextSize = 16.000

self.UICorner_7.CornerRadius = UDim.new(0, 99)
self.UICorner_7.Parent = self.Status_2

self.UIStroke_5.Parent = self.Status_2
self.UIStroke_5.Color = Color3.fromRGB(207, 207, 207)
self.UIStroke_5.Thickness = 1.500
self.UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Settings.Name = "Settings"
self.Settings.Parent = self.Buttons
self.Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Settings.BackgroundTransparency = 0.900
self.Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Settings.BorderSizePixel = 0
self.Settings.LayoutOrder = 2
self.Settings.Size = UDim2.new(0, 96, 0, 37)
self.Settings.AutoButtonColor = false
self.Settings.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
self.Settings.Text = "SETTINGS"
self.Settings.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Settings.TextSize = 16.000

self.UICorner_8.CornerRadius = UDim.new(0, 99)
self.UICorner_8.Parent = self.Settings

self.UIStroke_6.Parent = self.Settings
self.UIStroke_6.Color = Color3.fromRGB(207, 207, 207)
self.UIStroke_6.Thickness = 1.500
self.UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.FruitsBtn.Name = "Fruits"
self.FruitsBtn.Parent = self.Buttons
self.FruitsBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.FruitsBtn.BackgroundTransparency = 0.900
self.FruitsBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.FruitsBtn.BorderSizePixel = 0
self.FruitsBtn.LayoutOrder = 3
self.FruitsBtn.Size = UDim2.new(0, 96, 0, 37)
self.FruitsBtn.AutoButtonColor = false
self.FruitsBtn.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
self.FruitsBtn.Text = "FRUITS"
self.FruitsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
self.FruitsBtn.TextSize = 16.000

self.UICorner_Fruits.CornerRadius = UDim.new(0, 99)
self.UICorner_Fruits.Parent = self.FruitsBtn

self.UIStroke_Fruits.Parent = self.FruitsBtn
self.UIStroke_Fruits.Color = Color3.fromRGB(207, 207, 207)
self.UIStroke_Fruits.Thickness = 1.500
self.UIStroke_Fruits.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

self.Notifications.Name = "Notifications"
self.Notifications.Parent = self.Adminus
self.Notifications.AnchorPoint = Vector2.new(1, 1)
self.Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Notifications.BackgroundTransparency = 1.000
self.Notifications.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Notifications.BorderSizePixel = 0
self.Notifications.ClipsDescendants = true
self.Notifications.Position = UDim2.new(0.999738753, 0, 1, 0)
self.Notifications.Size = UDim2.new(0, 270, 0, 629)

self.NotificationTemplate.Name = "NotificationTemplate"
self.NotificationTemplate.Parent = self.Notifications
self.NotificationTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
self.NotificationTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.NotificationTemplate.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.NotificationTemplate.BorderSizePixel = 0
self.NotificationTemplate.Position = UDim2.new(0.503134787, 0, 0.603850067, 0)
self.NotificationTemplate.Size = UDim2.new(0, 250, 0, 150)
self.NotificationTemplate.Visible = false

self.UICorner_9.Parent = self.NotificationTemplate

self.UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 10, 10)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(190, 190, 190))}
self.UIGradient_2.Offset = Vector2.new(0, 0.400000006)
self.UIGradient_2.Rotation = 70
self.UIGradient_2.Parent = self.NotificationTemplate

self.Title_6.Name = "Title"
self.Title_6.Parent = self.NotificationTemplate
self.Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Title_6.BackgroundTransparency = 1.000
self.Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Title_6.BorderSizePixel = 0
self.Title_6.Position = UDim2.new(0.0399999991, 0, 0.0666666701, 0)
self.Title_6.Size = UDim2.new(0, 124, 0, 17)
self.Title_6.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
self.Title_6.Text = "System Message"
self.Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
self.Title_6.TextSize = 12.000
self.Title_6.TextXAlignment = Enum.TextXAlignment.Left
self.Title_6.TextYAlignment = Enum.TextYAlignment.Top

self.Message.Name = "Message"
self.Message.Parent = self.NotificationTemplate
self.Message.Active = false
self.Message.AnchorPoint = Vector2.new(0.5, 0.5)
self.Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Message.BackgroundTransparency = 0.900
self.Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Message.BorderSizePixel = 0
self.Message.Position = UDim2.new(0.5, 0, 0.577000022, 0)
self.Message.Size = UDim2.new(0, 230, 0, 107)
self.Message.ClearTextOnFocus = false
self.Message.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
self.Message.ShowNativeInput = false
self.Message.Text = "Your hats have been successfully removed"
self.Message.TextColor3 = Color3.fromRGB(213, 213, 213)
self.Message.TextSize = 14.000
self.Message.TextWrapped = true
self.Message.TextXAlignment = Enum.TextXAlignment.Left
self.Message.TextYAlignment = Enum.TextYAlignment.Top

self.UICorner_10.Parent = self.Message

self.UIPadding_10.Parent = self.Message
self.UIPadding_10.PaddingBottom = UDim.new(0, 10)
self.UIPadding_10.PaddingLeft = UDim.new(0, 10)
self.UIPadding_10.PaddingRight = UDim.new(0, 10)
self.UIPadding_10.PaddingTop = UDim.new(0, 10)

self.Timer.Name = "Timer"
self.Timer.Parent = self.NotificationTemplate
self.Timer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
self.Timer.BackgroundTransparency = 1.000
self.Timer.BorderColor3 = Color3.fromRGB(0, 0, 0)
self.Timer.BorderSizePixel = 0
self.Timer.Position = UDim2.new(0.463999987, 0, 0.0666666701, 0)
self.Timer.Size = UDim2.new(0, 124, 0, 17)
self.Timer.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
self.Timer.Text = "10s"
self.Timer.TextColor3 = Color3.fromRGB(211, 211, 211)
self.Timer.TextSize = 12.000
self.Timer.TextXAlignment = Enum.TextXAlignment.Right
self.Timer.TextYAlignment = Enum.TextYAlignment.Top

self.UIListLayout_4.Parent = self.Notifications
self.UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
self.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
self.UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Bottom
self.UIListLayout_4.Padding = UDim.new(0, 5)

self.UIPadding_11.Parent = self.Notifications
self.UIPadding_11.PaddingBottom = UDim.new(0, 10)
self.UIPadding_11.PaddingLeft = UDim.new(0, 10)
self.UIPadding_11.PaddingRight = UDim.new(0, 10)
self.UIPadding_11.PaddingTop = UDim.new(0, 10)

self.Events.Name = "Events"
self.Events.Parent = self.Adminus

self.Notification.Name = "Notification"
self.Notification.Parent = self.Events
self.Notification.Archivable = true

local ENABLE_ESP = true
local TWEEN_SPEED = 250

local AllFruits = {
    "Rocket Fruit","Spin Fruit","Blade Fruit","Spring Fruit","Bomb Fruit",
    "Smoke Fruit","Spike Fruit","Flame Fruit","Ice Fruit","Sand Fruit",
    "Dark Fruit","Eagle Fruit","Diamond Fruit","Light Fruit","Rubber Fruit",
    "Ghost Fruit","Magma Fruit","Quake Fruit","Buddah Fruit","Love Fruit",
    "Creation Fruit","Spider Fruit","Sound Fruit","Pheonix Fruit","Portal Fruit",
    "Lightning Fruit","Pain Fruit","Blizzard Fruit","Gravity Fruit","Mammoth Fruit",
    "T-Rex Fruit","Dough Fruit","Shadow Fruit","Venom Fruit","Gas Fruit","Spirit Fruit",
    "Tiger Fruit","Yeti Fruit","Kitsune Fruit","Control Fruit","Dragon Fruit"
}

local function CreateFruitToggle(fruitName)
    local fruitFrame = Instance.new("Frame")
    fruitFrame.Name = fruitName .. "Frame"
    fruitFrame.Parent = self.fruits_panel
    fruitFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fruitFrame.BackgroundTransparency = 0.700
    fruitFrame.BorderSizePixel = 0
    fruitFrame.Size = UDim2.new(0, 480, 0, 34)

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 5)
    uiCorner.Parent = fruitFrame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Parent = fruitFrame
    uiStroke.Color = Color3.fromRGB(255, 255, 255)
    uiStroke.Thickness = 1.5
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Parent = fruitFrame
    title.AnchorPoint = Vector2.new(0, 0.5)
    title.BackgroundTransparency = 1.000
    title.Position = UDim2.new(0, 10, 0.5, 0)
    title.Size = UDim2.new(0, 250, 0, 21)
    title.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    title.Text = fruitName:upper()
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14.000
    title.TextXAlignment = Enum.TextXAlignment.Left

    local value = Instance.new("TextLabel")
    value.Name = "Value"
    value.Parent = fruitFrame
    value.AnchorPoint = Vector2.new(1, 0.5)
    value.BackgroundTransparency = 1.000
    value.Position = UDim2.new(1, -10, 0.5, 0)
    value.Size = UDim2.new(0, 100, 0, 21)
    value.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    value.Text = SETTINGS.Fruits[fruitName] and "TRUE" or "FALSE"
    value.TextColor3 = SETTINGS.Fruits[fruitName] and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 100)
    value.TextSize = 14.000
    value.TextXAlignment = Enum.TextXAlignment.Right

    local button = Instance.new("TextButton")
    button.Name = "Interact"
    button.Parent = fruitFrame
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.BackgroundTransparency = 1.000
    button.Position = UDim2.new(0.5, 0, 0.5, 0)
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Text = ""

    button.MouseButton1Click:Connect(function()
        SETTINGS.Fruits[fruitName] = not SETTINGS.Fruits[fruitName]
        value.Text = SETTINGS.Fruits[fruitName] and "TRUE" or "FALSE"
        value.TextColor3 = SETTINGS.Fruits[fruitName] and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 100)
        SaveConfig()
        self.Notification:Fire(fruitName .. " Sniper set to " .. tostring(SETTINGS.Fruits[fruitName]):upper(), "success")
    end)
end

for _, fruitName in ipairs(AllFruits) do
    CreateFruitToggle(fruitName)
end

local function UpdateUIValues()
    self.Value.Text = SETTINGS.HideName and "ENABLED" or "DISABLED"
    self.Value.TextColor3 = SETTINGS.HideName and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 100)

    self.Value_2.Text = SETTINGS.RemoveHats and "ENABLED" or "DISABLED"
    self.Value_2.TextColor3 = SETTINGS.RemoveHats and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 100)

    self.Value_SH.Text = SETTINGS.ServerHop and "ENABLED" or "DISABLED"
    self.Value_SH.TextColor3 = SETTINGS.ServerHop and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 100)

    self.Value_FH.Text = SETTINGS.FastHop and "ENABLED" or "DISABLED"
    self.Value_FH.TextColor3 = SETTINGS.FastHop and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 100)

    self.Value_3.Text = "ABORT"
end

UpdateUIValues()

local function TabManager()
    local main = self.Main
    local holder = main:WaitForChild("Holder")
    local buttons = main:WaitForChild("Buttons")
    
    local settingsTab = holder:WaitForChild("settings")
    local infoTab = holder:WaitForChild("information")
    local fruitsTab = holder:WaitForChild("fruits_panel")
    
    local settingsButton = buttons:WaitForChild("Settings")
    local statusButton = buttons:WaitForChild("Status")
    local fruitsButton = buttons:WaitForChild("Fruits")
    
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local currentTab
    local originalValues = {}
    
    local function cacheOriginals(tab)
        for _,obj in ipairs(tab:GetDescendants()) do
            if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                originalValues[obj] = {
                    BackgroundTransparency = obj.BackgroundTransparency
                }
            elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
                originalValues[obj] = {
                    TextTransparency = obj.TextTransparency,
                    BackgroundTransparency = obj.BackgroundTransparency
                }
            elseif obj:IsA("UIStroke") then
                originalValues[obj] = {
                    Transparency = obj.Transparency
                }
            end
        end
        if tab:IsA("Frame") or tab:IsA("ScrollingFrame") then
            originalValues[tab] = {
                BackgroundTransparency = tab.BackgroundTransparency
            }
        end
    end
    
    cacheOriginals(settingsTab)
    cacheOriginals(infoTab)
    cacheOriginals(fruitsTab)
    
    local function fadeOut(tab)
        for obj,_ in pairs(originalValues) do
            if obj == tab or obj:IsDescendantOf(tab) then
                local goals = {}
                if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                    goals.BackgroundTransparency = 1
                elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
                    goals.TextTransparency = 1
                    goals.BackgroundTransparency = 1
                elseif obj:IsA("UIStroke") then
                    goals.Transparency = 1
                end
                TweenService:Create(obj,tweenInfo,goals):Play()
            end
        end
    end
    
    local function fadeIn(tab)
        for obj,values in pairs(originalValues) do
            if obj == tab or obj:IsDescendantOf(tab) then
                TweenService:Create(obj,tweenInfo,values):Play()
            end
        end
    end
    
    local function switchTab(tab)
        if currentTab == tab then return end
        if currentTab then
            fadeOut(currentTab)
            task.wait(0.25)
            currentTab.Visible = false
        end
        tab.Visible = true
        fadeIn(tab)
        currentTab = tab
    end
    
    settingsButton.MouseButton1Click:Connect(function()
        switchTab(settingsTab)
    end)
    
    statusButton.MouseButton1Click:Connect(function()
        switchTab(infoTab)
    end)
    
    fruitsButton.MouseButton1Click:Connect(function()
        switchTab(fruitsTab)
    end)
    
    settingsTab.Visible = false
    infoTab.Visible = false
    fruitsTab.Visible = false
    
    switchTab(infoTab)
end
task.spawn(TabManager)

local function UILoadAnimation()
    local main = self.Main
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local originalValues = {}
    
    local function hideUIRecursive(obj)
        if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
            originalValues[obj] = {BackgroundTransparency = obj.BackgroundTransparency}
            obj.BackgroundTransparency = 1
        elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
            originalValues[obj] = {
                TextTransparency = obj.TextTransparency,
                BackgroundTransparency = obj.BackgroundTransparency
            }
            obj.TextTransparency = 1
            obj.BackgroundTransparency = 1
        elseif obj:IsA("UIStroke") then
            originalValues[obj] = {
                Transparency = obj.Transparency
            }
            obj.Transparency = 1
        end
        for _, child in ipairs(obj:GetChildren()) do
            hideUIRecursive(child)
        end
    end
    
    task.wait(0.5)
    main.Visible = true
    hideUIRecursive(main)
    
    for obj, values in pairs(originalValues) do
        TweenService:Create(obj, tweenInfo, values):Play()
    end
end
task.spawn(UILoadAnimation)

local function ButtonAnimation()
    local camera = game.Workspace.Camera
    local main = self.Main
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local originalValues = {}
    local originalFOV = camera.FieldOfView
    
    local function getVisualObject(obj)
        if obj.Name == "Interact" and obj.Parent:IsA("Frame") then
            return obj.Parent
        end
        return obj
    end
    
    local function cacheOriginalValues(obj)
        if obj:IsA("TextButton") then
            local target = getVisualObject(obj)
            originalValues[target] = {Size = target.Size}
        end
    end
    
    local function ClickIn(obj)
        local target = getVisualObject(obj)
        if not originalValues[target] then return end
        local originalSize = originalValues[target].Size
        local shrinkSize = UDim2.new(
            originalSize.X.Scale,
            originalSize.X.Offset - 4,
            originalSize.Y.Scale,
            originalSize.Y.Offset - 4
        )
        TweenService:Create(target, tweenInfo, {Size = shrinkSize}):Play()
        TweenService:Create(camera, tweenInfo, {FieldOfView = originalFOV - 5}):Play()
    end
    
    local function ClickOut(obj)
        local target = getVisualObject(obj)
        if not originalValues[target] then return end
        TweenService:Create(target, tweenInfo, {Size = originalValues[target].Size}):Play()
        TweenService:Create(camera, tweenInfo, {FieldOfView = originalFOV}):Play()
    end
    
    for _, obj in pairs(main:GetDescendants()) do
        if obj:IsA("TextButton") then
            cacheOriginalValues(obj)
            obj.MouseButton1Down:Connect(function() ClickIn(obj) end)
            obj.MouseButton1Up:Connect(function() ClickOut(obj) end)
        end
    end
end
task.spawn(ButtonAnimation)

local function IdleAnimation()
    local main = self.Main
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local transparencyCache = {}
    local fadeAmount = 0.4
    
    local function cacheTransparency()
        for _, obj in pairs(self.xzyp_Fruitaroo:GetDescendants()) do
            if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                transparencyCache[obj] = {
                    BackgroundTransparency = obj.BackgroundTransparency
                }
            elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
                transparencyCache[obj] = {
                    BackgroundTransparency = obj.BackgroundTransparency,
                    TextTransparency = obj.TextTransparency
                }
            elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                transparencyCache[obj] = {
                    BackgroundTransparency = obj.BackgroundTransparency,
                    ImageTransparency = obj.ImageTransparency
                }
            elseif obj:IsA("UIStroke") then
                transparencyCache[obj] = {
                    Transparency = obj.Transparency
                }
            end
        end
    end
    
    local function fadeOut()
        for obj, values in pairs(transparencyCache) do
            local goal = {}
            for property, value in pairs(values) do
                goal[property] = math.clamp(value + fadeAmount, 0, 1)
            end
            TweenService:Create(obj, tweenInfo, goal):Play()
        end
    end
    
    local function fadeIn()
        for obj, values in pairs(transparencyCache) do
            TweenService:Create(obj, tweenInfo, values):Play()
        end
    end
    
    cacheTransparency()
    main.MouseEnter:Connect(fadeIn)
    main.MouseLeave:Connect(fadeOut)
end
task.spawn(IdleAnimation)

local function NotificationManager()
    local notifications = self.Notifications
    local template = notifications.NotificationTemplate
    local event = self.Notification
    local duration = 5
    
    local function fadeObject(object, target, time, originals)
        for _, v in ipairs(object:GetDescendants()) do
            local props = {}
            if v:IsA("Frame") or v:IsA("ScrollingFrame") then
                local orig = originals[v] and originals[v].BackgroundTransparency or v.BackgroundTransparency
                props.BackgroundTransparency = target == 0 and orig or 1
            end
            if v:IsA("TextLabel") or v:IsA("TextBox") then
                local origText = originals[v] and originals[v].TextTransparency or v.TextTransparency
                local origBg = originals[v] and originals[v].BackgroundTransparency or v.BackgroundTransparency
                props.TextTransparency = target == 0 and origText or 1
                props.BackgroundTransparency = target == 0 and origBg or 1
            end
            if next(props) then
                TweenService:Create(v, TweenInfo.new(time), props):Play()
            end
        end
        local mainOrig = originals[object] and originals[object].BackgroundTransparency or object.BackgroundTransparency
        TweenService:Create(object, TweenInfo.new(time), {BackgroundTransparency = target == 0 and mainOrig or 1}):Play()
    end
    
    event.Event:Connect(function(text, notifType)
        local notif = template:Clone()
        notif.Visible = true
        notif.Parent = notifications
        
        local message = notif:FindFirstChild("Message")
        local timer = notif:FindFirstChild("Timer")
        local gradient = notif:FindFirstChild("UIGradient")
        
        if message then
            message.Text = text
        end
        
        if gradient then
            if notifType == "error" then
                gradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(10,10,10)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4))
                }
            elseif notifType == "success" then
                gradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(10,10,10)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(53, 255, 137))
                }
            end
        end
        
        local originals = {}
        originals[notif] = {BackgroundTransparency = notif.BackgroundTransparency}
        for _, v in ipairs(notif:GetDescendants()) do
            originals[v] = {}
            if v:IsA("Frame") or v:IsA("ScrollingFrame") then
                originals[v].BackgroundTransparency = v.BackgroundTransparency
            elseif v:IsA("TextLabel") or v:IsA("TextButton") then
                originals[v].TextTransparency = v.TextTransparency
                originals[v].BackgroundTransparency = v.BackgroundTransparency
            elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then
                originals[v].ImageTransparency = v.ImageTransparency
            end
        end
        
        for obj, _ in pairs(originals) do
            if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                obj.BackgroundTransparency = 1
            elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
                obj.TextTransparency = 1
                obj.BackgroundTransparency = 1
            elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                obj.ImageTransparency = 1
            end
        end
        
        fadeObject(notif, 0, 0.2, originals)
        
        task.spawn(function()
            for i = duration, 1, -1 do
                if timer then
                    timer.Text = tostring(i) .. "s"
                end
                task.wait(1)
            end
        end)
        
        task.wait(duration)
        fadeObject(notif, 1, 0.2, originals)
        task.wait(0.3)
        notif:Destroy()
    end)
end
task.spawn(NotificationManager)

local function SettingsManager()
    local notify = self.Notification
    
    local buttons = {
        hideHats = self.RemoveHatsButton.Interact,
        hideName = self.HideNameButton.Interact,
        abortScript = self.AbortButton.Interact,
        serverHop = self.ServerHopButton.Interact,
        fastHop = self.FastHopButton.Interact
    }
    
    buttons.hideHats.MouseButton1Click:Connect(function()
        SETTINGS.RemoveHats = not SETTINGS.RemoveHats
        SaveConfig()
        UpdateUIValues()
        if player.Character then
            if SETTINGS.RemoveHats then
                for _, accessory in pairs(player.Character:GetChildren()) do
                    if accessory:IsA("Accessory") then
                        accessory:Destroy()
                    end
                end
            end
        end
        notify:Fire("Auto Remove Hats set to " .. (SETTINGS.RemoveHats and "ENABLED" or "DISABLED"), "success")
    end)
    
    buttons.hideName.MouseButton1Click:Connect(function()
        SETTINGS.HideName = not SETTINGS.HideName
        SaveConfig()
        UpdateUIValues()
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.DisplayDistanceType = SETTINGS.HideName and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Subject
            end
        end
        notify:Fire("Hide Name set to " .. (SETTINGS.HideName and "ENABLED" or "DISABLED"), "success")
    end)
    
    buttons.abortScript.MouseButton1Click:Connect(function()
        notify:Fire("xzyp Fruitaroo is aborting the script.", "error")
        task.wait(2)
        player:Kick("xzyp Fruitaroo has been force stopped by " .. player.Name .. ".")
        self.xzyp_Fruitaroo:Destroy()
    end)
    
    buttons.serverHop.MouseButton1Click:Connect(function()
        SETTINGS.ServerHop = not SETTINGS.ServerHop
        SaveConfig()
        UpdateUIValues()
        notify:Fire("Server Hop set to " .. (SETTINGS.ServerHop and "ENABLED" or "DISABLED"), "success")
    end)

    buttons.fastHop.MouseButton1Click:Connect(function()
        SETTINGS.FastHop = not SETTINGS.FastHop
        SaveConfig()
        UpdateUIValues()
        notify:Fire("Fast Hop set to " .. (SETTINGS.FastHop and "ENABLED" or "DISABLED"), "success")
    end)
end
task.spawn(SettingsManager)

local visitedServers = {}
local cursor = nil
local hopping = false
local currentPlaceId = nil

local REQUEST_DELAY = 2
local TELEPORT_DELAY = 3
local REFRESH_INTERVAL = 10
local lastRefresh = 0

local function safeJSONDecode(str)
    local ok, result = pcall(HttpService.JSONDecode, HttpService, str)
    return ok and result or nil
end

local function httpGet(url)
    
    local req = request or http_request or (syn and syn.request) or (http and http.request)
    if req then
        local ok, res = pcall(req, { Url = url, Method = "GET" })
        if ok and res and type(res) == "table" and res.Body then
            return res.Body
        end
    end
    
    local ok, body = pcall(function() return game:HttpGet(url) end)
    if ok and body then return body end
    return nil
end

local function queueOnTeleport(code)
    
    local queue = queue_on_teleport          
        or queueonteleport                   
        or (syn and syn.queue_on_teleport)   
        or (fluid and fluid.queue_on_teleport) 
    
    if not queue then
        queue = rawget(_G, "queue_on_teleport") or rawget(_G, "queueonteleport")
    end
    if queue then
        local ok, err = pcall(queue, code)
        if ok then
            print("[XZYP FRUITAROO] - Script queued for reinjection.")
            return true
        else
            warn("[XZYP FRUITAROO] - queueOnTeleport error: " .. tostring(err))
        end
    else
        warn("[XZYP FRUITAROO] - No queue_on_teleport found. Reinject after hop may not work.")
    end
    return false
end

local REINJECT_CODE = [[
    repeat task.wait(0.5) until game:IsLoaded()
    task.wait(2)
    local ok, err = pcall(function()
        if isfile and isfile("FruitSniper_combined.lua") then
            loadstring(readfile("FruitSniper_combined.lua"))()
        else
            local githubUrl = _G.FruitSniperGithubUrl or "]] .. GITHUB_URL .. [["
            if githubUrl and githubUrl ~= "" and githubUrl:find("http") then
                loadstring(game:HttpGet(githubUrl))()
            end
        end
    end)
    if not ok then warn("[XZYP FRUITAROO] Reinject error: " .. tostring(err)) end
]]

local function fireClick(button)
    local m1c = button:FindFirstChild("MouseButton1Click") or button.MouseButton1Click
    if firesignal then
        pcall(firesignal, m1c)
    elseif getconnections then
        for _, conn in pairs(getconnections(m1c)) do
            pcall(function() conn:Fire() end)
        end
    end
end

local function hop(placeId)
    if hopping then
        print("[XZYP FRUITAROO] - Already hopping, skipping")
        return
    end

    hopping = true
    currentPlaceId = placeId

    local playerGui = Player:WaitForChild("PlayerGui")
    local serverBrowser = playerGui:FindFirstChild("ServerBrowser")
    local successHop = false

    if serverBrowser then
        print("[XZYP FRUITAROO] - Found in-game ServerBrowser GUI. Activating...")
        pcall(function()
            if _G.toggleMenu then
                _G.toggleMenu("ServerBrowser")
            else
                serverBrowser.Enabled = true
            end
        end)
        task.wait(0.5)

        local frame = serverBrowser:FindFirstChild("Frame")
        local refresh = frame and frame:FindFirstChild("Refresh")
        local inside = frame and frame:FindFirstChild("FakeScroll") and frame.FakeScroll:FindFirstChild("Inside")

        if refresh and inside then
            print("[XZYP FRUITAROO] - Triggering Server Browser refresh via UI button...")
            fireClick(refresh)

            local startTime = tick()
            local loaded = false
            repeat
                task.wait(0.5)
                local count = 0
                for _, child in pairs(inside:GetChildren()) do
                    if child:IsA("Frame") and child:FindFirstChild("Join") and child.Join:GetAttribute("Job") ~= "" then
                        count = count + 1
                    end
                end
                if count > 2 then
                    loaded = true
                    break
                end
            until tick() - startTime > 12

            if loaded then
                local candidates = {}
                for _, child in pairs(inside:GetChildren()) do
                    if child:IsA("Frame") and child:FindFirstChild("Join") and child:FindFirstChild("TextLabel") then
                        local job = child.Join:GetAttribute("Job")
                        if job and job ~= "" and job ~= game.JobId then
                            local text = child.TextLabel.Text
                            local countStr = string.match(text, "Players:%s*(%d+)")
                            local count = tonumber(countStr)
                            if count and count >= 3 and count < game.Players.MaxPlayers - 1 then
                                table.insert(candidates, child.Join)
                            end
                        end
                    end
                end

                print("[XZYP FRUITAROO] - Found candidates in GUI list: " .. #candidates)

                if #candidates > 0 then
                    
                    queueOnTeleport(REINJECT_CODE)

                    for _, targetBtn in ipairs(candidates) do
                        local jobId = targetBtn:GetAttribute("Job")
                        print("[XZYP FRUITAROO] - Triggering UI teleport join click for server: " .. tostring(jobId))

                        targetBtn.Text = "Join"
                        
                        local teleportFailed = false
                        local conn = TeleportService.TeleportInitFailed:Connect(function(plr)
                            if plr == player then
                                teleportFailed = true
                            end
                        end)

                        fireClick(targetBtn)

                        local t = tick()
                        repeat task.wait(0.2) until teleportFailed or tick() - t > 8

                        conn:Disconnect()

                        if not teleportFailed then
                            print("[XZYP FRUITAROO] - Teleport accepted!")
                            task.wait(10)
                            warn("[XZYP FRUITAROO] - Still in same server after 10s, trying next...")
                        else
                            print("[XZYP FRUITAROO] - Teleport failed, trying next candidate...")
                        end
                    end
                end
            else
                warn("[XZYP FRUITAROO] - GUI server list failed to load any servers.")
            end
        else
            warn("[XZYP FRUITAROO] - Invalid ServerBrowser frame structure.")
        end
    else
        warn("[XZYP FRUITAROO] - ServerBrowser ScreenGui not found in PlayerGui.")
    end

    print("[XZYP FRUITAROO] - All in-game candidates exhausted/empty. Using matchmaking fallback...")
    queueOnTeleport(REINJECT_CODE)
    local ok = pcall(function()
        TeleportService:Teleport(placeId, player)
    end)

    if not ok then
        warn("[XZYP FRUITAROO] - Matchmaking fallback failed. Retrying hop in 5s...")
        task.wait(5)
        hopping = false
        hop(placeId)
    end
end

local function ServerHop()
    if not SETTINGS.ServerHop then
        print("[XZYP FRUITAROO] - Server Hop is disabled in settings.")
        return
    end

    local char = Player.Character
    if char and char:GetAttribute("InCombat") == true then
        print("[XZYP FRUITAROO] - In combat! Waiting to server hop...")
        repeat
            task.wait(1)
            char = Player.Character
        until not char or char:GetAttribute("InCombat") ~= true
        print("[XZYP FRUITAROO] - Out of combat. Proceeding to server hop...")
    end

    print("[XZYP FRUITAROO] - Preparing to Server Hop using official Sea Travel remotes...")

    queueOnTeleport(REINJECT_CODE)

    local levelVal = player:WaitForChild("Data", 10):WaitForChild("Level", 10)
    local playerLevel = levelVal and levelVal.Value or 1
    
    local hasSea2 = playerLevel >= 700
    local hasSea3 = playerLevel >= 1500

    local currentSea = 1
    local placeId = game.PlaceId
    if placeId == 444227218 then
        currentSea = 2
    elseif placeId == 744942363 then
        currentSea = 3
    end

    local options = {}
    table.insert(options, { sea = 1, cmd = "TravelMain" })
    if hasSea2 then
        table.insert(options, { sea = 2, cmd = "TravelDressrosa" })
    end
    if hasSea3 then
        table.insert(options, { sea = 3, cmd = "TravelZou" })
    end

    local diffSeas = {}
    local sameSea = nil
    for _, opt in ipairs(options) do
        if opt.sea == currentSea then
            sameSea = opt
        else
            table.insert(diffSeas, opt)
        end
    end

    local shuffledDiff = {}
    while #diffSeas > 0 do
        local idx = math.random(1, #diffSeas)
        table.insert(shuffledDiff, diffSeas[idx])
        table.remove(diffSeas, idx)
    end

    local travelSequence = {}
    for _, opt in ipairs(shuffledDiff) do
        table.insert(travelSequence, opt.cmd)
    end
    if sameSea then
        table.insert(travelSequence, sameSea.cmd)
    end

    local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    for _, cmd in ipairs(travelSequence) do
        print("[XZYP FRUITAROO] - Attempting travel remote: " .. cmd)
        
        local success, result = pcall(function()
            return CommF:InvokeServer(cmd)
        end)

        task.wait(SETTINGS.FastHop and 0.5 or 3)

        if success and result ~= "unauthorized" then
            print("[XZYP FRUITAROO] - Travel request accepted for: " .. cmd)
            task.wait(SETTINGS.FastHop and 2 or 7)
        else
            warn("[XZYP FRUITAROO] - Travel command rejected/unauthorized: " .. cmd)
        end
    end

    print("[XZYP FRUITAROO] - All official Sea Travel remotes failed, using UI list fallback...")
    hop(placeId)
end

local Status = self.Status
local TweenStatus = self.TweenStatus
local StoreStatus = self.StoringStatus
local FruitType = self.FruitType
local DistanceText = self.FruitDistance

local function IsAllowedFruit(fruitName)
    return SETTINGS.Fruits[fruitName] == true
end

local function IsFruit(tool)
    return tool:IsA("Tool")
        and tool:FindFirstChild("Handle")
        and string.find(tool.Name, "Fruit")
end

local function GetAllFruits()
    local fruits = {}
    for _,v in pairs(Workspace:GetChildren()) do
        if IsFruit(v) then
            table.insert(fruits, v)
        end
    end
    return fruits
end

local function GetBestFruit(fruits)
    for _,fruit in pairs(fruits) do
        if IsAllowedFruit(fruit.Name) then
            return fruit
        end
    end
    return nil
end

local function CreateESP(fruit)
    if not ENABLE_ESP then return end
    if fruit:FindFirstChild("FruitESP") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "FruitESP"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.Parent = fruit.Handle

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 100, 255)
    label.TextStrokeTransparency = 0
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = fruit.Name
    label.Parent = billboard
end

local function getRootPart()
    local char = Player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function TweenTo(position)
    local hrp = getRootPart()
    if not hrp then return end

    local distance = (hrp.Position - position).Magnitude
    local time = distance / TWEEN_SPEED

    local oldAnchored = hrp.Anchored
    hrp.Anchored = true

    local tween = TweenService:Create(
        hrp,
        TweenInfo.new(time, Enum.EasingStyle.Linear),
        {CFrame = CFrame.new(position)}
    )
    DistanceText.Text = 'Fruit Distance: <font color="rgb(255,255,255)" weight="Regular">'..math.floor(distance)..'</font>'
    TweenStatus.Text = 'Tweening Status: <font color="rgb(0,170,255)" weight="Regular">Tweening...</font>'
    
    tween:Play()

    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        local currentHrp = getRootPart()
        if currentHrp then
            local dist = (currentHrp.Position - position).Magnitude
            DistanceText.Text = 'Fruit Distance: <font color="rgb(255,255,255)" weight="Regular">'..math.floor(dist)..'</font>'
        end
    end)

    pcall(function()
        tween.Completed:Wait()
    end)

    if connection then
        connection:Disconnect()
    end

    hrp.Anchored = oldAnchored
    TweenStatus.Text = 'Tweening Status: <font color="rgb(0,255,0)" weight="Regular">Tweening done</font>'
end

local function StoreFruit(fruit)
    local success, err = pcall(function()
        local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
        CommF:InvokeServer(
            "StoreFruit",
            fruit:GetAttribute("OriginalName"),
            fruit
        )
    end)

    if not success then
        StoreStatus.Text = 'Storing Status: <font color="rgb(255,255,0)" weight="Regular">Failed storing fruit... </font>'..tostring(err)
    end
end

local function UpdateSpawnedFruitsList(fruits)
    
    for _, child in ipairs(self.RPList:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end

    if #fruits == 0 then
        local noFruitsLabel = Instance.new("TextLabel")
        noFruitsLabel.Name = "NoFruitsLabel"
        noFruitsLabel.Parent = self.RPList
        noFruitsLabel.BackgroundTransparency = 1.000
        noFruitsLabel.Size = UDim2.new(1, 0, 0, 30)
        noFruitsLabel.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.Medium, Enum.FontStyle.Italic)
        noFruitsLabel.Text = "No Fruits Spawned"
        noFruitsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        noFruitsLabel.TextSize = 12.000
        return
    end

    for _, fruit in ipairs(fruits) do
        local frame = Instance.new("Frame")
        frame.Name = fruit.Name .. "_Item"
        frame.Parent = self.RPList
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        frame.BackgroundTransparency = 0.85
        frame.Size = UDim2.new(1, 0, 0, 26)

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Parent = frame
        label.BackgroundTransparency = 1.000
        label.Position = UDim2.new(0, 8, 0, 0)
        label.Size = UDim2.new(1, -16, 1, 0)
        label.FontFace = Font.new("rbxasset://fonts/families/Inter", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        label.Text = fruit.Name
        
        if IsAllowedFruit(fruit.Name) then
            label.TextColor3 = Color3.fromRGB(0, 255, 127) 
        else
            label.TextColor3 = Color3.fromRGB(200, 200, 200) 
        end
        
        label.TextSize = 11.000
        label.TextXAlignment = Enum.TextXAlignment.Left

        local btn = Instance.new("TextButton")
        btn.Name = "TeleportBtn"
        btn.Parent = frame
        btn.BackgroundTransparency = 1.000
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.Text = ""

        btn.MouseButton1Click:Connect(function()
            if fruit and fruit:FindFirstChild("Handle") then
                self.Notification:Fire("Manual Teleport to: " .. fruit.Name, "success")
                task.spawn(function()
                    TweenTo(fruit.Handle.Position)
                end)
            else
                self.Notification:Fire("Fruit has been collected or destroyed.", "error")
            end
        end)
    end
end

local function Main()
    while true do
        Status.Text = 'Status: <font color="rgb(255,255,0)" weight="Regular">Searching fruit...</font>'

        local fruits = GetAllFruits()
        UpdateSpawnedFruitsList(fruits)

        if #fruits == 0 then
            if SETTINGS.ServerHop then
                Status.Text = 'Status: <font color="rgb(255,0,0)" weight="Regular">No fruit found, server hopping...</font>'
                task.wait(2)
                ServerHop()
                return
            else
                Status.Text = 'Status: <font color="rgb(255,100,0)" weight="Regular">No fruit found, waiting...</font>'
                task.wait(5)
            end
        else
            for _, fruit in pairs(fruits) do
                CreateESP(fruit)
            end

            local target = GetBestFruit(fruits)

            if not target then
                if SETTINGS.ServerHop then
                    Status.Text = 'Status: <font color="rgb(255,0,0)" weight="Regular">No allowed fruits found, server hopping...</font>'
                    task.wait(2)
                    ServerHop()
                    return
                else
                    Status.Text = 'Status: <font color="rgb(255,100,0)" weight="Regular">No allowed fruits found, waiting...</font>'
                    task.wait(5)
                end
            else
                Status.Text = 'Status: <font color="rgb(0,255,0)" weight="Regular">Fruit found</font>'
                FruitType.Text = 'Fruit Type: <font color="rgb(0,255,0)" weight="Regular">'..target.Name..'</font>'

                TweenTo(target.Handle.Position)

                Status.Text = 'Status: <font color="rgb(255,165,0)" weight="Regular">Picking up fruit...</font>'
                local pickupStart = tick()
                while target.Parent == Workspace and tick() - pickupStart < 3 do
                    local hrp = getRootPart()
                    if hrp and target:FindFirstChild("Handle") then
                        hrp.CFrame = target.Handle.CFrame
                    end
                    task.wait(0.1)
                end

                if target.Parent ~= Workspace then
                    
                    local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:EquipTool(target)
                    end
                    task.wait(0.5)

                    StoreFruit(target)
                    StoreStatus.Text = 'Storing Status: <font color="rgb(0,255,0)" weight="Regular">Fruit Stored</font>'
                else
                    StoreStatus.Text = 'Storing Status: <font color="rgb(255,0,0)" weight="Regular">Failed to pick up</font>'
                end
                task.wait(2)

                if SETTINGS.ServerHop then
                    ServerHop()
                    return
                else
                    Status.Text = 'Status: <font color="rgb(0,255,0)" weight="Regular">Done. Waiting for next spawn...</font>'
                    task.wait(10)
                end
            end
        end
    end
end

task.spawn(Main)
