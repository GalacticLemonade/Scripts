local bodyvel_Name = "FlingVelocity"
local userinputs = game:GetService("UserInputService")
local w = game:GetService("Workspace")
local r = game:GetService("RunService")
local d = game:GetService("Debris")

while task.wait(2) do
 local strength = getgenv().CurrentStrength
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
end
