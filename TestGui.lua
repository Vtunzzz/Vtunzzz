-- Tạo ScreenGui và các thành phần
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local imageButton = Instance.new("ImageButton")
local uiCornerButton = Instance.new("UICorner")
local uiCornerFrame = Instance.new("UICorner") 


screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


frame.Parent = screenGui
frame.Size = UDim2.new(0.9, 0, 3, 0)
frame.Position = UDim2.new(0.25, 0, 0.35, 0) 
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
frame.BorderColor3 = Color3.fromRGB(0, 255, 0) 
frame.BorderSizePixel = 2
frame.Visible = false


uiCornerFrame.CornerRadius = UDim.new(0, 15) 
uiCornerFrame.Parent = frame


imageButton.Parent = screenGui
imageButton.Size = UDim2.new(0, 40, 0, 40)
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



-- Tạo ImageLabel cho logo
local logo = Instance.new("ImageLabel")
logo.Parent = mainTab -- Thay bằng Frame hoặc Tab chứa "Main"
logo.Size = UDim2.new(0, 24, 0, 24) -- Kích thước logo (tùy chỉnh)
logo.Position = UDim2.new(0, 10, 0.5, -12) -- Vị trí cạnh text "Main" (tùy chỉnh)
logo.BackgroundTransparency = 1 -- Xóa nền
logo.Image = "rbxassetid://101359812964295" -- Thay bằng asset ID của logo

-- Căn chỉnh logo với text "Main"
local mainText = mainTab:FindFirstChild("TextLabel") -- Giả sử "Main" là TextLabel
if mainText then
    logo.Position = UDim2.new(
        0, mainText.AbsolutePosition.X - 30, -- Đặt logo trước chữ "Main"
        0, mainText.AbsolutePosition.Y
    )
end


-- Tạo Frame chứa checkbox và thanh ngang
local checkBoxContainer = Instance.new("Frame")
checkBoxContainer.Parent = frame
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
