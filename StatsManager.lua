
return function(ctx)
    local Player = ctx.Player
    local tab = ctx.AutoFarmTab

    local stats = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}
    local selectedStat = "Melee"
    local enabled = false

    tab:CreateDropdown({
        Name = "Stat to Auto Allocate",
        Options = stats,
        CurrentOption = selectedStat,
        Callback = function(opt)
            selectedStat = opt
        end
    })

    tab:CreateToggle({
        Name = "Auto Allocate Stat Points",
        CurrentValue = false,
        Callback = function(state)
            enabled = state
            if state then
                task.spawn(function()
                    while enabled do
                        local points = Player.Data.Level.Value + Player.Data.Fragments.Value + Player.Data.Beli.Value -- mockup logic
                        if points > 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", selectedStat, 1)
                        end
                        task.wait(1)
                    end
                end)
            end
        end
    })
end
