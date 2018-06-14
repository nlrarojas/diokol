--[[
	Scrirt original por: Shorin

	Adaptado por: Nelson Rojas Obando
	TEC - 2018

	Source: 
	https://www.openprocessing.org/sketch/538041
]]

function setup() 
	size(400 ,400);
	local font = createFont("data/Vera.ttf", 30)
    textFont(font)
end

function draw() 
    background(0);

    temp = os.date("*t")    
	hr = temp.hour;
	mn = temp.min;
	sc = temp.sec;
    
    if hr < 10 then
        hr = "0"..hr;
    end
    if mn < 10 then
        mn = "0"..mn;
    end
    if sc < 10 then 
        sc = "0"..sc;
    end

	strokeWeight(10);
	noFill();
    pushMatrix();
	stroke(20, 200, 200);
    end1 = map(sc, 0, 60, 0, 360);
	arc(width()/2, height()/2, 300, 300, 0, end1/60);

	stroke(20, 100, 200);
	end2 = map(mn, 0, 60, 0, 360);
	arc(width()/2, height()/2, 250, 250, 0, end2/60);

	stroke(20, 200, 100);
	end3 = map(hr, 0, 24, 0, 360);
	arc(width()/2, height()/2, 200, 200, 0, end3/60);
	
	fill(255);
	noStroke();
	textAlign(CENTER);	
	textWidth(5);
    text(hr..':'..mn..':'..sc, width()/2, height()/2);
    popMatrix();
end