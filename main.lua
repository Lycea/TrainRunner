function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end

require("helpers.cindy"):applyPatch()
require("game")

function love.load(conf)
    --mdb=require("mobdebug")
    --mdb.start()

    game.load()
end


function love.draw()
    game.draw()
end

function love.update()
    game.update()
end


function love.mousemoved(x,y)
    game.mousemoved(x,y)
end

function love.mousepressed(x,y)
    game.mousepressed(x,y)
end
