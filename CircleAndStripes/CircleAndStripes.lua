--[[
    Script original por: Robin V

    Adaptado por: Nelson Rojas Obando
    TEC - 2018

    Source: 
    https://www.openprocessing.org/sketch/152447
]]

require 'Curve'

local c = {};
local zmax = 100;
local hue = 0;

function setup()
    size(600, 600);
    smooth();
    frameRate(60);  
    for i=1 , 10 do
        circle = Curve.new(zmax, hue);
        table.insert(c, circle);
        c[i].z = math.random(0,math.pow(math.sqrt(width()*width() + height()*height())*zmax,1/3));
    end
end

function draw()
    background(30);
    hue = hue + 1;
    if hue > 360 then
        hue =  0;
    else
        hue =  hue;
    end
    translate(width()/2, height()/2);
    stroke(0,0,100);
    noFill();
    for i=1, #c do
        if c[i] then
            c[i]:render();
        end
    end
end