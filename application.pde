float gravity,terminalVelocity;

ArrayList balls = new ArrayList();
void setup()
{
  size(500,500);
  gravity = 3;
  terminalVelocity = 40;
}

void draw()
{
  
  background(123);
  
  for(int i = 0; i < balls.size(); i++)
  {
    Ball ball = (Ball)balls.get(i);
    ball.Update();
  }
}

class Ball
{
  int x,y,ballSize;
  float velY;
  
  public Ball(int _x, int _y)
  {
    ballSize = 20;
    
    x=_x;
    y=_y;
  }
  
  public void Update()
  {
    velY-=gravity;
    y-=velY;
    if(y-ballSize>height){y=height-ballSize; velY *= -1;}
    ellipse(x,y,ballSize,ballSize);
  }
}

void touchStart(TouchEvent touchEvent)
{
  int newX = touchEvent.touches[i].offsetX; int newY = touchEvent.touches[i].offsetY;
  balls.add(new Ball(newX,newY));
}