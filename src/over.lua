while true do
  screen:clear()
  pad = Controls.read()

  if pad:cross() then dofile("script.lua") end

  screen:print(220,100,"Game Over", Color.new(255,255,255))
  screen:print(210,110,"Press Cross", Color.new(255,255,255))

  screen.waitVblankStart()
  screen.flip()
end