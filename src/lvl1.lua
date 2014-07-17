Mp3me.load("sound.mp3")
Mp3me.play()

back = Image.load("img/background.png")
player = Image.load("img/flower.png")
player2 = Image.load("img/flower2.png")
mario = Image.load("img/mario.png")

player = {
	x = 236;
	y = 220;
	score = 0;
	img = player;
	height = 67;
	width = 54;
}

mario = {
	x = math.random (0,480);
	y = -20;
	height = 50;
	width = 25;
	img = mario;
}

mario2 = {
	x = math.random (0,480);
	y = -20;
	height = 50;
	width = 25;
	img = mario;
}

mario3 = {
	x = math.random (0,480);
	y = -20;
	height = 50;
	width = 25;
	img = mario;
}

function collideEngine(flame)
	if (player.x + player.width >flame.x) and 
		(player.x < flame.x + flame.width) and 
		(player.y + player.height > flame.y) and 
		(player.y < flame.y + flame.height) then 	
		player.score = player.score + 5
		mario.x = math.random(0,480)
		mario.y = -50	
		mario2.x = math.random(0,480)
		mario2.y = -50
		mario3.x = math.random(0,480)
		mario3.y = -50
	end
end



while true do
	screen:clear()

	pad = Controls.read()
	if pad:left() then player.x = player.x - 2 end
	if pad:right() then player.x = player.x + 2 end
	if player.x <= 0 or player.x >=480-54 then player.x = oldx end
	oldx = player.x

	mario.y = mario.y + 2
	mario2.y = mario2.y + 2
	mario3.y = mario3.y + 2

	if mario.y >= 290 then mario.y = -50 end
	if mario2.y >= 290 then mario2.y = -50 end
	if mario3.y >= 290 then mario3.y = -50 end

	collideEngine(mario)
	collideEngine(mario2)
	collideEngine(mario3)

	if player.score >= 100 then dofile("transition.lua") end

	screen:blit(0,0,back)
	screen:blit(player.x,player.y,player.img)
	screen:blit(mario.x,mario.y, mario.img)
	screen:blit(mario2.x,mario2.y, mario.img)
	screen:blit(mario3.x,mario3.y, mario.img)
	screen:print(380,10,"Score :" ..player.score,Color.new(25,200,0))
	
	screen.waitVblankStart()
	screen.flip()
end