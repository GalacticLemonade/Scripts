local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local AntiFling = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/AntiGrab.lua'))()
local ThrowStrength = loadstring(game:HttpGet('https://raw.githubusercontent.com/GalacticLemonade/Scripts/main/FlingThings/PowerThrow.lua'))()

function DestroyUI()
  AntiFling:Destroy()
  ThrowStrength:Destroy()
  Rayfield:Destroy()
  script:Destroy()
end

local Window = Rayfield:CreateWindow({
   Name = "Fling Things and People",
   LoadingTitle = "Fling Things and People Hub",
   LoadingSubtitle = "by GalacticLemonade",
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

