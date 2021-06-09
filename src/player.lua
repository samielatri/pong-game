local player = {
    -- factory function for player
    getPlayer = function(x, y, w, h)
        local player = {
            XPosition = x,
            YPosition = y,
            width = w,
            height = h
        }
        return player
    end
}

return player
