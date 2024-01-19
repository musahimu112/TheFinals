local world = {}

function world.getCameraX()
    return blazeinc.camera.position[1]
end
function world.getCameraY()
    return blazeinc.camera.position[2]
end
function world.getCameraZ()
    return blazeinc.camera.position[3]
end



function world.getLookingX()
    return blazeinc.camera.target[1]
end
function world.getLookingY()
    return blazeinc.camera.target[2]
end
function world.getLookingZ()
    return blazeinc.camera.target[3]
end


function world.getLookingUpX()
    return blazeinc.camera.up[1]
end
function world.getLookingUpY()
    return blazeinc.camera.up[2]
end
function world.getLookingUpZ()
    return blazeinc.camera.up[3]
end


return world
