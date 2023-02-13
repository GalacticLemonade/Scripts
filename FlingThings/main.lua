local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

function DestroyUI()
  Rayfield:Destroy()
  script:Destroy()
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

local BasicStrengthSlider = Tab:CreateSlider({
   Name = "Basic Strength",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Strength",
   CurrentValue = 10,
   Flag = "BasicStrengthSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().ThrowStrength = tonumber(Value)
   end,
})

local DeleteUI = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      DestroyUI()
   end,
})

loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/PowerThrow.lua'))()
