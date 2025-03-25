require('fancyControllers')('SDL2') --Change this to 'SDL3' if you are using LOVE 12.0

function love.load()
	
	red,green,blue = 1,0,0
	useTriggers = false
end

function love.keypressed(k)
	useTriggers = (k == '6')
	
	if k == '1' then
		red,green,blue=0,0,0
	end	
	if k == '2' then
		red,green,blue=1,0,0
	end
	if k == '3' then
		red,green,blue=0,1,0
	end
	if k == '4' then
		red,green,blue=0,0,1
	end
	if k == '5' then
		red,green,blue=1,1,1
	end
	
end

function love.update()
	
	local joysticks = love.joystick.getJoysticks()
	
	for i, joystick in ipairs(joysticks) do
		if useTriggers then
			red = (joystick:getAxis(5)+1)/2
			green = 0
			blue = (joystick:getAxis(6)+1)/2
		end
		love.joystick.setLED(joystick,red,green,blue)
	end
	
end

function love.draw()
	love.graphics.setColor(1,1,1)
	love.graphics.print('Press 1-5 for preset colors. Press 6 to set color based on trigger input.\nSetting LEDs to\nRed: '..red..'\nGreen: '..green..'\nBlue: '..blue,0,0,0,2,2)
	
	if #love.joystick.getJoysticks()==0 then
		love.graphics.print('No joysticks detected! Are you sure you have one plugged in?',0,300,0,2,2)
	end
	
	love.graphics.rectangle('fill',0,200,64,64)
	love.graphics.setColor(red,green,blue)
	
	love.graphics.rectangle('fill',5,205,54,54)
	

	
end