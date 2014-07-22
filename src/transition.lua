while true do
	screen:clear()
	pad = Controls.read()

	if pad:start() then dofile("lvl2.lua") end

	screen:print(220,100,"Level 2", Color.new(255,255,255))
	screen:print(202,110,"Press Start", Color.new(255,255,255))

	screen.waitVblankStart()
	screen.flip()
end
