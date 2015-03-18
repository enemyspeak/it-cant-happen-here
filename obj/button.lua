---------------------------------------------------------
--Button code originally based on code by Michael Enger--
---------------------------------------------------------

local Button = class('Button')

Button.static.TALK = love.graphics.newImage("res/talk.png")  --this is a class variable
Button.static.EYE = love.graphics.newImage("res/eye.png")  --this is a class variable
Button.static.BUTTONTEXT = love.graphics.newFont("res/LetterGothicStd.otf",14)
Button.static.MAIN = {255,255,255}
Button.static.TEXT = {157,157,157}
Button.static.BACKGROUND = {57,57,57}
Button.static.HIGHLIGHTRANGE = 350
Button.static.FADEFACTOR = 1024

function Button:initialize(attributes)
	self.hidden = attributes.hidden or true
	
	if self.hidden then 
		self.alpha = attributes.alpha or 0
	else
		self.alpha = attributes.alpha or 255
	end
	
	self.hover = false -- whether the mouse is hovering over the button
	self.click = false -- whether the mouse has been clicked on the button
	self.text = attributes.text -- the text in the button
	self.text2 = attributes.text2 or 0

	self.parallax = attributes.parallax or 1 --enables or disables parallax

	self.type = attributes.type or 0

	if self.type == 0 then 
		self.width = attributes.width or Button.BUTTONTEXT:getWidth(self.text)
		if self.text2 == 0 then
			self.height = attributes.height or Button.BUTTONTEXT:getHeight() 
		else
			self.height = attributes.height or (Button.BUTTONTEXT:getHeight()*2)
		end
	else
		if self.type == 2 then
			self.height = attributes.height or 80
		else
			self.height = attributes.height or 65
		end
		if Button.BUTTONTEXT:getWidth(self.text) > 60 then
			self.width = attributes.width or Button.BUTTONTEXT:getWidth(self.text)
		else
			self.width = attributes.width or 60
		end
	end

	self.x = attributes.x - (self.width / 2)
	self.xPos = self.x
	self.y = attributes.y
	self.factor = attributes.factor or 6
	self.enable = attributes.enable
	if attributes.enable == nil then self.enable = true end
end

function Button:draw()
	love.graphics.setFont(Button.BUTTONTEXT)
	love.graphics.setColor(57,57,57,self.alpha) 
	local yPos = self.y - (Button.BUTTONTEXT:getHeight()/2)
	local xWidth = (self.width-Button.BUTTONTEXT:getWidth(self.text))/2
	
	if self.type == 0 then else
		love.graphics.rectangle("fill",self.xPos-xWidth-10,yPos-7,self.width+20,self.height+20)
	end
	
	if self.hover then love.graphics.setColor(unpack(Button.MAIN))
	else love.graphics.setColor(183,183,183,self.alpha) end
	love.graphics.print(self.text, self.xPos, self.y)
	
	if self.text2 == 0 then else
		love.graphics.print(self.text2, self.xPos, self.y+16)
	end
	
	if self.type == 1 then
		love.graphics.draw(Button.EYE, self.xPos+Button.BUTTONTEXT:getWidth(self.text)/2, self.y+40,0,0.8,0.8,40,50)
	elseif self.type == 2 then
		love.graphics.draw(Button.TALK, self.xPos+Button.BUTTONTEXT:getWidth(self.text)/2, self.y+50,0,1,1,40,50)
	elseif self.type == 3 then
		love.graphics.draw(Button.TALK, self.xPos+Button.BUTTONTEXT:getWidth(self.text)/2, self.y+50,0,1,1,40,50)
		love.graphics.draw(Button.EYE, self.xPos+Button.BUTTONTEXT:getWidth(self.text)/2, self.y+90,0,0.8,0.8,40,50)
	end
end

function Button:update(dt,x)
	if self.enable then
		self.hover = false

		if self.parallax == 0 then else
			self.xPos = self.x - x/self.factor
		end
			
		local x = love.mouse.getX()
		local y = love.mouse.getY()
		
		if ( self.xPos - x ) ^ 2 + ( self.y - y ) ^ 2 < (Button.HIGHLIGHTRANGE) ^ 2 or self.type == 0 then		-- Within Circle (x-a)^2 + (y-b)^2 = r ^2
			self.hidden = false
		else
			self.hidden = true
		end
		
		if self.hidden then 
			self.alpha = self.alpha - Button.FADEFACTOR*(dt)
		else 
			self.alpha = self.alpha + Button.FADEFACTOR*(dt) 
		end
		
		if self.alpha < 0 and self.hidden then 
			self.alpha = 0
		elseif self.alpha > 255 and self.hidden == false then 
			self.alpha = 255 
		end
		
		if self.hidden then 
			self.hover = false
		else
			if x > self.xPos
				and x < self.xPos + self.width
				and y > self.y
				and y < self.y + self.height then
				self.hover = true
			else
				self.hover = false
			end
		end
	else
		self.hover = false
		self.alpha = 0
	end
end

function Button:setHover(value)
	self.hover = value
end

function Button:setAlpha(value)
	self.alpha = value
end

function Button:setEnable(value)
	self.enable = value
end

function Button:setFactor(value)
	self.factor = value
end

function Button:setPos(x,y)
	self.x = x
	self.y = y
end

function Button:setClicked(value)
	self.click = value
end

function Button:getClicked()
	return self.click
end

function Button:mousepressed(x, y, button)
	if self.hover then
		self.click = true
		return true
	end	
	self.click = false		-- this might break something
	return false
end

return Button
