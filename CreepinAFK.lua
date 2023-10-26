--local afk_text = "{playername} is AFK for {minutes}:{seconds}" -- params can be {playername}, {minutes}, {seconds}, {time}
local afk_text = "{playername}[{minutes}:{seconds}]"
local not_afk_text = "{playername}[not afk]"
local afk_delay = 15*20

--don't change this
local afk_time = 0
local old_time = 0

events.ENTITY_INIT:register(function()
    local position = user:getPos()
    local rotation = user:getRot()
end)

function pings.send_time(time)
    local minutes = math.floor(time/1200)
    local seconds = math.floor((time/20)%60)

    if time == 0 then
        parsed_afk_text = string.gsub(not_afk_text, "{minutes}", minutes)
        parsed_afk_text = string.gsub(parsed_afk_text, "{seconds}", seconds)
        parsed_afk_text = string.gsub(parsed_afk_text, "{time}", time)
        parsed_afk_text = string.gsub(parsed_afk_text, "{playername}", player:getName())
    else
        parsed_afk_text = string.gsub(afk_text, "{minutes}", minutes)
        parsed_afk_text = string.gsub(parsed_afk_text, "{seconds}", seconds)
        parsed_afk_text = string.gsub(parsed_afk_text, "{time}", time)
        parsed_afk_text = string.gsub(parsed_afk_text, "{playername}", player:getName())
    end

    nameplate.LIST:setText(parsed_afk_text)
    nameplate.ENTITY:setText(parsed_afk_text)
end

function events.TICK()
    old_position = position
    old_rotation = rotation
    position = user:getPos()
    rotation = user:getRot()
    
    if position == old_position and rotation == old_rotation then 
        afk_time = afk_time + 1 else afk_time = 0
    end

    if not (afk_time == 0) then
        if afk_time >= afk_delay then
            pings.send_time(afk_time)
        end
        old_time = afk_time
    else
        if not (old_time == 0) then
            pings.send_time(0)
        end
        old_time = 0
    end

end