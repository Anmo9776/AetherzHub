
return function(ctx)
    local Player = ctx.Player
    local tab = ctx.AutoFarmTab

    local islandList = {
        ["First Sea"] = {
            "Starter Island",
            "Jungle",
            "Pirate Village"
        },
        ["Second Sea"] = {
            "Kingdom of Rose",
            "Green Zone",
            "Snow Mountain"
        },
        ["Third Sea"] = {
            "Port Town",
            "Hydra Island",
            "Great Tree"
        }
    }

    local teleportPoints = {
        ["Starter Island"] = Vector3.new(0, 50, 0),
        ["Jungle"] = Vector3.new(1000, 50, -500),
        ["Pirate Village"] = Vector3.new(2000, 50, 1000),
        ["Kingdom of Rose"] = Vector3.new(-500, 70, 1500),
        ["Green Zone"] = Vector3.new(1500, 50, 2500),
        ["Snow Mountain"] = Vector3.new(2500, 50, 3500),
        ["Port Town"] = Vector3.new(-2000, 50, -1000),
        ["Hydra Island"] = Vector3.new(-3000, 50, -500),
        ["Great Tree"] = Vector3.new(-4000, 50, 0)
    }

    local function GetWorldName()
        local placeId = game.PlaceId
        if placeId == 2753915549 then
            return "First Sea"
        elseif placeId == 4442272183 then
            return "Second Sea"
        elseif placeId == 7449423635 then
            return "Third Sea"
        end
        return "Unknown"
    end

    local currentWorld = GetWorldName()

    tab:CreateParagraph({
        Title = "World Detected",
        Content = currentWorld
    })

    tab:CreateDropdown({
        Name = "Teleport to Island",
        Options = islandList[currentWorld] or {},
        CurrentOption = nil,
        Callback = function(option)
            local pos = teleportPoints[option]
            if pos and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
            end
        end
    })
end
