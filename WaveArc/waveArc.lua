--[[
    Script original 
    Jerome Herr
    Adaptado por 
    Nelson Rojas 
    TEC 2018

    source
    https://www.openprocessing.org/sketch/152146
]]

local num =20;
local step, sz, offSet;
local theta = 0;

function setup() 
  size(600, 600);
  stroke(255);
  strokeWeight(5);
  noFill();
  step = 22;
end

function draw() 
  background(20);
  pushMatrix();
  translate(width()/2, height()/2);
  for i=0, num do
    sz = i*step;
    arc(0, 0, sz, sz, PI, TWO_PI);
  end
  popMatrix();
  translate(width()/2-num/2*step, height()/2);
  offSet = -PI/2;
  for i=0, num*2 do
    if i==0 then 
        f=20 
    else
        f=255
    end
    stroke(f);
    endY = map(math.sin(theta+offSet), -1, 1, 50, num*step/2);
    line(i*step/2, 2, i*step/2, endY);
    offSet = offSet + (math.pi/num);
end
    theta = theta + .0523;
  --if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
end