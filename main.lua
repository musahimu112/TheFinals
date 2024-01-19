blazeinc = require 'blazeinc'
Gamestate = require 'blazeinc.hump.gamestate'

-- Creating new gamestate
Gamestate.new()

-- Setting entity coordinates
local moon_data = {
    x = 15, y = 15, z = 8
}
-- Creating entities
local moon = blazeinc.newModel("assets/sphere.obj", "assets/earth.png", {moon_data.x,moon_data.y,moon_data.z}, nil, {4,4,4})
local background = blazeinc.newModel("assets/sphere.obj", "assets/starfield.png", {0,0,0}, nil, {500,500,500})
-- Creating new timer
local timer = 0
-- Creating collision variable
local collidedText




-- Game
local subwoofer
function blazeinc.load()
    subwoofer = love.audio.newSource("subwoofer.mp3","stream")
end

function blazeinc.mousemoved(x,y, dx,dy)
    
end
function blazeinc.update(dt)
    timer = blazeinc.engine.newTimer(timer,dt) -- Starting the timer
    moon:setEulerRotation(0, math.pi - timer, 0) -- Setting entity natural rotation

    -- Detecting if player/camera collided with the entity
    if blazeinc.collisions.hasCameraCollided(10,moon_data.x,moon_data.y,moon_data.z) then
        collidedText = true
    else
        collidedText = false
    end

    love.audio.play(subwoofer)
end

function blazeinc.draw()
    -- Showing coordinates on the screen
    love.graphics.print("X: "..blazeinc.world.getCameraX(),10,10)
    love.graphics.print("Y: "..blazeinc.world.getCameraY(),10,30)
    love.graphics.print("Z: "..blazeinc.world.getCameraZ(),10,50)
    love.graphics.print("Collision: "..tostring(collidedText),10,70)


    -- Showing the timer on the screen
    love.graphics.print("Timer: "..timer,10,90)

    
    
    -- Rendering entities
    moon:draw()
    background:draw()
end