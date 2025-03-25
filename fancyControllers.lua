local function fancyControllers(sdlVersion)
	local ffi = require('ffi')
	
	local cdef = 'typedef struct SDL_Joystick SDL_Joystick;'
	
	if sdlVersion == 'SDL2' then
		cdef = cdef .. [[
		SDL_Joystick *SDL_JoystickFromInstanceID(uint32_t instance_id);
		int SDL_JoystickSetLED(SDL_Joystick *joystick, uint8_t red, uint8_t green, uint8_t blue);
		]]
	elseif sdlVersion == 'SDL3' then
		cdef = cdef ..[[
		SDL_Joystick *SDL_GetJoystickFromID(uint32_t instance_id);
		bool SDL_SetJoystickLED(SDL_Joystick *joystick, uint8_t red, uint8_t green, uint8_t blue);
		]]
	else
		error('Did not provide correct SDL version (Valid versions are SDL2 and SDL3)')
	end
	
	ffi.cdef(cdef)
	
	local sdl = ffi.C
	if ffi.os == 'Windows' then
		sdl = ffi.load(sdlVersion)
	end
	
	
	function love.joystick.setLED(joystick,r,g,b)
		local _,id = joystick:getID()
		if id then
			local SDL_Joystick
			if sdlVersion == 'SDL2' then
				SDL_Joystick = sdl.SDL_JoystickFromInstanceID(id-1)
				return sdl.SDL_JoystickSetLED(SDL_Joystick,r*255,g*255,b*255)
			else
				SDL_Joystick = sdl.SDL_GetJoystickFromID(id-1)
				return (sdl.SDL_SetJoystickLED(SDL_Joystick,r*255,g*255,b*255) == 0)
			end
			
			
		end
	end
	
end

return fancyControllers