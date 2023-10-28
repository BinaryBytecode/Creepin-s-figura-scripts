# Creepin's afk scripts
## A set of basic figura scripts that can be pretty useful
### Overview & features:
 - CreepinAFK
   - an AFK script
   - easily customizeable
   - simple
   - readable
   - small size
 - CreepinCrash
  - a WIP script to crash figura

### CreepinAFK:
An afk script that can be edited by modifying line 4, 5 and 6
```lua
local afk_text = "{playername} \n§7[{minutes}:{seconds}]"
local not_afk_text = "{playername}"
local afk_delay = 15*20
```
so, for line 4 and six there are code comments for help:
```lua
-- params can be {playername}, {minutes}, {seconds}, {time}
-- minecraft color codes can be used(example: §7 to make the following text grey)
-- and \n can be used to add a new line for the enitnty nameplate
```

Here are some examples for the default config
<br>
![Example 1](images/CreepinAFK/example1.png "Example 1")
![Example 1](images/CreepinAFK/example1_tab.png "Example 1 tab")