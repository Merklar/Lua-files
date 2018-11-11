

local function SetCircleMoveTo(circle, target, duration, delay, params)
	local info = {}
	info.isFailClick = params.isFailClick or false
	info.isScreenPos = params.isScreenPos or true
	info.onValue 	 = params.onValue	  or 0
	info.onValue 	 = info.onValue < 0 and 0 or info.onValue
	info.onValue 	 = info.onValue > 1 and 1 or info.onValue

	local duration = duration or 0
	local delay    = delay or 0
	local centerX  = info.isScreenPos and Object(circle):GetScreenX() or Object(circle):GetX()
	local centerY  = info.isScreenPos and Object(circle):GetScreenY() or Object(circle):GetY()
	local targetX  = info.isScreenPos and Object(target):GetScreenX() or Object(target):GetX()
	local targetY  = info.isScreenPos and Object(target):GetScreenY() or Object(target):GetY()
	local radius   = Object(circle):GetWidth() / 2
	local sideA    = targetX - centerX
	local sideB    = targetY - centerY
	local angle    = Math.atan(sideB / sideA)

	local needRadius = radius * info.onValue
	local needX = Math.sin(angle) * needRadius
	local needY = Math.cos(angle) * needRadius

	local moveX = centerX + needX
	local moveY = centerY + needY

	if not info.isFailClick then
		Object(target):MoveTo(moveX, moveY, duration, delay)
	else
		Object(target):MoveTo(moveX, moveY, duration, delay)
		Object(target):MoveTo(targetX, targetY, duration, duration + delay)
	end
end