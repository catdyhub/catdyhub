-- main.lua
-- สคริปต์หลักที่จะถูกโหลดจากภายนอก

print("✅ สคริปต์โหลดสำเร็จจาก GitHub")

-- ตัวอย่างการใช้งาน:
-- แสดง Notification (ใช้ใน Roblox Exploit)
if game and game.StarterGui and game.StarterGui.SetCore then
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "สคริปต์ทำงานแล้ว!",
            Text = "ยินดีต้อนรับ!",
            Duration = 5
        })
    end)
end

-- ตัวอย่างฟังก์ชันอื่นที่สามารถเพิ่มได้:
-- auto farm, teleport, UI, ESP, ฯลฯ
-- โหลด Sirius UI
local Sirius = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Sirius/request/source.lua"))()

-- สร้างหน้าต่างหลัก
local Window = Sirius:CreateWindow({
    Name = "KUY Hub UI",
    Theme = Sirius.Themes.Dark,
    Config = {
        Save = true,
        Folder = "KUYHub",
        File = "MainConfig"
    }
})

-- สร้างแท็บ
local MainTab = Window:Tab("⚡ เมนูหลัก")
MainTab:Section("การควบคุมเมนู")

-- ปุ่ม Toggle เปิด/ปิด UI
MainTab:Toggle("เปิด / ปิด เมนู UI", true, function(Value)
    local CoreGui = game:GetService("CoreGui")
    local SiriusUI = CoreGui:FindFirstChild("Sirius")
    if SiriusUI then
        SiriusUI.Enabled = Value
    end
end)

-- ปุ่มเล็กแบบลากได้
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local function CreateMiniButton()
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 40)
    frame.Position = UDim2.new(0, 20, 0, 60)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Name = "MiniSiriusUI"
    frame.ZIndex = 100
    frame.Parent = CoreGui

    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 10)

    local openBtn = Instance.new("TextButton")
    openBtn.Size = UDim2.new(1, -30, 1, 0)
    openBtn.Position = UDim2.new(0, 0, 0, 0)
    openBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    openBtn.Text = "📂 เปิดเมนู"
    openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.Font = Enum.Font.GothamBold
    openBtn.TextSize = 16
    openBtn.ZIndex = 101
    openBtn.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 1, 0)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.ZIndex = 101
    closeBtn.Parent = frame

    -- ลากได้
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- เปิดเมนู
    openBtn.MouseButton1Click:Connect(function()
        local SiriusUI = CoreGui:FindFirstChild("Sirius")
        if SiriusUI then
            SiriusUI.Enabled = true
            frame.Visible = false
        end
    end)

    -- ปิดปุ่มเล็ก
    closeBtn.MouseButton1Click:Connect(function()
        frame:Destroy()
    end)

    return frame
end

-- ตรวจจับการซ่อนเมนูเพื่อแสดงปุ่มเล็ก
local function WatchForMenuHide()
    local SiriusUI = CoreGui:FindFirstChild("Sirius")
    if not SiriusUI then return end

    SiriusUI:GetPropertyChangedSignal("Enabled"):Connect(function()
        if not SiriusUI.Enabled then
            if not CoreGui:FindFirstChild("MiniSiriusUI") then
                CreateMiniButton()
            else
                CoreGui:FindFirstChild("MiniSiriusUI").Visible = true
            end
        end
    end)
end

-- เริ่มจับตา
task.delay(2, WatchForMenuHide)
