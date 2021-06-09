local player = {
    -- factory function for player
    getPlayer = function(x, y, w, h)
        local player = {
            pad = {
                xPosition = x,
                yPosition = y,
                width = w,
                height = h
            }
        }
        return player
    end
}

return player
