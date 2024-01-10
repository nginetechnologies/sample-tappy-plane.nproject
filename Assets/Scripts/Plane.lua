
local gameScale = 1.0

local gravity = -9.8
local tapForce = 2.0

local zVelocity = 0.0

local isFirstTap = true

input.binary["D2B5D801-01EE-43B4-A8BB-77797A1C8214"] = function(isActive)   
    if isActive then
        if isFirstTap then
            isFirstTap = false
        end

        audio.Play()
        zVelocity = tapForce
    end
end

component.update = function (deltaTime)
    if not isFirstTap then  
        
        local position = component.GetPosition()

        zVelocity = zVelocity + (gravity * deltaTime * gameScale)

        local position = component.GetPosition()
        local newPosition = {
            x = position.x,
            y = position.y,
            z = position.z + (zVelocity * deltaTime * gameScale),
            _type = "vec3"
        }
        component.SetPosition(newPosition)
    end 
end

physics.ConvertToKinematic()