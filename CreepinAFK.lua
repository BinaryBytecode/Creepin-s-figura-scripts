-- params can be {playername}, {minutes}, {seconds}, {time}
local afk_text = "&8{playername}[{minutes}:{seconds}]"
local not_afk_text = "{playername}"
local afk_delay = 15*20

-- don't change this
local afk_time = 0
local old_time = 0

-- just to set some vars up
events.ENTITY_INIT:register(function()
    local position = user:getPos()
    local rotation = user:getRot()
end)


function pings.send_time(time, playername)
    local minutes = math.floor(time/1200)
    minutes = string.format("%02d", minutes)
    local seconds = math.floor((time/20)%60)
    seconds = string.format("%02d", seconds)

    local parsed_afk_text = ""
    if time == 0 then
        parsed_afk_text = not_afk_text:gsub("{minutes}", minutes):gsub("{seconds}", seconds):gsub("{time}", time):gsub("{playername}", playername)
    else
        parsed_afk_text = afk_text:gsub("{minutes}", minutes):gsub("{seconds}", seconds):gsub("{time}", time):gsub("{playername}", playername)
    end

    nameplate.LIST:setText(parsed_afk_text)
    nameplate.ENTITY:setText(parsed_afk_text)
end

function events.TICK()
    if player:isLoaded() then
        old_position = position
        old_rotation = rotation
        position = user:getPos()
        rotation = user:getRot()
    
        if position == old_position and rotation == old_rotation then
            afk_time = afk_time + 1 else afk_time = 0
        end

        if not (afk_time == 0) then
            if afk_time >= afk_delay then
                pings.send_time(afk_time, player:getName())
            end
            old_time = afk_time
        else
            if not (old_time == 0) then
                pings.send_time(0, player:getName())
            end
            old_time = 0
        end
    end
end
