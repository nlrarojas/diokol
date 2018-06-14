--[[
Código de Manoylov de Kiev
Semi Circle Patchwork 
https://www.openprocessing.org/sketch/510598

Controls:                                                            //
//    mouse                                                             //
//      click: generate new patchwork                                   //
//                                                                      //
//    keyboard                                                          //
//       '1': modeFn - semiDual                                         //
//       '2': modeFn - shark                                            //
//       '3': modeFn - oneSemi                                          //
//       '4': modeFn - mess                                             //
//       '5': modeFn - rotateSemi                                       //
//       '6': modeFn - pear                                             //
//       '7': modeFn - chain 
]]

local blockSize = 50;
local countBorder = 9;
local wdt = blockSize * countBorder;
local hgt = blockSize * countBorder;
local modes = {'semiDual', 'shark', 'oneSemi', 'mess', 'rotateSemi', 'pear', 'chain'};
local currModeFnValue = modes[1];
local colorSchemes = {
  { '#152A3B', '#158ca7', '#F5C03E', '#D63826', '#F5F5EB' },
  { '#0F4155', '#288791', '#7ec873', '#F04132', '#fcf068' },
  { '#E8614F', '#F3F2DB', '#79C3A7', '#668065', '#4B3331' }
};
local queueNum = { 1, 2, 3, 4, 5 };
local clrs = colorSchemes[1];

function setup() 
  size(wdt, hgt);  
  rectMode(CENTER);
  noStroke();
  noLoop();    
end

function draw() 
  background(25);
  for y = blockSize / 2, height(), blockSize do
    for x = blockSize / 2, width(), blockSize do
      queueNum = shuffleArray({ 1, 2, 3, 4, 5});
      if clrs[queueNum[1]] then
        fill(clrs[queueNum[1]]);
      end
      rect(x, y, blockSize, blockSize);
      pushMatrix();
      translate(x, y);
      currModeFn(0, 0, clrs);
      popMatrix();
    end
  end
  paper();
end

function currModeFn(x, y, clrs)
  if currModeFnValue == 'semiDual' then
    semiDual(x, y, clrs);
  elseif currModeFnValue == 'shark' then
    shark(x, y, clrs);
  elseif currModeFnValue == 'oneSemi' then
    oneSemi(x, y, clrs);
  elseif currModeFnValue == 'mess' then
    mess(x, y, clrs);
  elseif currModeFnValue == 'rotateSemi' then
    rotateSemi(x, y, clrs);
  elseif currModeFnValue == 'pear' then
    pear(x, y, clrs);
  elseif currModeFnValue == 'chain' then
    chain(x, y, clrs);
  else
    chain(x, y, clrs);
  end    
end

function chain(x, y, clrs) 
  rotate(radians(90 * math.floor(math.random(1, 5))));
  fill(clrs[queueNum[1]] or '#152A3B');
  arc(x - blockSize / 2, y, blockSize, blockSize, radians(270), radians(450));
  fill(clrs[queueNum[2]] or '#158ca7');
  arc(x + blockSize / 2, y, blockSize, blockSize, radians(90),  radians(270));

  rotate(radians(90 * math.floor(math.random(1, 5))));
  fill(clrs[queueNum[1]] or '#152A3B');
  arc(x, y + blockSize / 2, blockSize, blockSize, radians(180), radians(360));
  fill(clrs[queueNum[2]] or '#158ca7');
  arc(x, y - blockSize / 2, blockSize, blockSize, radians(0),   radians(180));
end

function pear(x, y, clrs) 
  rotate(radians(90 * math.floor(math.random(1, 5))));

  fill(clrs[queueNum[1]] or '#F04132');
  arc(x - blockSize / 2, y, blockSize, blockSize, radians(270), radians(450));
  fill(clrs[queueNum[2]] or '#4B3331');
  arc(x + blockSize / 2, y, blockSize, blockSize, radians(90),  radians(270));

  fill(clrs[queueNum[1]] or '#F04132');
  arc(x, y + blockSize / 2, blockSize, blockSize, radians(180), radians(360));
  fill(clrs[queueNum[2]] or '#4B3331');
  arc(x, y - blockSize / 2, blockSize, blockSize, radians(0),   radians(180));
end

function rotateSemi(x, y, clrs) 
  rotate(radians(90 * math.floor(math.random(1, 5))));
  fill(clrs[queueNum[1]] or '#158ca7');
  arc(-blockSize / 2, 0, blockSize, blockSize, radians(270), radians(450));
end

function mess(x, y, clrs) 
  fill(clrs[queueNum[math.floor(math.random(#queueNum))]] or '#F04132');
  arc(-blockSize / 2, 0, blockSize, blockSize, radians(270), radians(450));
  for i = 0, 3 do
    fill(clrs[queueNum[math.floor(math.random(#queueNum))]] or '#158ca7');
    rotate(radians(90 * math.floor(math.random(1, 5))));
    arc(x, y + blockSize / 2, blockSize, blockSize, radians(270), radians(450));
  end
end

function oneSemi(x, y, clrs) 
  if (math.random(1) > .2) then
    fill(clrs[queueNum[math.floor(math.random(#queueNum))]] or '#158ca7');
    arc(x - blockSize / 2, y, blockSize, blockSize, radians(270), radians(450));
  end
end

function shark(x, y, clrs) 
  if (math.random(1) > .4) then
    fill(clrs[queueNum[math.floor(math.random(#queueNum))]] or '#158ca7');
    arc(x, y + blockSize / 2, blockSize, blockSize, radians(270), radians(450));
  end
end

function semiDual(x, y, clrs) 
	rotate(radians(90 * math.floor(math.random(1, 5))));
  if (math.random() > .005) then
    fill(clrs[queueNum[1]] or '#152A3B');
    arc(x - blockSize / 2, y, blockSize, blockSize, radians(270), radians(450));
    fill(clrs[queueNum[2]] or '#158ca7');
    arc(x + blockSize / 2, y, blockSize, blockSize, radians(90),  radians(270));
  end
end

function shuffleArray(array) 
  local j, temp;
  for i = #array - 1, 0, -1 do
    j = math.floor(math.random() * (i + 1));
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  end
  return array;
end

function resetPatchwork(modeFn) 
  currModeFnValue = modeFn or modes[math.floor(math.random(#modes))];
  clrs = colorSchemes[Math.floor(random(#colorSchemes))];
  redraw();
end

function mousePressed()
  resetPatchwork();
end

function keyPressed(e)  
  if e == 'A' then        
    resetPatchwork('semiDual');
  elseif e == 'B' then
    resetPatchwork('shark');
  elseif e == 'C' then
    resetPatchwork('oneSemi');
  elseif e == 'D' then
    resetPatchwork('mess');
  elseif e == 'E' then
    resetPatchwork('rotateSemi');
  elseif e == 'F' then
    resetPatchwork('pear');
  elseif e == 'G' then
    resetPatchwork('chain');
  elseif e == 's' then
    save('img_'..math.random(100, 900)..'.jpg');
  else
    resetPatchwork();
  end            
end

function paper() 
  pushMatrix();
  strokeWeight(1);
  noStroke();
  for i = 1, width()-1, 2 do
    for j = 1, height()-1, 2 do
      fill(math.random(205-40, 205+30), 25);
      rect(i, j, 2, 2);
    end
  end

  for i = 1, 30 do
    fill(math.random(130, 215), math.random(100, 170));
    rect(math.random(0, width()-2), math.random(0, height()-2), math.random(1, 3), math.random(1, 3));
  end

  popMatrix();
end