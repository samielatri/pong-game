require("env")

local Player = require("player")
local Ball = require("ball")


function love.load()
    -- create two players
    player1 = Player.getPlayer(80, 100, 35, 100)
    player2 = Player.getPlayer(700, 100, 35, 100)
    -- create a centered ball
    ball = Ball.getBall(0, 0, 20, 30)
    Ball.center(ball)
    Ball.setSpeed(ball, 2)
end

function love.update()
    screenHeight = love.graphics.getHeight()
    -- animate ball
    --Ball.goDownLeft(ball)
    --Ball.goUpLeft(ball)
    --Ball.goUpRight(ball)
    --Ball.goDownRight(ball)
    
    
    if love.keyboard.isDown("up") and 
        player1.pad.yPosition > 0 and 
        player2.pad.yPosition > 0  then
        player1.pad.yPosition = player1.pad.yPosition - 2
        player2.pad.yPosition = player2.pad.yPosition - 2
    end

    if (love.keyboard.isDown("down") and
         player1.pad.yPosition < screenHeight - player1.pad.height and 
         player2.pad.yPosition < screenHeight - player2.pad.height) then
        player1.pad.yPosition = player1.pad.yPosition + 2
        player2.pad.yPosition = player2.pad.yPosition + 2
    end
end

function love.draw()
    -- draw 2 players
    love.graphics.rectangle(
        "fill",
        player1.pad.xPosition,
        player1.pad.yPosition,
        player1.pad.width,
        player1.pad.height
    )
    love.graphics.rectangle(
        "fill",
        player2.pad.xPosition,
        player2.pad.yPosition,
        player2.pad.width,
        player2.pad.height
    )
    -- draw the ball
    love.graphics.rectangle(
        "fill",
        ball.xPosition,
        ball.yPosition,
        ball.width,
        ball.height
    )

end
