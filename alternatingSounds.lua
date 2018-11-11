
local function AlternatingSounds(sounds)
	local counter = 1
	local length  = #sounds
	if scene then
		if not scene.alternatingSoundsCounter then
			scene.alternatingSoundsCounter = {}
		end
		table.insert(scene.alternatingSoundsCounter, counter)
	end

	local function GetNeedSound()
		local sound = sounds[counter]

		counter = counter + 1
		if counter > length then
			counter = 1
		end
		return sound
	end
	
	return GetNeedSound
end