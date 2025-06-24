--[[
  Sample Obby Setup Script
  This script demonstrates how to create a simple obstacle course (obby)
  in Roblox. For more information, see the Roblox development hub:
  https://create.roblox.com/docs

  The script below spawns a series of parts in the Workspace that players
  must jump across to reach the finish. It also adds a touch event to a
  kill brick to restart the player if they fall.
]]

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

-- Create a starting platform
local startPart = Instance.new("Part")
startPart.Size = Vector3.new(10, 1, 10)
startPart.Position = Vector3.new(0, 5, 0)
startPart.Anchored = true
startPart.Name = "Start"
startPart.Parent = Workspace

-- Create a series of jump pads
for i = 1, 5 do
    local pad = Instance.new("Part")
    pad.Size = Vector3.new(4, 1, 4)
    pad.Position = Vector3.new(0, 5 + i * 5, i * 10)
    pad.Anchored = true
    pad.Name = "JumpPad" .. i
    pad.Parent = Workspace
end

-- Create a finish platform
local finishPart = Instance.new("Part")
finishPart.Size = Vector3.new(10, 1, 10)
finishPart.Position = Vector3.new(0, 35, 60)
finishPart.Anchored = true
finishPart.Name = "Finish"
finishPart.Parent = Workspace

-- Create a kill brick that respawns players on touch
local killBrick = Instance.new("Part")
killBrick.Size = Vector3.new(50, 1, 50)
killBrick.Position = Vector3.new(0, 0, 25)
killBrick.Anchored = true
killBrick.BrickColor = BrickColor.new("Bright red")
killBrick.Name = "KillBrick"
killBrick.Parent = Workspace

killBrick.Touched:Connect(function(hit)
    local character = hit.Parent
    local player = Players:GetPlayerFromCharacter(character)
    if player then
        character:MoveTo(startPart.Position + Vector3.new(0, 3, 0))
    end
end)
