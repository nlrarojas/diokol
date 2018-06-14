Curve = {}
Curve.__index = Curve;

function Curve.new(zmax, hue)
    local self = setmetatable({}, Curve);            
    self.rs = 0;                
    self.z = 1;
    self.ro = 0;
    self.t = math.random(2,10);
    self.sp = math.random(0.1,0.3);
    self.rs = math.random(-0.05,0.05);
    self.n = math.random(2,10);
    self.v = math.random(0,100);
    self.s = 100;
    self.h = hue;
    self.zmax = zmax;

    return self;
end
  
function Curve:render()
    --sp -= 0.0001;
    self.z = self.z + self.sp;
    self.ro = self.ro + self.rs;
    stroke(self.h,self.s,self.v);
    strokeWeight((self.t*self.z)/20);
    for i=1, self.n do       
        arc(0, 0, (self.z*self.z*self.z)/self.zmax+5, (self.z*self.z*self.z)/self.zmax+5, TWO_PI/self.n*i + self.ro,  TWO_PI/self.n*(i+0.5) + self.ro);
    end
    if ((self.z*self.z*self.z)/self.zmax > math.sqrt(width()*width() + height()*height())) then 
        self:randomize();
    end
end

function Curve:randomize()
    self.z = 1;
    self.ro = 0;
    self.t = math.random(2,10);
    self.sp = math.random(0.1,0.3);
    self.rs = math.random(-0.05,0.05);
    self.n = math.random(2,10);
    self.v = math.random(0,100);
    self.s = 100;    
end