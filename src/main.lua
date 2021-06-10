require("env")

local Player = require("player")
local Ball = require("ball")


function love.load()
    screenHeight = love.graphics.getHeight()
    screenWidth = love.graphics.getWidth()
    

    playerYInit = screenWidth / 3
    
    -- create two players
    player1 = Player.getPlayer(80, playerYInit, 35, 100)
    player2 = Player.getPlayer(700, playerYInit, 35, 100)
    -- create a centered ball
    ball = Ball.getBall(0, 0, 20, 30)
    Ball.center(ball)
    Ball.setSpeed(ball, 3)
 
    Ball.setDirectionToLeft(ball)
    --Ball.setDirectionToRight(ball)
    --Ball.setDirectionToDownLeft(ball)
    --Ball.setDirectionToUpLeft(ball)
end

function love.update()

    -- animate ball
    Ball.updatePosition(ball)
    
    -- collision detect
    
    -- down bar collision
    if ball.yPosition > screenHeight - ball.height then
      print("collision down")
      ball.ySpeed = - ball.ySpeed 
    end
    
    -- up bar collision
    if ball.yPosition < 0 then
      print("collision up")
      ball.ySpeed = - ball.ySpeed
    end
    
    -- right bar collision
    if ball.xPosition > screenWidth then
      print("right collision")
      ball.xSpeed = - ball.xSpeed
    end
    
    -- left bar collision
    if ball.xPosition < 0 then
      print("left collision")
      ball.xSpeed = - ball.xSpeed
    end


    --collision with bars
    
    -- left bar
    if ball.xPosition < player1.pad.width + player1.pad.xPosition and
        ball.yPosition > player1.pad.yPosition and
        ball.yPosition < player1.pad.yPosition + player1.pad.height then
      print("collision with left bar")
      ball.xSpeed = - ball.xSpeed   
    end
    
    -- right bar
    if ball.xPosition > player2.pad.xPosition and
        ball.yPosition > player2.pad.yPosition and
        ball.yPosition < player2.pad.yPosition + player2.pad.height then
      print("collision with right bar")
      ball.xSpeed = - ball.xSpeed   
    end
    
    if false then
      
      print("collision with left bar")
      ball.xSpeed = - ball.xSpeed  
    end
    
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
