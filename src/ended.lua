back = Image.load("img/background.png")
player = Image.load("img/flower2.png")

y = 220

Mp3me.load("sound.mp3")
Mp3me.play()

while true do
	screen:clear()
	pad = Controls.read()

	if pad:cross() then dofile("script.lua") end

	screen:blit(0,0,back)
	screen:blit(220,y,player)

	y = y-0.5

	if y <= 110 then 
		y = 110 
		screen:print(215,85,"You win", Color.new(255,0,0))
		screen:print(202,95,"Press Cross", Color.new(255,0,0))
	end
	
	screen.waitVblankStart()
	screen.flip()
end