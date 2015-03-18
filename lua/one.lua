
local One = Gamestate:addState('One')

local Button = require 'obj.button'

local NEXTSTATE = "Two"
local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
local CENTERX = WIDTH/2
local CENTERY = HEIGHT/2

local mx,my
local hideAll
local buttonDelay
	
local m = {}
	m[1] = _navi:new("TAUSBROUGH: A fine-looking body of young men! |,      (To Doremus) Mighty nice of you to invite me, Doremus - best place in town to see a parade.",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local m1aButton = Button:new({ x = -100, y = -100, text = "DOREMUS: Mighty glad to have you, Frank. Guess this window's the one", text2 = "thing I've got on a plutocrat like you.", type = 0,enable = false})
local m1bButton = Button:new({ x = -100, y = -100, text = "DOREMUS: Of course! Someone's got to pull you away from your registers", text2 = "and manifests for only one evening.", type = 0,enable = false})		
	m[2] = _navi:new("FOWLER: This military drill may have its faults, but it does keep the young fellows off the street corners. I tell you, a doctor sees some awful results from all this loafing and unenployment.",{x=0, y=0, alx='l', blinker= false, box = false, w = 525})
	m[3] = _navi:new('TAUSBROUGH: What I always say is, young fellows with any ability can find something to do, same as I did.',{x=0, y=0, alx='l',nrows = 3, blinker= false, box = false, w = 525})
local m3aButton = Button:new({ x = -100, y = -100, text = "DOREMUS: Perhaps when you were young yourself, maybe. Times are", text2 = "different now.", type = 0,enable = false})		
local m3bButton = Button:new({ x = -100, y = -100, text = "LORINDA: (dryly) Start washing dishes and get to be a great manufacturer", text2 = "like you!", type = 0,enable = false})		
 	m[4] = _navi:new('TAUSBROUGH: (modestly) Well, why not? Whatever modest wealth I may have made is entirely due to my own unaided enterprise.',{x=0, y=0, alx='l',nrows = 3, blinker= false, box = false, w = 525})
 	m[5] = _navi:new("FOWLER: This drill certainly pulls 'em together.|nLORINDA: Young Bullies! Always squabbling..",{x=0, y=0, alx='l', blinker= false, box = false, w = 525})
local m5aButton = Button:new({ x = -100, y = -100, text = "DOREMUS: Now, now, Lindy! Maybe they scrap a little, like all boys do,", text2 = "but you've never heard of the Corpos hurting anybody.", type = 0,enable = false})		
local m5bButton = Button:new({ x = -100, y = -100, text = "DOREMUS: A few squabbles or not, it's better than letting these young", text2 = "men to the streets.", type = 0,enable = false})		
local m5a = _navi:new("TAUSBROUGH: And you never will! But now you take the lazy workmen.. never hear of them getting pleasure out of doing an honest day's work.. No, Sir! All they holler for is higher wages and shorter hours. Labor Unions! Regular communists!",{x=0, y=0, alx='l',nrows = 3, blinker= false, box = false, w = 525})
local m5b = _navi:new("FOWLER: The idea! Just because the Corpos Guards won't let their members run around all night.. and make 'em wash!|mFOWLER: (to Lorinda) You don't object to their being tyannized into washing their necks, do you?",{x=0, y=0, alx='l',nrows = 3, blinker= false, box = false, w = 525})
local mLast = _navi:new("LORINDA: Course the Corpos take care of their men. Baby 'em. And if Buzz Windrip gets elected, they'll baby the whole contry- in prison!",{x=0, y=0, alx='l', blinker= false, box = false, w = 525})

local mWindow = {}
	mWindow[1] = _navi:new("[ The room was dominated by a cheerful bay window at back, set deeply into the wall. It was so cluttered with books and papers that there was barely any room for the flowers to grow. ]|m[ Earlier, a ground of five people- TASBROUGH, DOREMUS, FOWLER, LORINDA, and DAVID were gathered at the window, watching the parade outside. ] ",{x=0, y=0, alx='l', blinker= false,nrows = 3, box = false, w = 525})
	mWindow[2] = _navi:new("[ Outside, the rise and fall of the marching feet of the CORPOS and the sound of their singing can be heard. ]",{x=0, y=0, alx='l', blinker= false,nrows = 3, box = false, w = 525})
	
local mChairs = _navi:new("[ The furniture includes some handome old New England pieces of birch and maple: a couple of deep arm chairs and two rockers, with one of the rockers placed rather prominently. It is the old-fashioned type women used for sewing. ]",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local mFlag = _navi:new("[ On the wall, between the front door and the bay window, is a tattered old 'Rattlesnake' flag of the Continentals, framed and under glass. ]",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local mSinging = _navi:new(" CORPOS: The Corpos are coming, hurrah, hurrah!|n The Corpos are coming, hurrah, hurrah!|n The Corpos will capture the vote of Chicago,|n The Corpos are coming, hurrah, hurrah!|n|n The Corpos are coming, hurrah, hurrah!|n The Corpos are coming, hurrah, hurrah!|n The Corpos will eat all the beans up in Boston,|n The Corpos are coming, hurrah, hurrah!",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local mDoorway = _navi:new("[ In the rear of the room, at right, is an arched doorway, through which one can see the front hallway and the white-panelled front door. This arch is hung with heavy portieres, which may be drawn in winter. At present they are not drawn. ]",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local mStairs = _navi:new("[ On the left, there is a curving staircase to the second floor. This staircase, with the wall behind it, forms the entire left side of the room. At the side of the saircase, scarely noticeable, is a low door leading to the basement. ]",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local mLorinda = _navi:new("[ The 'Society and Woman's Editor' of the Ft. Beulah Daily Informer, a newspaper edited and run by DOREMUS JESSUP. She is something of a reformer, not unlikely to tell unwelcome truths with dry humor. She is also very attractive. ]",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})
local mTausbrough = _navi:new("[ FRANCIS TAUSBROUGH: Pompous textile manufacturer of 55- the richest man in town- is a lifelong acquaintance of DOREMUS. However much DOREMUS may be irritated by TAUSBROUGH's smug Toryism, he is the only one in the room elaborately dressed. ] ",{x=0, y=0, alx='l', blinker= false, box = false, w = 545})

local buttons = {}

	buttons[1] = Button:new({ x = 400, y = 260, text = "Chairs", type = 1}) 
	buttons[2] = Button:new({ x = 710, y = 80, text = "Window", type = 1,factor = 10,enable = true}) 
	buttons[9] = Button:new({ x = 350, y = 50, text = "Tausbrough", type = 1, factor = 8,enable = false}) 
	buttons[3] = Button:new({ x = 350, y = 50, text = "Tausbrough", type = 2, factor = 8,enable = false}) 
	buttons[4] = Button:new({ x = 450, y = 100, text = "Flag", type = 1,factor = 8.5}) 
	buttons[5] = Button:new({ x = 700, y = 90, text = "Singing", type = 1,factor = 9,enable = false}) 
	buttons[6] = Button:new({ x = 1000, y = 200, text = "Doorway", type = 1,factor = 8}) 
	buttons[7] = Button:new({ x = 30, y = 75, text = "Stairs", type = 1,factor = 10}) 
	buttons[8] = Button:new({ x = 475, y = 60, text = "Lorinda", type = 1,factor = 10, enable = false}) 

--[[ 		--debug
	buttons[9] = Button:new({ x = 350, y = 50, text = "Tausbrough", type = 1, factor = 8,enable = false}) 
	buttons[3] = Button:new({ x = 350, y = 50, text = "Tausbrough", type = 2, factor = 8,enable = true}) 
	buttons[4] = Button:new({ x = 450, y = 100, text = "Flag", type = 1,factor = 8.5,enable = false}) 
--]]
	
	
local textButton = Button:new({ x = -100, y = -100, text = "- x -", type = 0,enable = false})
local cursorButton = Button:new({ x = -100, y = -100, text = ". . .", type = 0,enable = false})

local graphics = 	{
					background = love.graphics.newImage("res/gamescene1.png"),
					parallax = love.graphics.newImage("res/gamescene1p.png"),
					parallax2 = love.graphics.newImage("res/gamescene1p2.png"),
					parallax3 = love.graphics.newImage("res/gamescene1p3.png")
					}
local fonts =		{
					Type = love.graphics.newFont("res/LetterGothicStd.otf",14)
					}
local colors = 		{
					background = {57,57,57},
					}

local function resetButtons()
	buttonDelay = 0
	cursorButton:setEnable(false)
	textButton:setEnable(false)
	m1aButton:setEnable(false)
	m1bButton:setEnable(false)	
	m3aButton:setEnable(false)		
	m3bButton:setEnable(false)	
	m5aButton:setEnable(false)		
	m5bButton:setEnable(false)	
	cursorButton:setPos(-100,-100)
	textButton:setPos(-100,-100)
	m1aButton:setPos(-100,-100)
	m1bButton:setPos(-100,-100)
	m3aButton:setPos(-100,-100)
	m3bButton:setPos(-100,-100)
	m5aButton:setPos(-100,-100)
	m5bButton:setPos(-100,-100)
	
	hideAll = false
	for n,b in pairs(buttons) do
		b:setAlpha(0)
	end
end

local function drawMessages()
	if buttons[1]:getClicked() then		-- chairs
		local x = 200
		local y = 180
		local h = 110
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/5,y,605+40,h)
		love.graphics.setColor(255,255,255)
		mChairs:play(x-mx/5,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(5)
		textButton:setEnable(true)
		if mChairs:is_over() then
			mChairs:init()
			resetButtons()
			buttons[1]:setClicked(false)
			buttons[1]:setEnable(false)						
		end
	elseif buttons[2]:getClicked() then		--window
		local x = 350
		local y = 50
		local h = 90
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/10,y,605+40,h)
		love.graphics.setColor(255,255,255)
		_navi.play_list(mWindow,x-mx/10,y+10)
		if mWindow[1]:is_over() then
			cursorButton:setEnable(false)
			textButton:setPos(x+290,y+(h-30))
			textButton:setFactor(10)
			textButton:setEnable(true)
		else
			cursorButton:setPos(x+290,y+(h-30))
			cursorButton:setFactor(10)
			cursorButton:setEnable(true)
		end
		if mWindow[#mWindow]:is_over() then
			mWindow[1]:init()
			resetButtons()
			cursorButton:setClicked(false)
			buttons[2]:setClicked(false)
			buttons[5]:setEnable(true)
			buttons[4]:setEnable(false)			
			buttons[2]:setEnable(false)						
			buttons[9]:setEnable(true)						
			buttons[8]:setEnable(true)						
		end	
	elseif buttons[3]:getClicked() then	-- conversation 1
		local x = 200
		local y = 180
		local h = 150
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/5,y,595+40,h)
		love.graphics.setColor(255,255,255)
		if mLast:is_over() then
			gamestate:gotoState(NEXTSTATE)		
		elseif (m5a:is_over() or m5b:is_over()) then
			mLast:play(x-mx/5,y+10)
			cursorButton:setEnable(false)
			textButton:setPos(x+290,y+(h-30))
			textButton:setFactor(5)
			textButton:setEnable(true)
		elseif m[#m]:is_over() then
			m5aButton:setPos(-100,-100)
			m5bButton:setPos(-100,-100)
			m5bButton:setEnable(false)	
			m5aButton:setEnable(false)	
			cursorButton:setPos(x+290,y+(h-30))
			cursorButton:setFactor(5)
			cursorButton:setEnable(true)
			if m5aButton:getClicked() then
				m5a:play(x-mx/5,y+10)	
			else
				m5b:play(x-mx/5,y+10)
			end
		else
			_navi.play_list(m,x-mx/5,y+10)
			if m[4]:is_over() then
				cursorButton:setEnable(false)			
				m5aButton:setPos(x,y+(h-90))
				m5aButton:setFactor(5)
				m5aButton:setEnable(true)
				m5bButton:setPos(x,y+(h-52))
				m5bButton:setFactor(5)
				m5bButton:setEnable(true)	
			elseif m[3]:is_over() then
				m3aButton:setEnable(false)
				m3bButton:setEnable(false)
				cursorButton:setPos(x+290,y+(h-30))
				cursorButton:setFactor(5)
				cursorButton:setEnable(true)
			elseif m[2]:is_over() then
				cursorButton:setEnable(false)			
				m3aButton:setPos(x,y+(h-90))
				m3aButton:setFactor(5)
				m3aButton:setEnable(true)
				m3bButton:setPos(x,y+(h-52))
				m3bButton:setFactor(5)
				m3bButton:setEnable(true)
			elseif m[1]:is_over() then
				m1aButton:setEnable(false)
				m1bButton:setEnable(false)
				cursorButton:setPos(x+290,y+(h-30))
				cursorButton:setFactor(5)
				cursorButton:setEnable(true)			
			else
				m1aButton:setPos(x,y+(h-90))
				m1aButton:setFactor(5)
				m1aButton:setEnable(true)
				m1bButton:setPos(x,y+(h-52))
				m1bButton:setFactor(5)
				m1bButton:setEnable(true)
			end
		end
	elseif buttons[4]:getClicked() then	--flag
		local x = 300
		local y = 80
		local h = 80
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/5,y,605+40,h)
		love.graphics.setColor(255,255,255)
		mFlag:play(x-mx/5,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(5)
		textButton:setEnable(true)
		if mFlag:is_over() then
			resetButtons()
			buttons[4]:setClicked(false)
			buttons[4]:setEnable(false)
		end
	elseif buttons[5]:getClicked() then	--singing
		local x = 360
		local y = 40
		local h = 200
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/8,y,545+40,h)
		love.graphics.setColor(255,255,255)
		mSinging:play(x-mx/8,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(8)
		textButton:setEnable(true)
		if mSinging:is_over() then
			resetButtons()
			buttons[5]:setClicked(false)
			buttons[5]:setEnable(false)						
		end
	elseif buttons[6]:getClicked() then	--doorway
		local x = 425
		local y = 130
		local h = 110
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/8,y,605+40,h)
		love.graphics.setColor(255,255,255)
		mDoorway:play(x-mx/8,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(8)
		textButton:setEnable(true)

		if mDoorway:is_over() then
			resetButtons()
			buttons[6]:setClicked(false)
			buttons[6]:setEnable(false)						
		end
	elseif buttons[7]:getClicked() then	--stairs
		local x = 50
		local y = 80
		local h = 100
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/8,y,615+40,h)
		love.graphics.setColor(255,255,255)
		mStairs:play(x-mx/8,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(8)
		textButton:setEnable(true)
		
		if mStairs:is_over() then
			resetButtons()
			buttons[7]:setClicked(false)
			buttons[7]:setEnable(false)						
		end
	elseif buttons[8]:getClicked() then	-- Look at Lorinda
		local x = 400
		local y = 180
		local h = 115
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/8,y,605+40,h)
		love.graphics.setColor(255,255,255)
		mLorinda:play(x-mx/8,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(8)
		textButton:setEnable(true)
		if mLorinda:is_over() then
			resetButtons()
			buttons[8]:setClicked(false)
			buttons[8]:setEnable(false)						
		end
	elseif buttons[9]:getClicked() then	-- Look at Lorinda
		local x = 100
		local y = 180
		local h = 115
		hideAll = true
		love.graphics.setColor(unpack(colors["background"]))	
		love.graphics.rectangle("fill",x-20-mx/8,y,605+40,h)
		love.graphics.setColor(255,255,255)
		mTausbrough:play(x-mx/8,y+10)
		textButton:setPos(x+290,y+(h-30))
		textButton:setFactor(8)
		textButton:setEnable(true)
		if mTausbrough:is_over() then
			resetButtons()
			buttons[9]:setClicked(false)
			buttons[9]:setEnable(false)						
			buttons[3]:setEnable(true)						
		end
	end
	if textButton:getClicked() or cursorButton:getClicked() then
		buttonDelay = 0
		textButton:setClicked(false)
		cursorButton:setClicked(false)
	end
	if buttonDelay > 8 then
		cursorButton:draw()		
		textButton:draw()
		m1aButton:draw()				
		m1bButton:draw()
		m3aButton:draw()
		m3bButton:draw()
		m5aButton:draw()
		m5bButton:draw()
	end
end


local function updateButtons(dt)
	for n,b in pairs(buttons) do
		b:update(dt,mx)
	end	
end

local function updateSpecialButtons(dt)
	textButton:update(dt,mx)
	cursorButton:update(dt,mx)
	m1aButton:update(dt,mx)
	m1bButton:update(dt,mx)
	m3aButton:update(dt,mx)
	m3bButton:update(dt,mx)
	m5aButton:update(dt,mx)
	m5bButton:update(dt,mx)
end

local function drawDebug()
	love.graphics.setFont(fonts["Type"])
	love.graphics.setColor(255,255,255)
	local x = mx + CENTERX
	love.graphics.print(mx ..", "..mx+CENTERX..', '..my, x+ 16, my + 8)					-- Mouse overlay
end

------------------------------------------------------------------------------------------









function One:enteredState()
	mx,my = love.mouse.getPosition()
	mx = mx-CENTERX
	buttonDelay = 0
	love.audio.play(audio["amb"])
end

function One:exitedState()
	
end

function One:update(dt)
	mx,my = love.mouse.getPosition()
	mx = mx-CENTERX

	updateSpecialButtons(dt)
	
	if hideAll then 
		buttonDelay = buttonDelay + dt
	else
		updateButtons(dt)
	end
	
    arc.check_keys(dt)	
end

function One:draw()
	love.graphics.setBackgroundColor(unpack(colors["background"]))
	love.graphics.push()
	love.graphics.translate(CENTERX,CENTERY)
	love.graphics.setColor(255,255,255)
		love.graphics.draw(graphics["background"],0-mx/10,0,0,1,1,1280/2,576/2)
		love.graphics.draw(graphics["parallax3"],0-mx/9,0,0,1,1,1280/2,576/2)
		love.graphics.draw(graphics["parallax2"],0-mx/7.5,0,0,1,1,1280/2,576/2)
		love.graphics.draw(graphics["parallax"],0-mx/5,0,0,1,1,1280/2,576/2)
	love.graphics.pop()			--	love.graphics.poop()	
	
	if hideAll then else		-- draw buttons
		for n,b in pairs(buttons) do
			b:draw()
		end		
	end

	drawMessages()
	arc.clear_key()
--	drawDebug()
end

function One:keypressed(key, unicode)
	if key == 'escape' then
		love.event.push('quit')
	elseif key == ' ' then
		arc.set_key('z')
	elseif key == 'up' then
		arc.set_key('up')
	elseif key == 'down' then
		arc.set_key('down')
	end
end

function One:mousepressed(x, y, button)
	for n,b in pairs(buttons) do
		b:mousepressed(x,y,button)
	end	

	if textButton:mousepressed(x,y,button) or cursorButton:mousepressed(x,y,button) then
		arc.set_key('z')
	end
	if m1aButton:mousepressed(x,y,button) or m1bButton:mousepressed(x,y,button) then
		arc.set_key('z')
	end
	if m3aButton:mousepressed(x,y,button) or m3bButton:mousepressed(x,y,button) then
		arc.set_key('z')
	end
	if m5aButton:mousepressed(x,y,button) or m5bButton:mousepressed(x,y,button) then
		arc.set_key('z')
	end
end

function One:joystickpressed(joystick, button)

end
