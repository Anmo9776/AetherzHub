
return function(ctx)
    local Player = ctx.Player
    local tab = ctx.AutoFarmTab

    local autofarmEnabled = false

    local function GetCurrentWorld()
        local placeId = game.PlaceId
        if placeId == 2753915549 then
            return 1 -- First Sea
        elseif placeId == 4442272183 then
            return 2 -- Second Sea
        elseif placeId == 7449423635 then
            return 3 -- Third Sea
        else
            return 0 -- Unknown
        end
    end

    local function GetLevelQuest(level)
        -- Dummy placeholder. Replace with real level mapping later.
        if level < 10 then
            return {questName = "BanditQuest1", enemyName = "Bandit", questPos = Vector3.new(1000, 50, 1000)}
        else
            return {questName = "DummyQuest", enemyName = "Dummy", questPos = Vector3.new(0, 0, 0)}
        end
    end

    local function StartAutoFarm()
        while autofarmEnabled do
            local char = Player.Character
            local level = Player.Data.Level.Value
            local quest = GetLevelQuest(level)
            if char and quest then
                -- Quest interaction simulation (not complete)
                print("Farming:", quest.enemyName)
                -- You would insert teleport, quest accept, and combat logic here
            end
            task.wait(1)
        end
    end

    tab:CreateToggle({
        Name = "Enable Auto Farm",
        CurrentValue = false,
        Callback = function(state)
            autofarmEnabled = state
            if state then
                task.spawn(StartAutoFarm)
            end
        end
    })

    tab:CreateParagraph({
        Title = "Detected Sea",
        Content = "World " .. tostring(GetCurrentWorld())
    })
end
