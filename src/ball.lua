local ball = {}

ball.getPositiveSpeed = function(speed)
    if (speed < 0) then
        speed = - speed
    end
    return speed
end

ball.getNegativeSpeed = function(speed)
    return - ball.getPositiveSpeed(speed)
end

-- factory function for ball
ball.getBall = function(x, y, w, h)
    local ball = {
        xPosition = x,
        yPosition = y,
        width = w,
        height = h,
        xSpeed = 0,
        ySpeed = 0
    }
    return ball
end

-- factory function for ball
ball.center = function(ballToCenter)
    middleScreenX = love.graphics.getWidth() / 2
    middleScreenY = love.graphics.getHeight() / 2
    
    middleBallX = (ballToCenter.width / 2)
    middleBallY = (ballToCenter.height / 2)

    ballToCenter.xPosition = middleScreenX - middleBallX 
    ballToCenter.yPosition = middleScreenY - middleBallY
end

ball.setDirectionToUpRight = function(animatedBall)
    animatedBall.xSpeed = ball.getPositiveSpeed(animatedBall.xSpeed)
    animatedBall.ySpeed = ball.getNegativeSpeed(animatedBall.ySpeed)
end

ball.goUpRight = function(animatedBall)
    ball.setDirectionToUpRight(animatedBall)
    ball.updatePosition(animatedBall)
end

ball.setDirectionToUpLeft = function(animatedBall)
    animatedBall.xSpeed = ball.getNegativeSpeed(animatedBall.xSpeed)
    animatedBall.ySpeed = ball.getNegativeSpeed(animatedBall.ySpeed)
end

ball.goUpLeft = function(animatedBall)
    ball.setDirectionToUpLeft(animatedBall)
    ball.updatePosition(animatedBall)
end

ball.setDirectionToDownRight = function(animatedBall)
    animatedBall.xSpeed = ball.getPositiveSpeed(animatedBall.xSpeed)
    animatedBall.ySpeed = ball.getPositiveSpeed(animatedBall.ySpeed)
end

ball.goDownRight = function(animatedBall)
    ball.setDirectionToDownRight(animatedBall)
    ball.updatePosition(animatedBall)
end

ball.setDirectionToDownLeft = function(animatedBall)
    animatedBall.xSpeed = ball.getNegativeSpeed(animatedBall.xSpeed)
    animatedBall.ySpeed = ball.getPositiveSpeed(animatedBall.ySpeed)
end

ball.goDownLeft = function(animatedBall)
    ball.setDirectionToDownLeft(animatedBall)
    ball.updatePosition(animatedBall)
end

ball.setDirectionToLeft = function(animatedBall)
  animatedBall.xSpeed = ball.getNegativeSpeed(animatedBall.xSpeed)
  animatedBall.ySpeed = 0
end

ball.setDirectionToRight = function(animatedBall)
  animatedBall.xSpeed = ball.getPositiveSpeed(animatedBall.xSpeed)
  animatedBall.ySpeed = 0
end

ball.goLeft = function(animatedBall)
    ball.setDirectionToLeft(animatedBall)
    ball.updatePosition(animatedBall)
end

ball.goRight = function(animatedBall)
    ball.setDirectionToRight(animatedBall)
    ball.updatePosition(animatedBall)
end


ball.updatePosition = function(animatedBall)
    animatedBall.xPosition = animatedBall.xPosition + animatedBall.xSpeed
    animatedBall.yPosition = animatedBall.yPosition + animatedBall.ySpeed
end

ball.setSpeed = function(animatedBall, speed)
    animatedBall.xSpeed = speed
    animatedBall.ySpeed = speed
end

return ball
