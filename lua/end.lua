
local End = Gamestate:addState('End')

local NEXTSTATE = "Title"
local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
local CENTERX = WIDTH/2
local CENTERY = HEIGHT/2

local graphics =	{
					logo = love.graphics.newImage("res/ICHH logo.png")
					}
local fonts =		{
					End = love.graphics.newFont("res/RockwellStd.otf",100),
					Subtitle = love.graphics.newFont("res/RockwellStd-Italic.otf",100),
					Type = love.graphics.newFont("res/LetterGothicStd.otf",14)
					}
local colors = 		{
					background = {57,57,57}
					}

local t
local mx,my

------------------------------------------------------------------------------------------

function End:enteredState()
	t = 0
end

function End:exitedState()
end

function End:update(dt)
	t = t + dt
	mx,my = love.mouse.getPosition()
end

function End:draw()
	love.graphics.setBackgroundColor(unpack(colors["background"]))
	if t < 6 and t > 4 then
		love.graphics.setFont(fonts["End"])
		love.graphics.printf("END OF", (CENTERX/2),CENTERY-110,CENTERX,"center")
		love.graphics.printf("SCENE III", (CENTERX/2),CENTERY-10,CENTERX,"center")
	elseif t > 15 and t < 18 then
		love.graphics.draw(graphics["logo"],0,0)
	elseif t > 19 and t < 21 then
	
	end
end

function End:keypressed(key, unicode)
	if key == 'escape' then
		love.event.push('quit')
	end
end

function End:mousepressed(x, y, button)
end

function End:joystickpressed(joystick, button)

end
