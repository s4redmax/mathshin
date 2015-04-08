local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()

local function nextpage10()
        storyboard.gotoScene( "page4", "crossFade", 1000 )    
    return true
end

local function nextpage11()
        storyboard.gotoScene( "page4", "crossFade", 1000 )    
    return true
end

local function nextpage12()
        storyboard.gotoScene( "page4", "crossFade", 1000 )    
    return true
end

local tmr = 60
local timeleft
local myTimer
local function timelimited4()
        storyboard.gotoScene( "restart", "crossFade", 1000 )    
    return true
end

function scene:createScene( event )
    local group = self.view
    local background = display.newImage( "background1.jpg", display.contentWidth, display.contentHeight )
    background.anchorX = 0
    background.anchorY = 0
    background.x, background.y = 0, 0
	
	local function timesupScene()   
        storyboard.gotoScene("restart", "fade", 1000)
    end
	local timetext = display.newText("Time: " ,180,100,"Arial",100)
    timetext:setTextColor(64,64,64)

    timeleft = display.newText(tmr,350,100,"Impact",100)
    timeleft:setTextColor(64,64,64)
    
	local function countTimer()

        tmr = tmr - 1
        

        if tmr == 0 then
            timesupScene()
        end
        if tmr < 0 then
            tmr = 60
        end
        timeleft.text = tmr
    end

    myTimer= timer.performWithDelay(1000,countTimer,60)
	
    b1 = widget.newButton{
        defaultFile="54.png",
    }
   	
	b1.xScale = 2
	b1.yScale = 3
	b1.x = 300 
	b1.y = 500
	
	b2 = widget.newButton{
        defaultFile="64.png",
    }
    b2.xScale = 2
	b2.yScale = 3
	b2.x = 700 
	b2.y = 500
	
	b3 = widget.newButton{
        defaultFile="61.png",
    }
    b3.xScale = 3
	b3.yScale = 3
	b3.x = 500 
	b3.y = 500
	
	b4 = widget.newButton{
        defaultFile="63.png",
    }
    b4.xScale = 3
	b4.yScale = 3
	b4.x = 450 
	b4.y = 800
	
	b5 = widget.newButton{
        defaultFile="7.png",
    }
    b5.xScale = 2
	b5.yScale = 3
	b5.x = 700 
	b5.y = 800
	
	b6 = widget.newButton{
        defaultFile="3.png",
        onRelease = nextpage10
    }
    b6.xScale = 6
	b6.yScale = 3
	b6.x = 550 
	b6.y = 1100
	
	b7 = widget.newButton{
        defaultFile="5.png",
        onRelease = nextpage11
    }
    b7.xScale = 6
	b7.yScale = 3
	b7.x = 550 
	b7.y = 1400
	
	b8 = widget.newButton{
        defaultFile="7.png",
        onRelease = nextpage12
    }
    b8.xScale = 6
	b8.yScale = 3
	b8.x = 550 
	b8.y = 1700
	 		
    group:insert ( background )
    group:insert( timetext )
    group:insert( timeleft )
    group:insert ( b1 )
    group:insert ( b2 )
    group:insert ( b3 )
    group:insert ( b4 )
    group:insert ( b5 )
    group:insert ( b6 )
    group:insert ( b7 )
    group:insert ( b8 )
end

function scene:enterScene( event )
    local group = self.view 
    tmr = 60 
    timeleft.text = tmr    
end
function scene:exitScene( event )
    local group = self.view    
end
function scene:destroyScene( event )
    local group = self.view
    if buttonHome then
        buttonHome:removeSelf()
        buttonHome = nil
    end        
end
   
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene