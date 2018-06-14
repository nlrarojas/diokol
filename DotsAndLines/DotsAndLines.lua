--[[
    Script original por: Lylah Urrutia

    Adaptado por: Nelson Rojas Obando
    TEC - 2018

    Source:
    https://www.openprocessing.org/sketch/470480
]]

local windowHeight = 800
local windowHeight = 600
local mouseX = 0
local mouseY = 0

function setup() 
    size(windowHeight, windowHeight);
    background(0);
end
  
function draw()
    drawLines();
    drawDots();
end

function drawLines() 
    background(0);
    strokeWeight(2);
      
    --to each other
    stroke(255, 0, 255);
    line(mouseY, 23, 23, mouseX);
    line(mouseY, 23,mouseY, windowHeight - 23);
    line(mouseY, 23, windowHeight - 23, mouseX);
    line(23, mouseX, mouseY, windowHeight - 23);
    line(23, mouseX, windowHeight - 23, mouseX);
    line(mouseY, windowHeight - 23, windowHeight - 23, mouseX);
      
    --... to the center
    stroke(255, 255, 255);
    line(mouseX, mouseY, mouseY, 23);
    line(mouseX, mouseY, 23, mouseX);
    line(mouseY, windowHeight - 23, mouseX, mouseY);
    line(mouseX, mouseY, windowHeight - 23, mouseX);
      
    --center
    stroke(0, 255, 255);
    line(mouseX, mouseY, mouseY, mouseX);
    
    --corners
    stroke(0,0,255);
    line( 23, 23, mouseX,mouseY);
    line( 23, height()-23, mouseX,mouseY);
    line( height()-23, 23, mouseX,mouseY);
    line( height()-23, height()-23, mouseX,mouseY);
end

function drawDots()
    noStroke();
    
	fill(255);
	ellipse(mouseX, mouseY, 33, 33); --middle
	fill(240, 40, 20);
	ellipse(mouseY, 23, 23, 23); --top
	ellipse(23, mouseX, 23, 23); --left
	ellipse(mouseY, windowHeight - 23, 23, 23); --right
	ellipse(windowHeight - 23, mouseX, 23, 23); --bottom
	
	ellipse(23, 23, 23, 23);
	ellipse(23, height()-23, 23,23);
	ellipse(height()-23,23,23,23);
	ellipse(height()-23, height()-23, 23,23);
	
	fill(255,20,147);	
end

function mouseMoved(x, y)
    mouseX = x;
    mouseY = y;
end