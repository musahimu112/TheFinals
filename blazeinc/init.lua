-- Forked from Gabriel Margarido
-- October 2022

-- originally written by groverbuger for g3d
-- September 2021
-- MIT license

--[[
         __       __
       /'__`\    /\ \
   __ /\_\L\ \   \_\ \
 /'_ `\/_/_\_<_  /'_` \
/\ \L\ \/\ \L\ \/\ \L\ \
\ \____ \ \____/\ \___,_\
 \/___L\ \/___/  \/__,_ /
   /\____/
   \_/__/
--]]

blazeinc = {
    _VERSION     = "Löve3D 1.5.2",
    _DESCRIPTION = "Simple and easy 3D engine for LÖVE.",
    _URL         = "https://github.com/groverburger/g3d",
    _LICENSE     = [[
        MIT License

        Copyright (c) 2022 groverburger

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
    ]],
    path = ...,
    shaderpath = ... .. "/blazeinc.vert",
    display = {}
}

-- the shader is what does the heavy lifting, displaying 3D meshes on your 2D monitor
require(blazeinc.path .. "/loader")
blazeinc.shader = love.graphics.newShader(blazeinc.shaderpath)
blazeinc.newModel = require(blazeinc.path .. "/model")
blazeinc.camera = require(blazeinc.path .. "/camera")
blazeinc.collisions = require(blazeinc.path .. "/collisions")
blazeinc.loadObj = require(blazeinc.path .. "/objloader")
blazeinc.vectors = require(blazeinc.path .. "/vectors")
blazeinc.class = require(blazeinc.path .. "/class")
blazeinc.engine = require(blazeinc.path .. "/timer")
--blazeinc = require(blazeinc.path .. "/loader")
blazeinc.inspect = require(blazeinc.path .. "/inspect")
blazeinc.world = require(blazeinc.path .. "/world")
blazeinc.controller = require(blazeinc.path .. "/paddy")


blazeinc.display.width, blazeinc.display.height = love.graphics.getDimensions()

blazeinc.camera.updateProjectionMatrix()
blazeinc.camera.updateViewMatrix()

-- so that far polygons don't overlap near polygons
love.graphics.setDepthMode("lequal", true)


-- get rid of blazeinc from the global namespace and return it instead
local blazeinc = blazeinc
_G.blazeinc = nil
return blazeinc
