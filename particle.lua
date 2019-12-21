Particle = {}
Particle.__index = Particle

function Particle: create(x,y)
    local particle  = {}
    setmetatable(particle, Particle)
    particle.location = Vector:create(x,y)
    particle.velocity = Vector:create(math.random(-200,200)/100,
                                        math.random(-200,200)/100)
    particle.lifespan = 200
    particle.acceleration = Vector:create(0, 0.05)
    particle.decay = math.random(3, 10) / 10
    particle.texture = textures.fusion
    return particle
end

function Particle:update()
    self.velocity:add(self.acceleration)
    self.location:add(self.velocity)
    self.acceleration:mul(0)
    self.lifespan = self.lifespan - self.decay
end

function Particle:applyForce(force)
    self.acceleration:add(force)
end
function Particle: draw()
    r,g,b,a = love.graphics.getColor()
    --love.graphics.setColor(0.88, 0.34, 0.13, self.lifespan / 100)
    love.graphics.draw(self.texture, self.location.x, self.location.y,
                                                0.3,0.3)
    love.graphics.setColor(r,g,b,a)
end

function Particle: isDead()
    return self.lifespan < 0
  end