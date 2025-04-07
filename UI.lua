
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

return function(ctx)
    local Player = game.Players.LocalPlayer

    local Window = OrionLib:MakeWindow({
        Name = "AetherzHub | Blox Fruits",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "AetherzHub"
    })

    ctx.MainWindow = Window

    ctx.AutoFarmTab = Window:MakeTab({
        Name = "Auto Farm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    ctx.VisualTab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://3944703288",
        PremiumOnly = false
    })

    ctx.SettingsTab = Window:MakeTab({
        Name = "Settings",
        Icon = "rbxassetid://6034509993",
        PremiumOnly = false
    })

    OrionLib:Init()
end
