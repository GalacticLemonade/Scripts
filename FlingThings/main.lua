local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local AntigrabCoro = coroutine.wrap(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
end)()

local PowerThrowCoro = coroutine.wrap(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/PowerThrow.lua'))()
end)()

function DestroyUI()
  Rayfield:Destroy()
  AntigrabCoro:Destroy()
  PowerThrowCoro:Destroy()
  script:Destroy()
end

function BasicStrengthChanged(basic)
  if getgenv().AdvancedStrength == false then
    getgenv().ThrowStrength = tonumber(basic)
  end
end

local Window = Rayfield:CreateWindow({
   Name = "Fling Things and People",
   LoadingTitle = "Fling Things and People Hub",
   LoadingSubtitle = "by GalacticLemonade",
    ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Fling Things and People Hub"
   },
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local AntigrabToggle = Tab:CreateToggle({
   Name = "Antigrab",
   CurrentValue = false,
   Flag = "AntigrabToggle",
   Callback = function(Value)
      getgenv().Antigrab = Value
   end,
})

local ExtendedStrength = Tab:CreateToggle({
   Name = "Extended Strength",
   CurrentValue = false,
   Flag = "ExtendedStrengthToggle",
   Callback = function(Value)
      getgenv().SuperStrength = Value
   end,
})

local BasicStrengthSlider = Tab:CreateSlider({
   Name = "Basic Strength",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Strength",
   CurrentValue = 10,
   Flag = "BasicStrengthSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      BasicStrengthChanged(Value)
   end,
})

local AdvancedStrengthEnabled = Tab:CreateToggle({
   Name = "Advanced Strength",
   CurrentValue = false,
   Flag = "AdvancedStrengthTogle",
   Callback = function(Value)
      getgenv().AdvancedStrength = Value
   end,
})

local AdvancedStrengthX = Tab:CreateSlider({
   Name = "Advanced Strength X",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Strength",
   CurrentValue = 10,
   Flag = "AdvancedStrengthX", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().AdvancedStrengthX = Value
   end,
})

local AdvancedStrengthY = Tab:CreateSlider({
   Name = "Advanced Strength Y",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Strength",
   CurrentValue = 10,
   Flag = "AdvancedStrengthY", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().AdvancedStrengthY = Value
   end,
})

local AdvancedStrengthZ = Tab:CreateSlider({
   Name = "Advanced Strength Z",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Strength",
   CurrentValue = 10,
   Flag = "AdvancedStrengthZ", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().AdvancedStrengthZ = Value
   end,
})

local DeleteUI = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      DestroyUI()
   end,
})
