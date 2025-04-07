
return function(ctx)
    local Players = game:GetService("Players")
    local tab = ctx.VisualTab

    local espEnabled = false

    local function CreateESP(part, text)
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESPTag"
        billboard.Adornee = part
        billboard.Size = UDim2.new(0, 100, 0, 40)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local label = Instance.new("TextLabel", billboard)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(0, 170, 255)
        label.TextStrokeTransparency = 0.5
        label.TextScaled = true

        billboard.Parent = part
    end

    local function ClearESP()
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BillboardGui") and v.Name == "ESPTag" then
                v:Destroy()
            end
        end
    end

    local function UpdateESP()
        ClearESP()
        for _,enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
                local hp = math.floor(enemy.Humanoid.Health)
                local max = math.floor(enemy.Humanoid.MaxHealth)
                local name = enemy.Name .. " [" .. tostring(hp) .. "/" .. tostring(max) .. "]"
                CreateESP(enemy.HumanoidRootPart, name)
            end
        end
    end

    tab:CreateToggle({
        Name = "Enable Enemy ESP",
        CurrentValue = false,
        Callback = function(state)
            espEnabled = state
            if state then
                while espEnabled do
                    pcall(UpdateESP)
                    task.wait(1)
                end
            else
                ClearESP()
            end
        end
    })
end
