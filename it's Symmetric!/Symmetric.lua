--[[
    Script original por: Jesse Smith

    Adaptado por: Nelson Rojas Obando
    TEC - 2018 

    Source:
    https://www.openprocessing.org/sketch/44236

    Controles: Reinicar con teclas 's' y con el click del mouse
]]

require "BezierPoint"

local saveCounter=1;
local pt1;
local pt2;
local pointSymmetry = false;
local xCenter, yCenter;

function setup()
    size(600, 450); 
    background(0); 
    smooth(); 
    
    xCenter = width()/2;
    yCenter = height()/2;
    
    pt1 = BezierPoint.new();
    pt2 = BezierPoint.new();
end

function draw()
    stroke(255, 255, 255, 50);
    noFill();

    armX1 = pt1:getXForArm();
    armX2 = pt2:getXForArm();
    armY1 = pt1:getYForArm();
    armY2 = pt2:getYForArm();

    --draw the 'primary' curve
    bezier(pt1.x,  pt1.y, armX1, armY1, armX2, armY2, pt2.x, pt2.y);

    --now, draw the reflected curve
    if(pointSymmetry) then
    bezier(xCenter + (xCenter-pt1.x), yCenter + (yCenter-pt1.y), xCenter + (xCenter-armX1), yCenter + (yCenter-armY1), xCenter + (xCenter-armX2), yCenter + (yCenter-armY2), xCenter + (xCenter-pt2.x), yCenter + (yCenter-pt2.y));
    else
    bezier(xCenter + (xCenter-pt1.x),  pt1.y, xCenter + (xCenter-armX1), armY1, xCenter + (xCenter-armX2), armY2, xCenter + (xCenter-pt2.x), pt2.y);
    end
    pt1:increment();
    pt2:increment();
end

function clearImage()
  fill(0);
  noStroke();
  rect(0,0,width(), height());
end

function keyPressed(key)
    if(key == 's') then
        pointSymmetry = not pointSymmetry;
        clearImage();
    else
        --save("output_" + saveCounter++ + ".png");
    end
end

function mouseClicked(x, y)
  clearImage();
  pt1:reinitializeIncrementers();
  pt2:reinitializeIncrementers();
end