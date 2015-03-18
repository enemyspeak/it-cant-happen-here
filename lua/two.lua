
local Two = Gamestate:addState('Two')

local Button = require 'obj.button'


local NEXTSTATE = "End"
local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
local CENTERX = WIDTH/2
local CENTERY = HEIGHT/2

local buttonDelay
local mx,my
local hideAll
local m = {}
	m[1] = _navi:new("|,[ All are startled by the swift, silent entrance of COMISSIONER SWAN, still wearing his uniform. He is followed by JULIAN FALCK, a young man dressed as a Corpo private. ]",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
	m[2] = _navi:new("[ SWAN glances around the room with distrubing keenness, scrutinizing each person in turn. ] |mSWAN: Good Afternoon! |n|,JULIAN: Mister Jessup! This is commissioner Swan from Boston, our new Corpo party manager for Vermont.",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
 	m[3] = _navi:new("JULIAN: You were the first person in town the Commissioner wanted to meet, Mister Jessup.|n|,TASBROUGH: Mmmm!",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
 	m[4] = _navi:new("DOREMUS: Have a chair.",{x=0, y=0, alx='l', blinker= false,nrows=3, box = false, w = 545})
	
local textButton = Button:new({ x = 450, y = 100, text = "- x -", type = 0,enable = false})
local cursorButton = Button:new({ x = 450, y = 100, text = ". . .", type = 0,enable = false})

local graphics = 	{
					background = love.graphics.newImage("res/gamescene2.png"),
					}
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
	local x = 100
	local y = 50
	local h = 110
	hideAll = true
	love.graphics.setColor(unpack(colors["background"]))	
	love.graphics.rectangle("fill",x-20-mx/10,y,605+40,h)
	love.graphics.setColor(255,255,255)
	_navi.play_list(m,x-mx/10,y+10)
	if m[#m-1]:is_over() then
		cursorButton:setEnable(false)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(10)
		textButton:setEnable(true)
	else
		cursorButton:setPos(x+290,y+(h-30))
		cursorButton:setFactor(10)
		cursorButton:setEnable(true)
	end
	if m[#m]:is_over() then
		gamestate:gotoState(NEXTSTATE)		
	end
	if textButton:getClicked() or cursorButton:getClicked() then
		buttonDelay = 0
		textButton:setClicked(false)
		cursorButton:setClicked(false)
	end
	if buttonDelay > 8 then
		cursorButton:draw()		
	end	
	textButton:draw()
end

local function updateSpecialButtons(dt)
	textButton:update(dt,mx)
	cursorButton:update(dt,mx)
end


------------------------------------------------------------------------------------------









function Two:enteredState()
	mx,my = love.mouse.getPosition()
	mx = mx-CENTERX
	buttonDelay = 0
end

function Two:exitedState()
	
end

function Two:update(dt)
	mx,my = love.mouse.getPosition()
	mx = mx-CENTERX
	buttonDelay = buttonDelay + dt 
	updateSpecialButtons(dt)

    arc.check_keys(dt)	
end

function Two:draw()
	love.graphics.setBackgroundColor(unpack(colors["background"]))
	love.graphics.push()
	love.graphics.translate(CENTERX,CENTERY)
	love.graphics.setColor(255,255,255)

		love.graphics.draw(graphics["background"],0-mx/10,0,0,1,1,1280/2,576/2)
	
	love.graphics.pop()
	
	drawMessages()

	arc.clear_key()
    --]]
    
	if hideAll then else
		for n,b in pairs(buttons) do
			b:draw()
		end		
	end
	
	love.graphics.setFont(fonts["Type"])
	love.graphics.setColor(255,255,255)

--	local x = mx + CENTERX
--	love.graphics.print(mx ..", "..mx+CENTERX..', '..my, x+ 16, my + 8)					-- Mouse overlay
end

function Two:keypressed(key, unicode)
	if key == 'escape' then
		love.event.push('quit')
	elseif key == ' ' then
		arc.set_key('z')
	end
end

function Two:mousepressed(x, y, button)
	if textButton:mousepressed(x,y,button) or cursorButton:mousepressed(x,y,button) then
		arc.set_key('z')
	end
end
