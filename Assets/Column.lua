local incrementScoreXPosition = -2
local changeOffsetXPosition = -4.5
local resetValuesXPosition = 4.0

local minZOffest = -1.0
local maxZOffset = 1.0
local zOffsetDistance = maxZOffset - minZOffest

local hasUpdatedScore = false
local hasUpdatedOffset = false

component.update = function(deltaTime)
    local position = component.GetPosition()

    if position.x > resetValuesXPosition then
        hasUpdatedScore = false
        hasUpdatedOffset = false
    end

    if not hasUpdatedScore and position.x < incrementScoreXPosition then
        score.Add(1)
        hasUpdatedScore = true
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