
local Intro = Gamestate:addState('Intro')

local Button = require 'obj.button'

local NEXTSTATE = "Title"
local SKIPSTATE = "One"
local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
local CENTERX = WIDTH/2
local CENTERY = HEIGHT/2

local mx,my
local hideAll
	
local m = {}
	m[1] = _navi:new("|,CLARENCE: Tin soldiers! |,   Drug-store cowboys! |,   Boy Scouts! |,   Yah Corpos - Want to be dictators! |,   Dictators!|mCLARENCE:(Recognizing a face among the marching soldiers) Jim Nickerson! |,   Corperal Nickerson! |,   Dead-beat! |,   How about that twenty bucks you owe me! |, Dead-beat! |,   Corpos! |,   Dictators!",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
	m[2] = _navi:new("[ A slim, athletic man between forty and fifty years old, very suave and literate looking, pushes CLARENCE inside the the shop. ]|m[ He is followed by four Corpo privates in uniform and helments. They are hard-boiled, yet not too tough, young farmers and mechanics. ] ",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
 	m[3] = _navi:new("ATHLETIC MAN: Noisy little man, aren't you. |n|nCLARENCE: Who's going to stop me? |mATHLETIC MAN: Perhaps I should introduce myself - Commissioner Swan, Senator Windrip's representative.",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
 	m[4] = _navi:new("SWAN: (to Corpo guards) Work on him, will you? Might as well get used to it. |n|n|,|,And be careful of those new uniforms.",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
	
local textButton = Button:new({ x = 450, y = 100, text = "- x -", type = 0,enable = false,parallax = 0})
local cursorButton = Button:new({ x = 450, y = 100, text = ". . .", type = 0,enable = false,parallax = 0})

local fonts =		{
					Type = love.graphics.newFont("res/LetterGothicStd.otf",14)
					}
local colors = 		{
					background = {57,57,57},
					}

local function resetButtons()
	cursorButton:setEnable(false)
	textButton:setEnable(false)
	hideAll = false
	for n,b in pairs(buttons) do
		b:setAlpha(0)
	end
end


local function drawMessages()
		local x = 200
		local y = 180
		local h = 95
		love.graphics.setColor(255,255,255)
		_navi.play_list(m,x,y+10)
		
		if m[#m]:is_over() then
			gamestate:gotoState(NEXTSTATE)
		elseif m[3]:is_over() then
			cursorButton:setEnable(false)
			textButton:setPos(x+340,y+(h-30))
			textButton:setFactor(5)
			textButton:setEnable(true)
			textButton:draw()
		else
			cursorButton:setPos(x+340,y+(h-30))
			cursorButton:setFactor(5)
			cursorButton:setEnable(true)
			cursorButton:draw()
		end
end

local function updateButtons(dt)
	for n,b in pairs(buttons) do
		b:update(dt,mx)
	end	
end

local function drawDebug()
	love.graphics.setFont(fonts["Type"])
	love.graphics.setColor(255,255,255)
	local x = mx + CENTERX
	love.graphics.print(mx ..", "..mx+CENTERX..', '..my, x+ 16, my + 8)					-- Mouse overlay
end

------------------------------------------------------------------------------------------









function Intro:enteredState()
	mx,my = love.mouse.getPosition()
	mx = mx-CENTERX
end

function Intro:exitedState()
	
end

function Intro:update(dt)
	mx,my = love.mouse.getPosition()
	mx = mx-CENTERX

    textButton:update(dt,mx)
	cursorButton:update(dt,mx)
	
    arc.check_keys(dt)	
end

function Intro:draw()
	love.graphics.setBackgroundColor(unpack(colors["background"]))

	drawMessages()
	arc.clear_key()
	
--	drawDebug()
end

function Intro:keypressed(key, unicode)
	if key == 'escape' then
		love.event.push('quit')
	elseif key == ' ' then
		gamestate:gotoState(SKIPSTATE)
	elseif key == 'up' then
		arc.set_key('up')
	elseif key == 'down' then
		arc.set_key('down')
	end
end

function Intro:mousepressed(x, y, button)
	if textButton:mousepressed(x,y,button) or cursorButton:mousepressed(x,y,button) then
		arc.set_key('z')
	end
end

function Intro:joystickpressed(joystick, button)

end
