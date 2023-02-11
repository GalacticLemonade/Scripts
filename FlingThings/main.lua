local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

_G.CurrentStrength = 10

function BootExternalScript(name)
  if name == "AntiGrab" then
    local AntiFling = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
  elseif name == "ThrowStrength" then
    local ThrowStrength = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/PowerThrow.lua'))()
  end
end

function DestroyUI()
  if AntiFling ~= nil then
    Antifling:Destroy()
  end
  if ThrowStrength ~= nil then
    ThrowStrength:Destory()
  end
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
      _G.strengthenabled = Value
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
      _G.CurrentStrength = tonumber(Value)
   end,
})

local AntiGrabToggle = Tab:CreateToggle({
   Name = "Anti grab Toggle",
   CurrentValue = false,
   Flag = "Toggle2",
   Callback = function(Value)
      _G.antigrabenabled = Value
   end,
})

local DeleteUI = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      DestroyUI()
   end,
})

BootExternalScript(AntiGrab)
BootExternalScript(ThrowStrength)
