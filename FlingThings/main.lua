local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

coroutine.wrap(function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/PowerThrow.lua'))()
end)()

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

local Antigrab = Tab:CreateButton({
   Name = "Activate Antigrab",
   Callback = function()
      coroutine.wrap(function()
         loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
      end)()
   end,
})

local SuperStrengthSlider = Tab:CreateSlider({
   Name = "Strength Power",
   Range = {0, 500},
   Increment = 1,
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
