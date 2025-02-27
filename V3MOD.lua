-- Crear GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local subtitle = Instance.new("TextLabel")
local options = {
    "Enable Flip Rotate",
    "Google Compass",
    "Resurrection",
    "Thunder Spam",
    "Teleport Zoombiee",
    "Zombie Attack",
    "Property Weapons",
    "Slow Motion Stunt Jumps",
    "Disable Stunt Jumps",
    "Hulk Mode",
    "IronMan Mode",
    "Sword Of Thunder"
}

-- Configurar ScreenGui
screenGui.Parent = game.CoreGui

-- Configurar Frame (Fondo del menú)
frame.Size = UDim2.new(0.3, 0, 0.6, 0)
frame.Position = UDim2.new(0.35, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Configurar Título
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "menace"
title.TextColor3 = Color3.fromRGB(0, 150, 255)
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.Parent = frame

-- Configurar Subtítulo
subtitle.Size = UDim2.new(1, 0, 0.08, 0)
subtitle.Position = UDim2.new(0, 0, 0.15, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Miscellaneous"
subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subtitle.Font = Enum.Font.SourceSansBold
subtitle.TextScaled = true
subtitle.Parent = frame

-- Crear opciones del menú
for i, text in ipairs(options) do
    local option = Instance.new("TextLabel")
    option.Size = UDim2.new(0.9, 0, 0.05, 0)
    option.Position = UDim2.new(0.05, 0, 0.2 + (i * 0.06), 0)
    option.BackgroundTransparency = 1
    option.Text = text
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.Font = Enum.Font.SourceSans
    option.TextScaled = true
    option.Parent = frame
    
    -- Agregar indicador (punto rojo)
    local indicator = Instance.new("TextLabel")
    indicator.Size = UDim2.new(0.05, 0, 0.05, 0)
    indicator.Position = UDim2.new(0.92, 0, 0.2 + (i * 0.06), 0)
    indicator.BackgroundTransparency = 1
    indicator.Text = "●"
    indicator.TextColor3 = Color3.fromRGB(255, 0, 0)
    indicator.Font = Enum.Font.SourceSansBold
    indicator.TextScaled = true
    indicator.Parent = frame
end
