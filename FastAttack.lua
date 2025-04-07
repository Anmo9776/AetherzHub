
return function(ctx)
    local Player = ctx.Player
    local tab = ctx.AutoFarmTab

    local enabled = false

    local function FastAttackLoop()
        while enabled do
            local char = Player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local combat = char:FindFirstChildOfClass("Tool")
                if combat then
                    for _,v in pairs(getgc(true)) do
                        if typeof(v) == "function" and getfenv(v).script and tostring(getfenv(v).script) == "CombatFramework" then
                            pcall(function()
                                debug.setupvalue(v, 2, 1) -- reduces cooldown
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end

    tab:CreateToggle({
        Name = "Fast Attack (Experimental)",
        CurrentValue = false,
        Callback = function(state)
            enabled = state
            if state then
                task.spawn(FastAttackLoop)
            end
        end
    })
end
