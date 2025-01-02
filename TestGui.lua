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



-- Tạo TextLabel cho "MainText"
local mainText = Instance.new("TextLabel")
mainText.Parent = screenGui
mainText.Size = UDim2.new(0.9, 0, 0.1, 0)  -- Chiếm 90% chiều rộng và 10% chiều cao
mainText.Position = UDim2.new(0.05, 0, 0, 0)  -- Cách trên 5% của màn hình
mainText.BackgroundTransparency = 1  -- Không có nền
mainText.Text = "Main"  -- Nội dung hiển thị là "Main"
mainText.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
mainText.TextSize = 30  -- Kích thước chữ
mainText.Font = Enum.Font.SourceSansBold  -- Chọn font chữ

-- Tạo ImageLabel cho logo và căn chỉnh với "MainText"
local logo = Instance.new("ImageLabel")
logo.Parent = screenGui
logo.Size = UDim2.new(0, 24, 0, 24)  -- Kích thước logo
logo.Position = UDim2.new(0, 10, 0.5, -12)  -- Vị trí cạnh text "Main"
logo.BackgroundTransparency = 1  -- Xóa nền
logo.Image = "rbxassetid://101359812964295"  -- ID của logo

-- Căn chỉnh logo với text "Main"
logo.Position = UDim2.new(
    0, mainText.AbsolutePosition.X - 30,  -- Đặt logo trước chữ "Main"
    0, mainText.AbsolutePosition.Y
)
