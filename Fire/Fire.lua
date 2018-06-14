--[[
    Script original por: 
    Alejandro Endo

    Adaptado por: Nelson Rojas Obando
    TEC - 2018

    Source:
    https://www.openprocessing.org/sketch/525425
]]

require "Spark"
require "Dot"

local dots = {};
local sparks = {};

function setup() 
	size(500, 500);
	noStroke();	

	for x = 1,  10 do
		dots[x] = Dot.new();
		sparks[1] = Spark.new();
    end
end

function draw() 
	background(10);
    dot = Dot.new();
	table.insert(dots, dot);
	if (math.fmod(frameCount(), 5) == 0) then
        spark =  Spark.new();
        table.insert(sparks, spark);
    end	
    if pcall(renderSparksDots) then
        for x = 1, #dots do           
            dots[x]:display();            
            dots[x]:move();           
        end
    
        for x = 1, #sparks do
            sparks[x]:display();
            sparks[x]:move();
        end
    end
    renderSparksDots();
end

function renderSparksDots ()
    if dots[x] then error() end    
end


--[[for x = 1, #dots do
		if (dots[x].size <= 0) then
			--table.insert(dots, x, 1);
        end
    end

	for x = 1, #sparks do
		if (sparks[x].y <= 0) then
			--table.insert(sparks, x, 1);
        end
    end]]