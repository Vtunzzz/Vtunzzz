-- T��o ScreenGui v�� c��c th��nh ph��n
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


-- T��o Frame ch��a checkbox v�� thanh ngang
local checkBoxContainer = Instance.new("Frame")
checkBoxContainer.Parent = frame -- K��t n��i v��i Frame ch��nh c��a GUI
checkBoxContainer.Size = UDim2.new(1, 0, 0.2, 0) -- Chi��m 100% chi��u r��ng v�� 20% chi��u cao c��a Frame
checkBoxContainer.Position = UDim2.new(0, 0, 0.6, 0) -- C��ch tr��n 60% c��a Frame
checkBoxContainer.BackgroundTransparency = 1 -- Kh��ng c�� n��n

-- T��o checkbox b��n tr��i
local leftCheckBox = Instance.new("ImageButton")
leftCheckBox.Parent = checkBoxContainer
leftCheckBox.Size = UDim2.new(0.1, 0, 1, 0) -- Chi��m 10% chi��u r��ng, chi��u cao b��ng Frame
leftCheckBox.Position = UDim2.new(0.2, 0, 0, 0) -- C��ch tr��i 20%
leftCheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- M��u n��n
leftCheckBox.BorderSizePixel = 2
leftCheckBox.BorderColor3 = Color3.fromRGB(0, 255, 0) -- M��u vi��n
leftCheckBox.Image = "" -- Kh��ng h��nh ��nh m��c ����nh

-- T��o checkbox b��n ph��i
local rightCheckBox = Instance.new("ImageButton")
rightCheckBox.Parent = checkBoxContainer
rightCheckBox.Size = UDim2.new(0.1, 0, 1, 0) -- Chi��m 10% chi��u r��ng, chi��u cao b��ng Frame
rightCheckBox.Position = UDim2.new(0.7, 0, 0, 0) -- C��ch tr��i 70%
rightCheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rightCheckBox.BorderSizePixel = 2
rightCheckBox.BorderColor3 = Color3.fromRGB(0, 255, 0)
rightCheckBox.Image = ""

-- T��o thanh ngang �� gi��a
local middleLine = Instance.new("Frame")
middleLine.Parent = checkBoxContainer
middleLine.Size = UDim2.new(0.3, 0, 0.1, 0) -- Chi��u r��ng 30% v�� chi��u cao 10%
middleLine.Position = UDim2.new(0.35, 0, 0.45, 0) -- N��m gi��a 2 checkbox
middleLine.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- M��u xanh
middleLine.BorderSizePixel = 0 -- Kh��ng vi��n

-- T��o TextLabel cho tr��ng th��i
local checkBoxLabel = Instance.new("TextLabel")
checkBoxLabel.Parent = checkBoxContainer
checkBoxLabel.Size = UDim2.new(1, 0, 0.3, 0) -- Chi��u cao 30%
checkBoxLabel.Position = UDim2.new(0, 0, 1.1, 0) -- D����i container
checkBoxLabel.BackgroundTransparency = 1 -- Kh��ng n��n
checkBoxLabel.Text = "None selected" -- N��i dung m��c ����nh
checkBoxLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- M��u ch��
checkBoxLabel.TextSize = 18
checkBoxLabel.Font = Enum.Font.SourceSans

-- S�� ki��n checkbox
local selected = "None"
leftCheckBox.MouseButton1Click:Connect(function()
    selected = "Left selected"
    leftCheckBox.Image = "rbxassetid://6031068420" -- H��nh ��nh t��ch
    rightCheckBox.Image = "" -- B�� t��ch b��n ph��i
    checkBoxLabel.Text = selected
end)

rightCheckBox.MouseButton1Click:Connect(function()
    selected = "Right selected"
    rightCheckBox.Image = "rbxassetid://6031068420"
    leftCheckBox.Image = "" -- B�� t��ch b��n tr��i
    checkBoxLabel.Text = selected
end)
-- T��o Frame ch��a toggle
local toggleContainer = Instance.new("Frame")
toggleContainer.Parent = frame -- K��t n��i v��i Frame ch��nh
toggleContainer.Size = UDim2.new(0.2, 0, 0.05, 0) -- Toggle nh�� g��n (20% r��ng, 5% cao c��a Frame)
toggleContainer.Position = UDim2.new(0.4, 0, 0.85, 0) -- N��m gi��a g��n d����i Frame
toggleContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- M��u ���� (t��t m��c ����nh)
toggleContainer.BorderSizePixel = 0

-- Bo g��c cho toggle
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0) -- Bo g��c tr��n
toggleCorner.Parent = toggleContainer

-- T��o n��t tr��n
local toggleButton = Instance.new("Frame")
toggleButton.Parent = toggleContainer
toggleButton.Size = UDim2.new(0.4, 0, 0.8, 0) -- N��t chi��m 40% r��ng, cao 80% c��a toggle
toggleButton.Position = UDim2.new(0, 0, 0.1, 0) -- V�� tr�� b��n tr��i (t��t)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- M��u tr��ng
toggleButton.BorderSizePixel = 0

-- Bo g��c cho n��t tr��n
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(1, 0) -- Bo g��c tr��n
buttonCorner.Parent = toggleButton

-- Tr��ng th��i Toggle
local isOn = false -- M��c ����nh l�� t��t

-- S�� ki��n khi nh��n toggle
toggleContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isOn = not isOn -- Thay ����i tr��ng th��i
        if isOn then
            toggleContainer.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- M��u xanh (b��t)
            toggleButton:TweenPosition(UDim2.new(0.6, 0, 0.1, 0), "Out", "Sine", 0.2, true) -- N��t sang ph��i
        else
            toggleContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- M��u ���� (t��t)
            toggleButton:TweenPosition(UDim2.new(0, 0, 0.1, 0), "Out", "Sine", 0.2, true) -- N��t sang tr��i
        end
    end
end)