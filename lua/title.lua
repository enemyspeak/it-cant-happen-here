
local Title = Gamestate:addState('Title')


local BUTTONSTATE = "One"
local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
local CENTERX = WIDTH/2
local CENTERY = HEIGHT/2
local gameTitle
local graphics =	{
					logo = love.graphics.newImage("res/ICHH logo.png")
					}
local fonts =		{
					Title = love.graphics.newFont("res/RockwellStd.otf",100),
					Subtitle = love.graphics.newFont("res/RockwellStd-Italic.otf",100),
					Type = love.graphics.newFont("res/LetterGothicStd.otf",14)
					}
local colors = 		{
					background = {57,57,57}
					}

local t
local mx,my

------------------------------------------------------------------------------------------

function Title:enteredState()
	t = 0
end

function Title:exitedState()
end

function Title:update(dt)
	t = t + dt
	mx,my = love.mouse.getPosition()
	
	if t > 15 then
		gamestate:gotoState(BUTTONSTATE)
	end
end

function Title:draw()
	love.graphics.setBackgroundColor(unpack(colors["background"]))
	
	love.graphics.setFont(fonts["Type"])
	--love.graphics.print(mx ..", " ..my,mx + 16, my + 8)					-- Mouse overlay
	
	if t < 6 and t > 2 then
		love.graphics.draw(graphics["logo"],0,0)
	elseif t > 7 and t < 10 then
		love.graphics.setFont(fonts["Title"])
		love.graphics.printf("ACT I", (CENTERX/2),CENTERY-110,CENTERX,"center")
		love.graphics.printf("SCENE III", (CENTERX/2),CENTERY-10,CENTERX,"center")
	elseif t > 11 and t < 14 then
		love.graphics.setFont(fonts["Subtitle"])
		love.graphics.printf("THE LIVING", ((CENTERX-150)/2),CENTERY-220,CENTERX+200,"center")
		love.graphics.printf("ROOM OF", (CENTERX/2),CENTERY-125,CENTERX,"center")
		love.graphics.printf("DOREMUS", (CENTERX/2),CENTERY-30,CENTERX,"center")
		love.graphics.printf("JESSUP", (CENTERX/2),CENTERY+65,CENTERX,"center")
	end
end

function Title:keypressed(key, unicode)
	if key == 'escape' then
		love.event.push('quit')
	elseif key == ' ' then
		gamestate:gotoState(BUTTONSTATE)
	end
end

function Title:mousepressed(x, y, button)
end

function Title:joystickpressed(joystick, button)

end
