-- Tüüo ScreenGui vüü cüüc thüünh phüün
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local imageButton = Instance.new("ImageButton")
local uiCornerButton = Instance.new("UICorner")
local uiCornerFrame = Instance.new("UICorner") 


screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


frame.Parent = screenGui
frame.Size = UDim2.new(0.7, 0, 1.1, 0)
frame.Position = UDim2.new(0.25, 0, 0.35, 0) 
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
frame.BorderColor3 = Color3.fromRGB(0, 255, 0) 
frame.BorderSizePixel = 2
frame.Visible = false


uiCornerFrame.CornerRadius = UDim.new(0, 15) 
uiCornerFrame.Parent = frame


imageButton.Parent = screenGui
imageButton.Size = UDim2.new(0, 50, 0, 50)
imageButton.Position = UDim2.new(0.05, 0, 0.2, 0) 
imageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
imageButton.Image = "rbxassetid://101359812964295" 
imageButton.BorderSizePixel = 0 


uiCornerButton.CornerRadius = UDim.new(0, 15)
uiCornerButton.Parent = imageButton


imageButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible 
end)


local function enableDrag(guiObject)
    local UIS = game:GetService('UserInputService')
    local dragToggle = false
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        guiObject.Position = newPosition
    end

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end


enableDrag(imageButton)
enableDrag(frame)


-- Tüüo Frame chüüa checkbox vüü thanh ngang
local checkBoxContainer = Instance.new("Frame")
checkBoxContainer.Parent = frame -- Küüt nüüi vüüi Frame chüünh cüüa GUI
checkBoxContainer.Size = UDim2.new(1, 0, 0.2, 0) -- Chiüüm 100% chiüüu rüüng vüü 20% chiüüu cao cüüa Frame
checkBoxContainer.Position = UDim2.new(0, 0, 0.6, 0) -- Cüüch trüün 60% cüüa Frame
checkBoxContainer.BackgroundTransparency = 1 -- Khüüng cüü nüün

-- Tüüo checkbox büün trüüi
local leftCheckBox = Instance.new("ImageButton")
leftCheckBox.Parent = checkBoxContainer
leftCheckBox.Size = UDim2.new(0.1, 0, 1, 0) -- Chiüüm 10% chiüüu rüüng, chiüüu cao büüng Frame
leftCheckBox.Position = UDim2.new(0.2, 0, 0, 0) -- Cüüch trüüi 20%
leftCheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Müüu nüün
leftCheckBox.BorderSizePixel = 2
leftCheckBox.BorderColor3 = Color3.fromRGB(0, 255, 0) -- Müüu viüün
leftCheckBox.Image = "" -- Khüüng hüünh üünh müüc üüüünh

-- Tüüo checkbox büün phüüi
local rightCheckBox = Instance.new("ImageButton")
rightCheckBox.Parent = checkBoxContainer
rightCheckBox.Size = UDim2.new(0.1, 0, 1, 0) -- Chiüüm 10% chiüüu rüüng, chiüüu cao büüng Frame
rightCheckBox.Position = UDim2.new(0.7, 0, 0, 0) -- Cüüch trüüi 70%
rightCheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rightCheckBox.BorderSizePixel = 2
rightCheckBox.BorderColor3 = Color3.fromRGB(0, 255, 0)
rightCheckBox.Image = ""

-- Tüüo thanh ngang üü giüüa
local middleLine = Instance.new("Frame")
middleLine.Parent = checkBoxContainer
middleLine.Size = UDim2.new(0.3, 0, 0.1, 0) -- Chiüüu rüüng 30% vüü chiüüu cao 10%
middleLine.Position = UDim2.new(0.35, 0, 0.45, 0) -- Nüüm giüüa 2 checkbox
middleLine.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Müüu xanh
middleLine.BorderSizePixel = 0 -- Khüüng viüün

-- Tüüo TextLabel cho trüüng thüüi
local checkBoxLabel = Instance.new("TextLabel")
checkBoxLabel.Parent = checkBoxContainer
checkBoxLabel.Size = UDim2.new(1, 0, 0.3, 0) -- Chiüüu cao 30%
checkBoxLabel.Position = UDim2.new(0, 0, 1.1, 0) -- Düüüüi container
checkBoxLabel.BackgroundTransparency = 1 -- Khüüng nüün
checkBoxLabel.Text = "None selected" -- Nüüi dung müüc üüüünh
checkBoxLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Müüu chüü
checkBoxLabel.TextSize = 18
checkBoxLabel.Font = Enum.Font.SourceSans

-- Süü kiüün checkbox
local selected = "None"
leftCheckBox.MouseButton1Click:Connect(function()
    selected = "Left selected"
    leftCheckBox.Image = "rbxassetid://6031068420" -- Hüünh üünh tüüch
    rightCheckBox.Image = "" -- Büü tüüch büün phüüi
    checkBoxLabel.Text = selected
end)

rightCheckBox.MouseButton1Click:Connect(function()
    selected = "Right selected"
    rightCheckBox.Image = "rbxassetid://6031068420"
    leftCheckBox.Image = "" -- Büü tüüch büün trüüi
    checkBoxLabel.Text = selected
end)
-- Tüüo Frame chüüa toggle
local toggleContainer = Instance.new("Frame")
toggleContainer.Parent = frame -- Küüt nüüi vüüi Frame chüünh
toggleContainer.Size = UDim2.new(0.2, 0, 0.05, 0) -- Toggle nhüü güün (20% rüüng, 5% cao cüüa Frame)
toggleContainer.Position = UDim2.new(0.4, 0, 0.85, 0) -- Nüüm giüüa güün düüüüi Frame
toggleContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Müüu üüüü (tüüt müüc üüüünh)
toggleContainer.BorderSizePixel = 0

-- Bo güüc cho toggle
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0) -- Bo güüc trüün
toggleCorner.Parent = toggleContainer

-- Tüüo nüüt trüün
local toggleButton = Instance.new("Frame")
toggleButton.Parent = toggleContainer
toggleButton.Size = UDim2.new(0.4, 0, 0.8, 0) -- Nüüt chiüüm 40% rüüng, cao 80% cüüa toggle
toggleButton.Position = UDim2.new(0, 0, 0.1, 0) -- Vüü trüü büün trüüi (tüüt)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Müüu trüüng
toggleButton.BorderSizePixel = 0

-- Bo güüc cho nüüt trüün
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(1, 0) -- Bo güüc trüün
buttonCorner.Parent = toggleButton

-- Trüüng thüüi Toggle
local isOn = false -- Müüc üüüünh lüü tüüt

-- Süü kiüün khi nhüün toggle
toggleContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isOn = not isOn -- Thay üüüüi trüüng thüüi
        if isOn then
            toggleContainer.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Müüu xanh (büüt)
            toggleButton:TweenPosition(UDim2.new(0.6, 0, 0.1, 0), "Out", "Sine", 0.2, true) -- Nüüt sang phüüi
        else
            toggleContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Müüu üüüü (tüüt)
            toggleButton:TweenPosition(UDim2.new(0, 0, 0.1, 0), "Out", "Sine", 0.2, true) -- Nüüt sang trüüi
        end
    end
end)