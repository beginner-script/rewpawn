local player = game.Players.LocalPlayer
local respawnPos
local introGui = Instance.new("ScreenGui")
introGui.IgnoreGuiInset = true
introGui.ResetOnSpawn = false
introGui.Parent = player:WaitForChild("PlayerGui")

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1,0,1,0)
imageLabel.Position = UDim2.new(0,0,0,0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://14504493427"------사진 병신같으니 알아서 바꾸거나 빼라
imageLabel.ImageTransparency = 1
imageLabel.Parent = introGui

player.CharacterAdded:Connect(function(char)
    if respawnPos then
        task.wait(0.1)
        char:WaitForChild("HumanoidRootPart").CFrame = respawnPos
    end
    for i = 1, 0, -0.1 do
        imageLabel.ImageTransparency = i
        task.wait(0.05)
    end
    task.wait(2)
    for i = 0, 1, 0.1 do
        imageLabel.ImageTransparency = i
        task.wait(0.05)
    end
    char:WaitForChild("Humanoid").Died:Connect(function()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            respawnPos = hrp.CFrame
        end
    end)
end)
