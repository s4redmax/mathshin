local storyboard = require( "storyboard" )
local widget = require "widget"
local scene = storyboard.newScene()
local backgroundMusic = audio.loadSound ("bawa.mp3")
local backgroundMusicChannel = audio.play(backgroundMusic,{channel = 1, loops = -1 ,fadein= 500})




local function nextpage()
        storyboard.gotoScene( "page", "crossFade", 1000 )    
    return true
end



	
function scene:createScene( event )
    local group = self.view

    local background = display.newImage( "background1.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0

	local logo = display.newImage ("logomath1.png")
	logo.xScale = 3
	logo.yScale = 3.5
	logo.x = 550
	logo.y = 400
	

  
    buttonHome = widget.newButton{
        defaultFile="start_btn.png",
        onRelease = nextpage
    }
   	
	buttonHome.xScale = 2
	buttonHome.yScale = 2
	buttonHome.x = 550
	buttonHome.y = 1100
	
	local text = display.newText("HigHScore : ",100,300,native.systemFont,30);
	text:setTextColor(0,0,0)
	text.xScale = 4
	text.yScale = 4
	text.x =  550
	text.y = 1500
	
    group:insert ( background )
    group:insert ( logo )
    group:insert ( buttonHome )
    group:insert ( text )

end

function scene:enterScene( event )
    local group = self.view    
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