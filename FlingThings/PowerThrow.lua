local bodyvel_Name = "FlingVelocity"
local userinputs = game:GetService("UserInputService")
local w = game:GetService("Workspace")
local r = game:GetService("RunService")
local d = game:GetService("Debris")

local strength

coroutine.wrap(function()
  while task.wait(1) do
   local BasicStrength = getgenv().ThrowStrength
   if getgenv().AdvancedStrength ~= true and getgenv().SuperStrength == true then
    strength = BasicStrength
   elseif getgenv().SuperStrength == true then
    strength = Vector3.new(getgenv().AdvancedStrengthX, getgenv().AdvancedStrengthY, getgenv().AdvancedStrengthZ)
   end
  end
end)()

w.ChildAdded:Connect(function(model)
  if model.Name == "GrabParts" then
   local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
   
   if part_to_impulse then
    
    local inputObj
    local velocityObj = Instance.new("BodyVelocity", part_to_impulse)
    
    model:GetPropertyChangedSignal("Parent"):Connect(function()
      if not model.Parent then
       if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then
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
