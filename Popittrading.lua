-- GhostScripts V2 for Pop It Trading
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Create a button for picking items
local pickButton = Instance.new("TextButton")
pickButton.Size = UDim2.new(0, 200, 0, 50)
pickButton.Position = UDim2.new(0.5, -100, 0.5, -25)
pickButton.Text = "Pick Items"
pickButton.Parent = screenGui

-- Pickup range for items
local pickupRange = 10

-- Function to pick up items
local function pickupItems()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        
        -- Check all objects in workspace
        for _, item in pairs(workspace:GetChildren()) do
            if item:IsA("Model") and item:FindFirstChild("Handle") then
                local handle = item.Handle
                if (handle.Position - humanoidRootPart.Position).magnitude <= pickupRange then
                    -- Simulate interaction with item
                    firetouchinterest(handle, humanoidRootPart, 0)
                    firetouchinterest(handle, humanoidRootPart, 1)
                end
            end
        end
    end
end

-- Button click handler
pickButton.MouseButton1Click:Connect(function()
    pickupItems()
end)
