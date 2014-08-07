Mp3me.load("sound.mp3")
Mp3me.play()

back = Image.load("img/background.png")
player = Image.load("img/flower.png")
player2 = Image.load("img/flower2.png")
mario = Image.load("img/mario.png")
bomb = Image.load("img/bomb.png")
rock = Image.load("img/rock.png")

player = {
  x = 236;
  y = 220;
  score = 0;
  img = player;
  height = 67;
  width = 54;
  health = 100;
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

bomb = {
  x = math.random (0,480);
  y = -20;
  height = 57;
  width = 56;
  img = bomb;
}

rock = {
  x = math.random (0,480);
  y = -20;
  height = 63;
  width = 50;
  img = rock;
}

function collideEngine(flame)
  if (player.x + player.width >flame.x) and 
     (player.x < flame.x + flame.width) and 
     (player.y + player.height > flame.y) and 
     (player.y < flame.y + flame.height) then   
        player.score = player.score +10
        mario.x = math.random(0,480)
        mario.y = -50  
        mario2.x = math.random(0,480)
        mario2.y = -50    
  end
end

function collideBomb(flame)
  if (player.x + player.width >flame.x) and 
     (player.x < flame.x + flame.width) and 
     (player.y + player.height > flame.y) and 
     (player.y < flame.y + flame.height) then   
        player.health = player.health - 5
        bomb.x = math.random(0,480)
        bomb.y = -30  
  end
end


function collideRock(flame)
  if (player.x + player.width >flame.x) and 
     (player.x < flame.x + flame.width) and 
     (player.y + player.height > flame.y) and 
     (player.y < flame.y + flame.height) then   
        player.health = player.health - 7
        rock.x = math.random(0,480)
        rock.y = -30      
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
  bomb.y = bomb.y + 3
  rock.y = rock.y + 3.5

  if mario.y >= 290 then
    mario.x = math.random(0,480) 
    mario.y = -50 
  end
  if mario2.y >= 290 then 
    mario2.x = math.random(0,480)
    mario2.y = -50 
  end
  if bomb.y >= 285 then 
    bomb.x = math.random(0,480)
    bomb.y = - 30
  end
  if rock.y >= 285 then 
    rock.x = math.random(0,480)
    rock.y = - 30 
  end

  collideEngine(mario)
  collideEngine(mario2)
  collideBomb(bomb)
  collideRock(rock)

  if player.score >= 100 then dofile("ended.lua") end
  if player.health <= 0 then dofile("over.lua") end

  screen:blit(0,0,back)
  screen:blit(player.x,player.y,player.img)
  screen:fillRect(10,10,player.health,10,Color.new(255,0,0))
  screen:blit(mario.x,mario.y, mario.img)
  screen:blit(mario2.x,mario2.y, mario.img)
  screen:blit(bomb.x,bomb.y, bomb.img)
  screen:blit(rock.x,rock.y, rock.img)
  screen:print(380,10,"Score :" ..player.score,Color.new(25,200,0))

  screen.waitVblankStart()
  screen.flip()
end