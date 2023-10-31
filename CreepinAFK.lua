-- params can be {playername}, {hours}, {minutes}, {seconds}, {time}
-- minecraft color codes can be used(example: §7 to make the following text grey)
-- and \n can be used to add a new line for the enitnty nameplate
local afk_text = "{playername} \n§7[{minutes}:{seconds}]"
local not_afk_text = "{playername}"
-- the badge color when you're afk or not
local badge_color = vec(1, 0, 0)
local afk_badge_color = vec(0.5, 0.5, 0.5)
-- the delay until the timer and text shows(in ticks)
local afk_delay = 15*20

-- just to set some vars up
local afk_time = 0
local old_time = 0
local tick_counter = 0
function events.ENTITY_INIT()
    local position = user:getPos()
    local rotation = user:getRot()
end


function pings.send_time(time, playername)
    local hours = math.floor(time/72000)
    hours = string.format("%02d", minutes)
    local minutes = math.floor(time/1200)
    minutes = string.format("%02d", minutes)
    local seconds = math.floor((time/20)%60)
    seconds = string.format("%02d", seconds)

    local parsed_afk_text = ""
    if time == 0 then
        parsed_afk_text = not_afk_text:gsub("{hours}", hours):gsub("{minutes}", minutes):gsub("{seconds}", seconds):gsub("{time}", time):gsub("{playername}", playername)
        avatar:setColor(badge_color)
    else
        parsed_afk_text = afk_text:gsub("{hours}", minutes):gsub("{hours}", minutes):gsub("{seconds}", seconds):gsub("{time}", time):gsub("{playername}", playername)
        avatar:setColor(afk_badge_color)
    end

    nameplate.LIST:setText(parsed_afk_text)
    nameplate.ENTITY:setText(parsed_afk_text:gsub("${badges}", ""))
end

function events.TICK()
    if position == old_position and rotation == old_rotation then
        afk_time = afk_time + 1 else afk_time = 0
    end

    if player:isLoaded() and (tick_counter == 20) then
        tick_counter = 0
        old_position = position
        old_rotation = rotation
        position = user:getPos()
        rotation = user:getRot()

        if not (afk_time == 0) then
            --only show if is greater than the afk delay
            if afk_time >= afk_delay then
                pings.send_time(afk_time, player:getName())
            end
        else
            if not (old_time == 0) then
                pings.send_time(0, player:getName())
            end
        end
        old_time = afk_time
    end
    tick_counter = tick_counter + 1
end
