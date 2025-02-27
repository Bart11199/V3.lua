local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local UIS = game:GetService("UserInputService")

-- Crear GUI
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "CustomMenu"

-- Botón de apertura (Letra R en rojo)
local OpenButton = Instance.new("TextButton", ScreenGui)
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Position = UDim2.new(0.05, 0, 0.05, 0)
OpenButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Rojo
OpenButton.Text = "R"
OpenButton.TextColor3 = Color3.new(1, 1, 1)
OpenButton.Visible = true

-- Crear el Menú Principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false

-- Botón de cierre
local CloseButton = Instance.new("TextButton", MainFrame)
CloseButton.Size = UDim2.new(0, 50, 0, 50)
CloseButton.Position = UDim2.new(0.85, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"

-- Función para abrir/cerrar el menú
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenButton.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenButton.Visible = true
end)

-- Función para agregar sliders
function CreateSlider(name, min, max, default, parent, callback)
    local SliderFrame = Instance.new("Frame", parent)
    SliderFrame.Size = UDim2.new(0, 250, 0, 50)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local SliderText = Instance.new("TextLabel", SliderFrame)
    SliderText.Size = UDim2.new(0, 150, 0, 50)
    SliderText.Text = name .. ": " .. default
    SliderText.TextColor3 = Color3.new(1, 1, 1)

    local Slider = Instance.new("TextButton", SliderFrame)
    Slider.Size = UDim2.new(0, 100, 0, 50)
    Slider.Position = UDim2.new(0.6, 0, 0, 0)
    Slider.Text = "0"
    
    local value = default

    Slider.MouseButton1Click:Connect(function()
        value = value + 1
        if value > max then value = min end
        SliderText.Text = name .. ": " .. value
        callback(value)
    end)

    return SliderFrame
end

-- Funciones de Speed, Jump Higher y Increase Damage
CreateSlider("Speed", 1, 200, 16, MainFrame, function(val)
    Player.Character.Humanoid.WalkSpeed = val
end)

CreateSlider("Jump Higher", 1, 200, 50, MainFrame, function(val)
    Player.Character.Humanoid.JumpPower = val
end)

CreateSlider("Increase Damage", 1, 500, 1, MainFrame, function(val)
    local multiplier = val * 2
    print("Nuevo daño x" .. multiplier)
    -- Aquí puedes aplicar el daño multiplicado en el juego.
end)

-- Aimlock (PerfectShot)
local AimlockCircle = Instance.new("Frame", ScreenGui)
AimlockCircle.Size = UDim2.new(0, 100, 0, 100)
AimlockCircle.Position = UDim2.new(0.5, -50, 0.5, -50)
AimlockCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AimlockCircle.BackgroundTransparency = 0.5
AimlockCircle.Visible = false

-- Slider para potencia del Aimlock
CreateSlider("PerfectShot Power", 1, 100, 50, MainFrame, function(val)
    print("Precisión Aimlock: " .. val)
    -- Modificar precisión aquí
end)

-- Activación del Aimlock solo cuando atacas
local function OnAttack()
    AimlockCircle.Visible = true
    wait(0.5)
    AimlockCircle.Visible = false
    -- Código de aimlock aquí
end

-- Detectar disparos para activar el aimlock
UIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        OnAttack()
    end
end)
