Spark = {}
Spark.__index = Spark;

function Spark.new() 
    local self = setmetatable({}, Spark);
    self.x = math.random(width() / 2 - 25, width() / 2 + 25);
    self.y = height() + 50;
    self.size = 2;
    self.velY = math.random(5, 10);

    return self;
end

function Spark:display() 
    fill(0, 100, 100, 100, 10);
    ellipse(self.x, self.y, self.size, self.size);
end

function Spark:move() 
    self.y = self.y - self.velY;
    self.x = self.x - math.cos(self.y) * 0.5;
end