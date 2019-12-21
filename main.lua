require("vector")
require("particle")
require("repeller")
require("particle_system")

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  textures = {}
  textures.heart = love.graphics.newImage("heart.png")
  textures.fusion = love.graphics.newImage("texture.png")
  system = ParticleSystem:create(width/2, -30, 1000)
  wind = Vector:create(0.01, 0)
  --repeller = Repeller:create(width / 2 + 100,height / 2 + 150)
  gravity = Vector:create(0, 0.05)
end

function love.draw()
  system:draw()
  system.origin.x = math.random(-100,width)
  --repeller:draw()
  end

function love.update(dt)
  system:applyForce(wind)
  system:applyForce(gravity)
  --system:applyRepeller(repeller)
  system:update()
end


function love.keypressed(key) 
end
