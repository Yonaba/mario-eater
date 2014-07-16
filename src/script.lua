while true do
	screen:clear()
	pad = Controls.read()

	if pad:start() then dofile("lvl1.lua") end

	screen:print(150,100,"Eat all Falling Mario To win", Color.new(255,255,255))
	screen:print(202,110,"Enjoy your meal!!", Color.new(255,255,255))
	screen:print(380,252,"Press Start", Color.new(255,255,255))

	screen.waitVblankStart()
	screen.flip()
end
