--[[
    Script original 
    Jerome Herr
    Adaptado por 
    Nelson Rojas 
    TEC 2018

    source
    https://www.openprocessing.org/sketch/152169
]]

local num = 20;
local step, sz, offSet;
local theta = 0;
local angle;

function setup() 
  size(600, 400);
  strokeWeight(5);
  step = 22;
end

function draw() 
    background(20);
    pushMatrix()
    translate(width()/2, height()*.75);
    angle=0;
    for i=0, num do
        stroke(255);
        noFill();
        sz = i*step;
        offSet = TWO_PI/num*i;
        arcEnd = map(math.sin(theta+offSet),-1,1, PI, TWO_PI);
        arc(0, 0, sz, sz, PI, arcEnd);
    end
    
    popMatrix();
    theta = theta + .0523;
end