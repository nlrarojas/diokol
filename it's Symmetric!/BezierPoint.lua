BezierPoint = {};
BezierPoint.__index = BezierPoint;

function BezierPoint.new()
    local self = setmetatable({}, BezierPoint);
    self.margin = 70;
    self.x = (self.margin + math.random(width()-(2*self.margin)));
    self.y = (self.margin + math.random(height()-(2*self.margin)));
    self.angle = math.random(360);
    self.armDistance = math.random(60);
    self.xDelta = 0;
    self.yDelta = 0;
    self.angleDelta = 0;
    self.armDelta = 0;

    self.xDelta = (math.random(30)-15);
    self.yDelta = (math.random(30)-15);
    self.angleDelta = math.random(6)-3;
    self.armDelta = math.random(4)-2;
    return self;
end
  
function BezierPoint:reinitializeIncrementers()
    
end
  
function BezierPoint:getXForArm()
    return self.x + (self.armDistance * math.sin(radians(self.angle)));
end

function BezierPoint:getYForArm()
    return self.y + (self.armDistance * math.cos(radians(self.angle)));
end
  
function BezierPoint:increment()
    self.x = self.x + self.xDelta;
    self.y = self.y + self.yDelta;
    self.angle = self.angle + self.angleDelta;
    self.armDistance = self.armDistance + self.armDelta;
        
    if (self.x < (0 + self.margin) or self.x > (width() - self.margin)) then
        self.xDelta = self.xDelta *-1;
    end
    if (self.y < (0 + self.margin) or self.y > (height() - self.margin)) then
        self.yDelta = self.yDelta *-1;
    end
    if(math.abs(self.armDistance) > 200) then
        self.armDelta = self.armDelta * -1;
        self.angle = math.fmod(self.angle,360);
    end
end