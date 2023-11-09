--[[
local myinput = models:newPart("input","Gui"):newText("input")
myinput:setText("Hello")

function events.CHAR_TYPED(char, modifier, codepoint)
    myinput:setText(myinput:setPos(-256, -128, 0):getText() .. char)
    return false
end

delete_timeout = false
function events.KEY_PRESS(key)
    if key == 259 then
        if delete_timeout == false then
            myinput:setText(myinput:getText():sub(1, -2))
            delete_timeout = true
        else
            delete_timeout = false
        end
    end
end
--]]
local messages = models:newPart("message","Gui"):setPos(0, -256, 0):newText("message")
messages:setText("")

function events.CHAT_RECEIVE_MESSAGE(msg)
    messages:setText(msg .. "\n" ..  messages:getText())
    return false
end