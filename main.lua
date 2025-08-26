-- main.lua

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
-- auto farm, teleport, UI, ESP, และอื่นๆ
-- CATDY HUB FREE SCRIPT 
local Sirius = loadstring(game:HttpGet("https://raw.githubusercontent.com/catdyhub/GUI/main/source.lua"))()

--// GUI หลัก
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MyHubGui"
ScreenGui.Parent = game.CoreGui

--// Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

--// Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar

-- โลโก้
local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(1, 0, 0, 50)
Logo.BackgroundTransparency = 1
Logo.Text = "M"
Logo.Font = Enum.Font.GothamBold
Logo.TextSize = 36
Logo.TextColor3 = Color3.fromRGB(80, 160, 255)
Logo.Parent = Sidebar

-- ชื่อ Hub
local HubName = Instance.new("TextLabel")
HubName.Size = UDim2.new(1, 0, 0, 30)
HubName.Position = UDim2.new(0, 0, 0, 55)
HubName.BackgroundTransparency = 1
HubName.Text = "My Hub Premium"
HubName.Font = Enum.Font.Gotham
HubName.TextSize = 16
HubName.TextColor3 = Color3.fromRGB(200, 200, 200)
HubName.Parent = Sidebar

--// Main Panel
local MainPanel = Instance.new("Frame")
MainPanel.Size = UDim2.new(1, -160, 1, 0)
MainPanel.Position = UDim2.new(0, 160, 0, 0)
MainPanel.BackgroundTransparency = 1
MainPanel.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Main"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 15, 0, 10)
Title.Parent = MainPanel

--// ปุ่มย่อ/ขยาย
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = MinimizeButton

-- สถานะย่อ/ขยาย
local minimized = false
local originalSize = MainFrame.Size

MinimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        -- ขยายกลับ
        MainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
        MainPanel.Visible = true
        MinimizeButton.Text = "-"
    else
        -- ย่อเหลือ Sidebar
        MainFrame:TweenSize(UDim2.new(0, 160, 0, 400), "Out", "Quad", 0.3, true)
        MainPanel.Visible = false
        MinimizeButton.Text = "+"
    end
    minimized = not minimized
end)

--// ทำให้ลากได้
MainFrame.Active = true
MainFrame.Draggable = true
