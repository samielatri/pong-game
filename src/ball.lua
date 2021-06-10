local ball = {}

    -- factory function for ball
    ball.getBall = function(x, y, w, h)
        local ball = {
            xPosition = x,
            yPosition = y,
            width = w,
            height = h
        }
        return ball
    end

    -- factory function for ball
    ball.center = function(ballToCenter)
        ballToCenter.xPosition = (love.graphics.getWidth() / 2) - (ballToCenter.width / 2)
        ballToCenter.yPosition = (love.graphics.getHeight() / 2) - (ballToCenter.height / 2)
    end

return ball
