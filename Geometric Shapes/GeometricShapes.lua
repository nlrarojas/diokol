--[[
  Script original por: Saskia Freeke

  Adaptado por: Nelson Rojas Obando
  TEC - 2018

  Source:
  https://www.openprocessing.org/sketch/352407
]]

local t;
local theta;
local theta2;
local maxFrameCount = 1000;

function setup()
  size(800,700,P2D);
  background('#2F0557');
  noFill();
  strokeWeight(1);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  frameRate(30);
end

function draw()
  translate(width()/2,height()/2);  
  
  t = frameCount()/maxFrameCount;
  theta = TWO_PI*t;
  theta2 = TWO_PI*t*2;
 
  for x= -600, 601, 400 do
    for y = -600, 601, 400 do
     
      offSet = 0;    
      pos1 = map(math.sin(-theta+offSet), 0, 1, 0, (x+y/4));
      pos2 = map(math.cos(-theta+offSet), 0, 1, (x+y/4), 0);
      pos3 = map(math.cos(-theta2+offSet), 0, 1, -(y), 0);
      pos4 = map(math.sin(-theta2+offSet), 0, 1, 0,  y);
      pos5 = map(math.cos(-theta+offSet), -1, 1, -300, 300);
      pos6 = map(math.sin(-theta+offSet), -1, 1, 300, -300); 

      stroke('#E0E8EB', 30);
      line(pos6,pos5,x-pos2,y+pos1);
  
      stroke('#DF4C5E', 50);
      line(pos5,pos6,x+pos4,y-pos3);
   end
  end
end