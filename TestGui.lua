-- Tạo ScreenGui và các thành phần
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


-- Tạo Frame chứa checkbox và thanh ngang
local checkBoxContainer = Instance.new("Frame")
checkBoxContainer.Parent = frame -- Kết nối với Frame chính của GUI
checkBoxContainer.Size = UDim2.new(1, 0, 0.2, 0) -- Chiếm 100% chiều rộng và 20% chiều cao của Frame
checkBoxContainer.Position = UDim2.new(0, 0, 0.6, 0) -- Cách trên 60% của Frame
checkBoxContainer.BackgroundTransparency = 1 -- Không có nền

-- Tạo checkbox bên trái
local leftCheckBox = Instance.new("ImageButton")
leftCheckBox.Parent = checkBoxContainer
leftCheckBox.Size = UDim2.new(0.1, 0, 1, 0) -- Chiếm 10% chiều rộng, chiều cao bằng Frame
leftCheckBox.Position = UDim2.new(0.2, 0, 0, 0) -- Cách trái 20%
leftCheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Màu nền
leftCheckBox.BorderSizePixel = 2
leftCheckBox.BorderColor3 = Color3.fromRGB(0, 255, 0) -- Màu viền
leftCheckBox.Image = "" -- Không hình ảnh mặc định

-- Tạo checkbox bên phải
local rightCheckBox = Instance.new("ImageButton")
rightCheckBox.Parent = checkBoxContainer
rightCheckBox.Size = UDim2.new(0.1, 0, 1, 0) -- Chiếm 10% chiều rộng, chiều cao bằng Frame
rightCheckBox.Position = UDim2.new(0.7, 0, 0, 0) -- Cách trái 70%
rightCheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rightCheckBox.BorderSizePixel = 2
rightCheckBox.BorderColor3 = Color3.fromRGB(0, 255, 0)
rightCheckBox.Image = ""

-- Tạo thanh ngang ở giữa
local middleLine = Instance.new("Frame")
middleLine.Parent = checkBoxContainer
middleLine.Size = UDim2.new(0.3, 0, 0.1, 0) -- Chiều rộng 30% và chiều cao 10%
middleLine.Position = UDim2.new(0.35, 0, 0.45, 0) -- Nằm giữa 2 checkbox
middleLine.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh
middleLine.BorderSizePixel = 0 -- Không viền

-- Tạo TextLabel cho trạng thái
local checkBoxLabel = Instance.new("TextLabel")
checkBoxLabel.Parent = checkBoxContainer
checkBoxLabel.Size = UDim2.new(1, 0, 0.3, 0) -- Chiều cao 30%
checkBoxLabel.Position = UDim2.new(0, 0, 1.1, 0) -- Dưới container
checkBoxLabel.BackgroundTransparency = 1 -- Không nền
checkBoxLabel.Text = "None selected" -- Nội dung mặc định
checkBoxLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Màu chữ
checkBoxLabel.TextSize = 18
checkBoxLabel.Font = Enum.Font.SourceSans

-- Sự kiện checkbox
local selected = "None"
leftCheckBox.MouseButton1Click:Connect(function()
    selected = "Left selected"
    leftCheckBox.Image = "rbxassetid://6031068420" -- Hình ảnh tích
    rightCheckBox.Image = "" -- Bỏ tích bên phải
    checkBoxLabel.Text = selected
end)

rightCheckBox.MouseButton1Click:Connect(function()
    selected = "Right selected"
    rightCheckBox.Image = "rbxassetid://6031068420"
    leftCheckBox.Image = "" -- Bỏ tích bên trái
    checkBoxLabel.Text = selected
end)
-- Tạo Frame chứa toggle
local toggleContainer = Instance.new("Frame")
toggleContainer.Parent = frame -- Kết nối với Frame chính
toggleContainer.Size = UDim2.new(0.3, 0, 0.1, 0) -- Chiếm 30% rộng, 10% cao của Frame
toggleContainer.Position = UDim2.new(0.35, 0, 0.8, 0) -- Nằm giữa gần dưới Frame
toggleContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ (tắt mặc định)
toggleContainer.BorderSizePixel = 2
toggleContainer.BorderColor3 = Color3.fromRGB(255, 255, 255)
toggleContainer.ClipsDescendants = true -- Đảm bảo nút không vượt ra ngoài

-- Bo góc cho toggle
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0) -- Bo góc tròn
toggleCorner.Parent = toggleContainer

-- Tạo nút tròn
local toggleButton = Instance.new("Frame")
toggleButton.Parent = toggleContainer
toggleButton.Size = UDim2.new(0.4, 0, 1, 0) -- Nút chiếm 40% rộng, toàn bộ cao
toggleButton.Position = UDim2.new(0, 0, 0, 0) -- Vị trí bên trái (tắt)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Màu trắng
toggleButton.BorderSizePixel = 0

-- Bo góc cho nút tròn
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(1, 0) -- Bo góc tròn
buttonCorner.Parent = toggleButton

-- Tạo trạng thái Toggle
local isOn = false -- Mặc định là tắt

-- Sự kiện khi nhấn toggle
toggleContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isOn = not isOn -- Thay đổi trạng thái
        if isOn then
            toggleContainer.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh (bật)
            toggleButton:TweenPosition(UDim2.new(0.6, 0, 0, 0), "Out", "Sine", 0.2, true) -- Nút sang phải
        else
            toggleContainer.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ (tắt)
            toggleButton:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.2, true) -- Nút sang trái
        end
    end
end)

if isOn then
    print("Toggle is ON")
else
    print("Toggle is OFF")
end
