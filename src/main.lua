player = require("player")

function love.load()
    player1 = player.getPlayer(80, 100, 35, 100)
    player2 = player.getPlayer(700, 100, 35, 100)
end

function love.update()
    player1.YPosition = player1.YPosition + 1
end

function love.draw()
    love.graphics.rectangle(
        "fill",
        player1.XPosition,
        player1.YPosition,
        player1.width,
        player1.height
    )

    love.graphics.rectangle(
        "fill",
        player2.XPosition,
        player2.YPosition,
        player2.width,
        player2.height
    )

end
