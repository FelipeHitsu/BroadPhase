int lastTime = 0;
float delta = 0;
Object[] objs;
CircleCollider ccl;

boolean moveUp, moveDown, moveLeft, moveRight;

void setup() {
  objs    = new Object [4];
  objs[0] = new Object(new CircleCollider(1, 20,30, 20));
  objs[1] = new Object(new CircleCollider(1, random(0,350),random(0,350), random(10,30)));
  objs[2] = new Object(new CircleCollider(1, random(0,350),random(0,350), random(10,30)));
  objs[3] = new Object(new CircleCollider(1, random(0,350),random(0,350), random(10,30)));

  frameRate(60);
  size(640, 480);
}

void draw() {
  background(51);
  delta = ((float)millis() - lastTime)/1000.0f ;
  

  if (moveUp)
  {
    objs[0].circleCollider.AddForce(new PVector(0, -10));
  }
  if (moveDown)
  {
    objs[0].circleCollider.AddForce(new PVector(0, 10));
  }
  if (moveLeft)
  {
    objs[0].circleCollider.AddForce(new PVector(-10, 0));
  }
  if (moveRight)
  {
    objs[0].circleCollider.AddForce(new PVector(10, 0));
  }

  for (Object obj : objs)
  {
    obj.Update(delta);
    obj.circleCollider.display();
  }
 
  Block[] blocos = new Block[4];
  blocos[0] = new Block(new Rectangle (0,0,width/2,height/2));
  blocos[1] = new Block(new Rectangle (width/2,0,width/2,height/2));
  blocos[2] = new Block(new Rectangle (width/2,height/2,width/2,height/2));
  blocos[3] = new Block(new Rectangle (0,height/2,width/2,height/2));
  
  for (Object obj : objs)
  {
    for(Block bl : blocos)
    {
      if(bl.Intersect(obj))
      {
        break;
      }
    }
  }
  for(Block bl : blocos)
  {
    bl.tryCollision();
  }

  lastTime = millis();
}

void keyPressed()
{
  if (keyCode == UP)
  {
    moveUp = true;
  }
  if (keyCode == DOWN)
  {
    moveDown = true;
  }
  if (keyCode == LEFT)
  {
    moveLeft = true;
  }
  if (keyCode == RIGHT)
  {
    moveRight = true;
  }
}

void keyReleased() {
  if (keyCode == UP)
  {
    moveUp = false;
  }
  if (keyCode == DOWN)
  {
    moveDown = false;
  }
  if (keyCode == LEFT)
  {
    moveLeft = false;
  }
  if (keyCode == RIGHT)
  {
    moveRight = false;
  }
}
