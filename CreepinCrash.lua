function crash()
    events.RENDER:register(function()
        crash()
    end)
    print("trying to crash")
end

function pings.crash()
    events.RENDER:register(function()
        crash()
    end)
end

pings.crash()