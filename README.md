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
Here is the begining of the script
```lua
-- params can be {playername}, {minutes}, {seconds}, {time}
-- minecraft color codes can be used(example: §7 to make the following text grey)
-- and \n can be used to add a new line for the enitnty nameplate
local afk_text = "{playername} \n§7[{minutes}:{seconds}]"
local not_afk_text = "{playername}"
-- the badge color when you're afk or not
local badge_color = vec(1, 0, 0)
local afk_badge_color = vec(0.5, 0.5, 0.5)
-- the delay until the timer and text shows(in ticks)
local afk_delay = 15*20
```
As you can see, the config lines are 4, 5, 7, 8 and 10.
<br>
And there are code comments for help at line 1 to 3, line 6 and line 9.

Here are some examples for the default config
<br>
![Example 1](images/CreepinAFK/example1.png "Example 1")
![Example 1](images/CreepinAFK/example1_tab.png "Example 1 tab")