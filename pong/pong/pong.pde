int base = 10;
int wallWidth = 10;  // Controls the width of the wall when it is drawn
int timeCount = 0;   // Controls a time delay for the downward movement of the top wall
float x,y,gameScore=0; // x,y for the ball
float wallX,wallY,changeWallY = 0; // x,y for the moving wall
float changeX=-5;  // control the movement of the ball
float changeY=-5;
int gameOver=0;
float Multiplier=1.0;
int gameLevel=1;

// Runs once at the start of the game to set up any variables
void setup()
{
  size(760, 640);
  x=(int)random(width);
  y=height-base;
  changeWallY = 0.5;
  
}

// Method called repreatedly to redraw the game screen
void draw()
{
  timeCount += 1;
  if(gameOver==0) // If the game is running...
  {
  background(209,157,44); 
  text("LEVEL "+gameLevel,width/2,height/2-50);
  text("SCORE "+gameScore,width/2,height/2);
  stroke(51,149,24);
  fill(51,149,24);
  
  /* Draw the arena */
  // Top wall
  rect(0,0,width,wallWidth);
  // Left wall
  rect(0,0,wallWidth,height);
  // Right wall
  rect(width - wallWidth,0,width,height);
  
  /* Now draw the moving components */
  // Moving wall
  rect(wallX,wallY,width,wallWidth);
  // Bat - the x position is controled by the mouse position
  rect(mouseX,height-base,100,wallWidth);
  // Ball
  ellipse(x,y,10,10);
  stroke(0);
  fill(0);
  
  // Move the ball position for drawing next time
  x=x+changeX;
  y=y+changeY;
  
  // Put a delay in moving the wall down
  // Only move the top wall down if the count
  // is divisible by 20
  // Also stop the wall moving so it doesn't
  // Fall through the floor
  if (timeCount%20 == 0 && timeCount < 400)
  {
    wallY = wallY + changeWallY;
  }
  
  // If the ball hits a side wall, reverse its direction in the
  // x plane
  if(x<0 | x>width)
  {
    changeX=-changeX;
  }
  
  // If the ball hits the top wall, change
  // its direction in the y plane
  if (y < wallY)
  {
      changeY=-changeY; //bounce back
      gameScore++;
      if((gameScore%3)==0)
      {
        changeX=Multiplier*changeX;
        changeY=Multiplier*changeY;
        gameLevel++;
      }
  }


  if(y>height-base)  {
    // If the ball hits the bat, reverse its direction in the y plane
    if(x>mouseX && x<mouseX+200)    {
      changeY=-changeY; //bounce back
      gameScore++;
      if((gameScore%3)==0)
      {
        changeX=Multiplier*changeX;
        changeY=Multiplier*changeY;
        gameLevel++;
      }
    }else{
      // If the ball goes past the bat, finish the game
      gameOverSplash();
    }
  }
  }
  else  {
    background(100,100,200);
    text("Game Over! Your Score: "+gameScore,width/2-150,height/2);

  }}
void gameOverSplash()
{
  gameOver=1;
}

// Mouse clicked event handler used to start the game
void mouseClicked()
{
  changeY=-changeY;
  gameScore=0;
  gameLevel=1;
  gameOver=0;
}