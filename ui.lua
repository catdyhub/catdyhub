-- โหลด Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

-- สร้างหน้าต่าง UI
local Window = Rayfield:CreateWindow({
   Name = "CatdyHub UI",
   LoadingTitle = "CatdyHub",
   LoadingSubtitle = "by catdyhub",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "CatdyHub", -- โฟลเดอร์สำหรับเซฟ config
      FileName = "UISettings"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- สร้าง Tab หลัก
local MainTab = Window:CreateTab("🌟 Main", nil)

-- ปุ่มกด
MainTab:CreateButton({
   Name = "Say Hello",
   Callback = function()
       print("Hello from CatdyHub!")
   end,
})

-- ปุ่มเปิด/ปิด (Toggle)
MainTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Callback = function(Value)
       print("Auto Farm:", Value)
   end,
})

-- สไลเดอร์ปรับความเร็ว
MainTab:CreateSlider({
   Name = "Speed",
   Range = {1, 100},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
       print("Speed:", Value)
   end,
})
