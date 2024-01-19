-- Basic functions
function love.load()
    blazeinc.load()
    print "blazeinc: Press ESC to quit."
    print "blazeinc: Press W, A, S, D, Space Bar and Left Shift to movimentate the camera on the world."
    print "blazeinc: Press Left Control to increase movimentation speed."
    print "blazeinc: You can also use Love2D functions/commands inside the blazeinc source code with Love's interoperability."
end
function love.update(dt)
    blazeinc.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    if love.keyboard.isDown("lctrl") then
        speed = 3
    else
        speed = 1
    end

    if not speed then speed = 1 end
    

    blazeinc.camera.firstPersonMovement(dt*speed)
    blazeinc.controller.update(dt)
    blazeinc.controller.setDefaultControllers(speed,dt)
end
function love.mousemoved( x, y, dx, dy, istouch )
    blazeinc.mousemoved( x, y, dx, dy, istouch )
    blazeinc.camera.firstPersonLook(dx,dy)
end

function love.draw()
    blazeinc.draw()
    blazeinc.controller.draw()
end



-- 2. Auxiliary functions
-- Keyboard key pressed
--[[function love.keypressed(key)
    if blazeinc.keypressed(key) then blazeinc.keypressed(key) end 
end


-- Mouse or mouse wheel moved 
function love.wheelmoved( x, y )
    if blazeinc.wheelmoved( x, y ) then blazeinc.wheelmoved( x, y ) end
end

-- Mouse
function love.mousepressed( x, y, button, istouch, presses )
    if blazeinc.mousepressed( x, y, button, istouch, presses ) then blazeinc.mousepressed( x, y, button, istouch, presses ) end
end
function love.mousereleased( x, y, button, istouch, presses )
    if blazeinc.mousereleased( x, y, button, istouch, presses ) then blazeinc.mousereleased( x, y, button, istouch, presses ) end
end

-- Touch Screen
function love.touchpressed( id, x, y, dx, dy, pressure )
    if blazeinc.touchpressed( id, x, y, dx, dy, pressure ) then blazeinc.touchpressed( id, x, y, dx, dy, pressure ) end
end
function love.touchreleased( id, x, y, dx, dy, pressure )
    if blazeinc.touchpressed( id, x, y, dx, dy, pressure ) then blazeinc.touchpressed( id, x, y, dx, dy, pressure ) end
end]]