Dot = {}
Dot.__index = Dot;

function Dot.new ()
    local self = setmetatable({}, Dot)

    self.x = math.random(width() / 2 - 25, width() / 2 + 25);
    self.y = height() + 50;
    self.size = 100;
    self.velY = math.random(3, 7);
    self.h = math.random(0, 255);
    self.a = 100;

    return self; 
end

function Dot:display() 
    fill(self.h, 40, 20, self.a);
    ellipse(self.x, self.y, self.size, self.size);
end

function Dot:move() 
    self.y = self.y - self.velY;
    self.x = self.x + math.cos(self.y) * 2;
    self.size = self.size - 2;
    self.a = self.a - 1.5;
end