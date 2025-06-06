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
