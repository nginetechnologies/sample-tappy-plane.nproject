local changeOffsetXPosition = -4.5
local resetValuesXPosition = 4.0

local minZOffest = -0.5
local maxZOffset = 0.5
local zOffsetDistance = maxZOffset - minZOffest

local hasUpdatedOffset = false

component.update = function(deltaTime)
    local position = component.GetPosition()

    if position.x > resetValuesXPosition then
        hasUpdatedOffset = false
    end

    if not hasUpdatedOffset and position.x < changeOffsetXPosition then
        local randomZ = minZOffest + math.random(0.0, zOffsetDistance)

        local newPosition = {
            x = position.x,
            y = position.y,
            z = randomZ,
            _type = "vec3"
        }

        component.SetPosition(newPosition)
        hasUpdatedOffset = true
    end
end
