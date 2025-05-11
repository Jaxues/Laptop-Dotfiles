-- Register all Toolbar actions and initialize all UI stuff
function initUi()
  app.registerUi({["menu"] = "Cycle through color list", ["callback"] = "cycle", ["accelerator"] = "<Alt>c"});
  -- if you want to have multiple color lists you must use the app.registerUi function multiple times
  -- with different callback functions and accelerators
end

-- Dracula palette colors
local colorList = { 
  {"Dracula Background", 0x282a36},  
  {"Dracula Current Line", 0x44475a},
  {"Dracula Comment", 0x6272a4}, 
  {"Dracula Yellow", 0xf1fa8c}, 
  {"Dracula Orange", 0xffb86c},      
  {"Dracula Red", 0xff5555},   
  {"Dracula Purple", 0xbd93f9},        
  {"Dracula Pink", 0xff79c6},
  {"Dracula Green", 0x50fa7b}, 
  {"Dracula Cyan", 0x8be9fd},    
  {"Dracula Foreground", 0xf8f8f2}
}

-- start with first color
local currentColor = 0 

function cycle()
  if (currentColor < #colorList) then
    currentColor = currentColor + 1
  else
    currentColor = 1
  end
  -- apply color to currently used tool and allow coloring of elements from selections
  app.changeToolColor({["color"] = colorList[currentColor][2], ["selection"] = true})
  -- use app.changeColor({["color"] = colorList[currentColor][2], ["tool"] = "pen""}) 
  -- instead if you only want to change pen color
  -- similarly if you want to change highlighter color or the color from another tool with color capabilities.
end
