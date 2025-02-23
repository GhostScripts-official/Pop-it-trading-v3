-- Скрипт GhostScripts V2 для Pop It Trading
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Создаем кнопку для подбора предметов
local pickupButton = Instance.new("TextButton")
pickupButton.Size = UDim2.new(0, 200, 0, 50)
pickupButton.Position = UDim2.new(0.5, -100, 0.5, -25)
pickupButton.Text = "Подобрать предметы"
pickupButton.Parent = screenGui

-- Радиус подбора предметов
local pickupRange = 10

-- Функция для подбора предметов
local function pickupItems()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        
        -- Проверяем все объекты в workspace
        for _, item in pairs(workspace:GetChildren()) do
            if item:IsA("Model") and item:FindFirstChild("Handle") then
                local handle = item.Handle
                if (handle.Position - humanoidRootPart.Position).magnitude <= pickupRange then
                    -- Симулируем взаимодействие с предметом
                    firetouchinterest(handle, humanoidRootPart, 0)
                    firetouchinterest(handle, humanoidRootPart, 1)
                end
            end
        end
    end
end

-- Обработчик для кнопки
pickupButton.MouseButton1Click:Connect(function()
    pickupItems()
end)
