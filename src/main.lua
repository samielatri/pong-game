player = require("player")

function love.load()
    player1 = player.getPlayer(80, 100, 35, 100)
    player2 = player.getPlayer(700, 100, 35, 100)
end

function love.update()

    screenHeight = love.graphics.getHeight()

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

end
