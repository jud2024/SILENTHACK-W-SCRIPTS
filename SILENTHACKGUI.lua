-- Criando a GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local WalkSpeedBox = Instance.new("TextBox")
local JumpPowerBox = Instance.new("TextBox")
local WalkSpeedLabel = Instance.new("TextLabel")
local JumpPowerLabel = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local NoStunToggle = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Dragging, DragInput, DragStart, StartPosition

-- Certifique-se de que a GUI persista após a morte
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "WalkSpeedAndJumpPowerGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Configuração do Frame principal
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Size = UDim2.new(0, 300, 0, 340)
Frame.Position = UDim2.new(0.5, -150, 0.5, -170)

UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 10)

UIGradient.Parent = Frame
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
}

-- WalkSpeed Label
WalkSpeedLabel.Parent = Frame
WalkSpeedLabel.Size = UDim2.new(0, 280, 0, 30)
WalkSpeedLabel.Position = UDim2.new(0, 10, 0, 10)
WalkSpeedLabel.Text = "SILENTHACK GUI   DEFINIR SPEED"
WalkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedLabel.Font = Enum.Font.GothamBold
WalkSpeedLabel.TextSize = 20
WalkSpeedLabel.BackgroundTransparency = 1

-- WalkSpeed TextBox
WalkSpeedBox.Parent = Frame
WalkSpeedBox.Size = UDim2.new(0, 280, 0, 40)
WalkSpeedBox.Position = UDim2.new(0, 10, 0, 50)
WalkSpeedBox.PlaceholderText = "Insira a WalkSpeed"
WalkSpeedBox.Text = ""
WalkSpeedBox.Font = Enum.Font.Gotham
WalkSpeedBox.TextSize = 18
WalkSpeedBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
WalkSpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner:Clone().Parent = WalkSpeedBox

-- JumpPower Label
JumpPowerLabel.Parent = Frame
JumpPowerLabel.Size = UDim2.new(0, 280, 0, 30)
JumpPowerLabel.Position = UDim2.new(0, 10, 0, 100)
JumpPowerLabel.Text = "Definir JumpPower"
JumpPowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpPowerLabel.Font = Enum.Font.GothamBold
JumpPowerLabel.TextSize = 20
JumpPowerLabel.BackgroundTransparency = 1

-- JumpPower TextBox
JumpPowerBox.Parent = Frame
JumpPowerBox.Size = UDim2.new(0, 280, 0, 40)
JumpPowerBox.Position = UDim2.new(0, 10, 0, 140)
JumpPowerBox.PlaceholderText = "Insira o JumpPower"
JumpPowerBox.Text = ""
JumpPowerBox.Font = Enum.Font.Gotham
JumpPowerBox.TextSize = 18
JumpPowerBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
JumpPowerBox.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner:Clone().Parent = JumpPowerBox

-- Button
Button.Parent = Frame
Button.Size = UDim2.new(0, 280, 0, 50)
Button.Position = UDim2.new(0, 10, 0, 200)
Button.Text = "Aplicar"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 24
Button.BackgroundColor3 = Color3.fromRGB(30, 120, 30)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner:Clone().Parent = Button

-- No Stun Toggle
NoStunToggle.Parent = Frame
NoStunToggle.Size = UDim2.new(0, 280, 0, 50)
NoStunToggle.Position = UDim2.new(0, 10, 0, 260)
NoStunToggle.Text = "No Stun: OFF"
NoStunToggle.Font = Enum.Font.GothamBold
NoStunToggle.TextSize = 24
NoStunToggle.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
NoStunToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

UICorner:Clone().Parent = NoStunToggle

-- Script de funcionalidade
local hooks = {
    walkspeed = 16,
    jumppower = 50
}

local lp = game:GetService("Players").LocalPlayer
local index
local newindex

index = hookmetamethod(game, "__index", function(self, property)
    if not checkcaller() and self:IsA("Humanoid") and self:IsDescendantOf(lp.Character) and hooks[property:lower()] then
        return hooks[property:lower()]
    end
    return index(self, property)
end)

newindex = hookmetamethod(game, "__newindex", function(self, property, value)
    if not checkcaller() and self:IsA("Humanoid") and self:IsDescendantOf(lp.Character) and hooks[property:lower()] then
        return value
    end
    return newindex(self, property, value)
end)

Button.MouseButton1Click:Connect(function()
    local ws = tonumber(WalkSpeedBox.Text)
    local jp = tonumber(JumpPowerBox.Text)

    if ws then
        hooks.walkspeed = ws
        if lp.Character and lp.Character:FindFirstChildWhichIsA("Humanoid") then
            lp.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = ws
        end
    else
        warn("Por favor, insira um número válido para WalkSpeed.")
    end

    if jp then
        hooks.jumppower = jp
        if lp.Character and lp.Character:FindFirstChildWhichIsA("Humanoid") then
            lp.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = jp
        end
    else
        warn("Por favor, insira um número válido para JumpPower.")
    end
end)

local noStunEnabled = false
NoStunToggle.MouseButton1Click:Connect(function()
    noStunEnabled = not noStunEnabled
    if noStunEnabled then
        NoStunToggle.Text = "No Stun: ON"
        NoStunToggle.BackgroundColor3 = Color3.fromRGB(30, 120, 30)
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Combat.PunchDirection:Destroy()
        end)
    else
        NoStunToggle.Text = "No Stun: OFF"
        NoStunToggle.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
    end
end)

-- Habilitando movimentação da GUI (Mouse e Toque)
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPosition = Frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        DragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        local Delta = input.Position - DragStart
        Frame.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)
