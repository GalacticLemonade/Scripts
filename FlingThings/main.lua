local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

--local AntiFling = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
--local ThrowStrength = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/PowerThrow.lua'))()

function DestroyUI()
  Rayfield:Destroy()
  script:Destroy()
end

local Window = Rayfield:CreateWindow({
   Name = "Fling Things and People",
   LoadingTitle = "Fling Things and People Hub",
   LoadingSubtitle = "by GalacticLemonade",
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local SuperStrength = Tab:CreateToggle({
   Name = "Super Strength Toggle",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
     getgenv().strengthenabled = Value
   end,
})

local SuperStrengthSlider = Tab:CreateSlider({
   Name = "Strength Power",
   Range = {0, 500},
   Increment = 10,
   Suffix = "Strength",
   CurrentValue = 1,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().CurrentStrength = tonumber(Value)
   end,
})

local DeleteUI = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      DestroyUI()
   end,
})

-- Strength
coroutine.wrap(function()
    local bodyvel_Name = "FlingVelocity"
local userinputs = game:GetService("UserInputService")
local w = game:GetService("Workspace")
local r = game:GetService("RunService")
local d = game:GetService("Debris")

local strength = getgenv().CurrentStrength
local enabled = getgenv().strengthenabled
 
w.ChildAdded:Connect(function(model)
    if model.Name == "GrabParts" then
        local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
 
        if part_to_impulse then
 
            local inputObj
            local velocityObj = Instance.new("BodyVelocity", part_to_impulse)
            
            model:GetPropertyChangedSignal("Parent"):Connect(function()
                if not model.Parent and enabled == true then
                    if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 and enabled == true then
                        print("Launched!")
                        velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength
                        d:AddItem(velocityObj, 1)
                    elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then
                        velocityObj:Destroy()
                    else
                        velocityObj:Destroy()
                    end
                end
            end)
        end
    end
end)

end)()

-- Antigrab
coroutine.wrap(function()
    local PS = game:GetService("Players")
local Player = PS.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local RS = game:GetService("ReplicatedStorage")
local CE = RS:WaitForChild("CharacterEvents")
local R = game:GetService("RunService")
local BeingHeld = Player:WaitForChild("IsHeld")
local PlayerScripts = Player:WaitForChild("PlayerScripts")

local antigrabenabled = getgenv().antigrabenabled
 
--[[ Remotes ]]
local StruggleEvent = CE:WaitForChild("Struggle")
 
--[[ Anti-Explosion ]]
workspace.DescendantAdded:Connect(function(v)
if v:IsA("Explosion") and antigrabenabled == true then
v.BlastPressure = 0
end
end)
 
--[[ Anti-grab ]]
 
BeingHeld.Changed:Connect(function(C)
    if C == true and antigrabenabled == true then
        local char = Player.Character
 
        if BeingHeld.Value == true then
            local Event;
            Event = R.RenderStepped:Connect(function()
                if BeingHeld.Value == true then
                    char["HumanoidRootPart"].AssemblyLinearVelocity = Vector3.new()
                    StruggleEvent:FireServer(Player)
                elseif BeingHeld.Value == false then
                    Event:Disconnect()
                end
            end)
        end
    end
end)
 
local function reconnect()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid")
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
 
    HumanoidRootPart:WaitForChild("FirePlayerPart"):Remove()
 
    Humanoid.Changed:Connect(function(C)
        if C == "Sit" and Humanoid.Sit == true and antigrabenabled == true then
            if Humanoid.SeatPart ~= nil and tostring(Humanoid.SeatPart.Parent) == "CreatureBlobman" then
            elseif Humanoid.SeatPart == nil then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            Humanoid.Sit = false
            end
        end
    end)
end
 
reconnect()
 
Player.CharacterAdded:Connect(reconnect)
end)()
