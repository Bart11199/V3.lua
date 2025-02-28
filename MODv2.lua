--// Menú UI  
local ScreenGui = Instance.new("ScreenGui")  
local MainFrame = Instance.new("Frame")  
local CloseButton = Instance.new("TextButton")  
local Logo = Instance.new("TextLabel")  

--// Propiedades del menú  
ScreenGui.Name = "MainMenu"  
ScreenGui.Parent = game.CoreGui  

MainFrame.Name = "MainFrame"  
MainFrame.Parent = ScreenGui  
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  
MainFrame.Size = UDim2.new(0, 300, 0, 400)  
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)  

CloseButton.Name = "CloseButton"  
CloseButton.Parent = MainFrame  
CloseButton.Text = "X"  
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)  
CloseButton.Size = UDim2.new(0, 40, 0, 40)  
CloseButton.Position = UDim2.new(0.85, 0, 0.05, 0)  
CloseButton.MouseButton1Click:Connect(function()  
    ScreenGui.Enabled = false  
end)  

Logo.Name = "Logo"  
Logo.Parent = ScreenGui  
Logo.Text = "R"  
Logo.TextColor3 = Color3.fromRGB(255, 0, 0)  
Logo.Size = UDim2.new(0, 50, 0, 50)  
Logo.Position = UDim2.new(0.02, 0, 0.02, 0)  
Logo.MouseButton1Click:Connect(function()  
    ScreenGui.Enabled = true  
end)  

--// Sliders y botones  
local function createSlider(name, min, max, default, callback)  
    local Slider = Instance.new("TextButton")  
    Slider.Parent = MainFrame  
    Slider.Text = name .. ": " .. default  
    Slider.Size = UDim2.new(0, 250, 0, 40)  
    Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  
    Slider.MouseButton1Click:Connect(function()  
        local newValue = math.random(min, max)  
        Slider.Text = name .. ": " .. newValue  
        callback(newValue)  
    end)  
end  

--// Funciones  
local Speed = 16  
createSlider("Speed", 1, 200, Speed, function(value)  
    Speed = value  
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed  
end)  

local Jump = 50  
createSlider("Jump Height", 1, 200, Jump, function(value)  
    Jump = value  
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump  
end)  

local DamageMultiplier = 1  
createSlider("Damage", 1, 500, DamageMultiplier, function(value)  
    DamageMultiplier = value * 2  
end)  

--// Aimlock (PerfectShot)  
local AimEnabled = false  
local AimPower = 50  

createSlider("Aim Power", 1, 100, AimPower, function(value)  
    AimPower = value  
end)  

local AimCircle = Instance.new("Frame")  
AimCircle.Size = UDim2.new(0, 100, 0, 100)  
AimCircle.Position = UDim2.new(0.5, -50, 0.5, -50)  
AimCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  
AimCircle.BackgroundTransparency = 0.5  
AimCircle.Parent = ScreenGui  

game:GetService("RunService").RenderStepped:Connect(function()  
    if AimEnabled then  
        local mouse = game.Players.LocalPlayer:GetMouse()  
        AimCircle.Position = UDim2.new(0, mouse.X - 50, 0, mouse.Y - 50)  
    end  
end)  

--// Toggle AimLock  
local AimLockButton = Instance.new("TextButton")  
AimLockButton.Parent = MainFrame  
AimLockButton.Text = "Toggle PerfectShot"  
AimLockButton.Size = UDim2.new(0, 250, 0, 40)  
AimLockButton.BackgroundColor3 = Color3.fromRGB(50, 50, 150)  
AimLockButton.MouseButton1Click:Connect(function()  
    AimEnabled = not AimEnabled  
    AimCircle.Visible = AimEnabled  
end)  

--// One Hit Kill  
local OneHit = false  
local OneHitButton = Instance.new("TextButton")  
OneHitButton.Parent = MainFrame  
OneHitButton.Text = "Toggle One Hit"  
OneHitButton.Size = UDim2.new(0, 250, 0, 40)  
OneHitButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)  
OneHitButton.MouseButton1Click:Connect(function()  
    OneHit = not OneHit  
end)  

--// Aplica el daño modificado  
game:GetService("Players").PlayerAdded:Connect(function(player)  
    player.CharacterAdded:Connect(function(character)  
        character:WaitForChild("Humanoid").Died:Connect(function()  
            if OneHit then  
                character.Humanoid.Health = 0  
            end  
        end)  
    end)  
end)  

print("Script cargado correctamente")  
