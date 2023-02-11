local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

_G.CurrentStrength = 10

function BootExternalScript(name)
  if name == "AntiGrab" then
    local afling = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
  end
end

local Window = Rayfield:CreateWindow({
   Name = "Fling Things and People",
   LoadingTitle = "Loading Hub...",
   LoadingSubtitle = "by GalacticLemonade",
})

local Tab = Window:CreateTab("Main", 4483362458)

local AntiGrabButton  = Tab:CreateButton({
   Name = "Activate Anti-Grab (to stop rejoin!)",
   Callback = function()
      BootExternalScript("AntiGrab")
   end,
})

local StrengthSlider = Tab:CreateSlider({
   Name = "Throw strength",
   Range = {0, 20000},
   Increment = 10,
   Suffix = "Strength",
   CurrentValue = 1,
   Flag = "StrengthSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      _G.CurrentStrength = tonumber(Value)
   end,
})


local Destroy = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
      afling:Destroy()
      script:Destroy()
   end,
})

coroutine.wrap(function()
    -- Strength
    while task.wait(2) do
      local bodyvel_Name = "FlingVelocity"
local userinputs = game:GetService("UserInputService")
local w = game:GetService("Workspace")
local r = game:GetService("RunService")
local d = game:GetService("Debris")
local strength = _G.CurrentStrength
 
w.ChildAdded:Connect(function(model)
    if model.Name == "GrabParts" then
        local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
 
        if part_to_impulse then
            print("Part found!")
 
            local inputObj
            local velocityObj = Instance.new("BodyVelocity", part_to_impulse)
            
            model:GetPropertyChangedSignal("Parent"):Connect(function()
                if not model.Parent then
                    if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                        print("Launched!")
                        velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength
                        d:AddItem(velocityObj, 1)
                    elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then
                        velocityObj:Destroy()
                        print("Cancel Launch!")
                    else
                        velocityObj:Destroy()
                        print("No two keys pressed!")
                    end
                end
            end)
        end
    end
end)
    end
end)()
