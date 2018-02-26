class Box{
  int x;
  int y;
  int mo;
  float rot;
  float velo;
  float d;
  boolean sqz;
  boolean rst;
  int co;
  Box(int _x, int _y)
  {
    x = _x;
    y = _y;
    rot = 0.0;
    velo = 0.0;
    sqz = false;
    rst = true;
    mo = 0;
    co = 0;
  }
  void setR(float b)
  {
    b = b * 2;
    b -= 1;
    if(b > 0.2 || b < -0.2)
    {
      rot += b * 0.1;
    }
  }
  void movF()
  {
    x += floor(cos(rot) * velo);
    y += floor(sin(rot) * velo);
    if(x > WIDTH)
    {
      x = 0;
    }
    if(x < 0)
    {
      x = WIDTH;
    }
    if(y > HEIGHT)
    {
      y = 0;
    }
    if(y < 0)
    {
      y = HEIGHT;
    }
  }
  void decel()
  {
    //println(d);
    if(velo > 0)
    {
      velo -= d;
    }
    else if(velo < 0)
    {
      velo = 0;
    }
    if(d > 0.02)
    {
      d -= d/8;
    }
  }
  void squeeze()
  {
    if(velo < 16.0)
    {
      velo += 4;
      d = velo/10;
    }
    
  }
  int update(int a, float b)
  {
    println(velo);
    if(sqz && rst)
    {
      squeeze();
      rst = false;
    }
    else
    {
      //decel();
    }
    if(a == 1)
    {
      sqz = true;
      co = 0;
    }
    else if(a == 2)
    {
      sqz = false;
      rst = true; 
      co = 0;
    }
    else if(a == 3)
    {
      co += 1;
      if(co == 10)
      {
        velo = 0.0;
        co = 0;
      }
    }
    setR(b);
    //decel();
    if(mo == 3){
      movF();
      mo = 0;
      decel();
    }
    else
    {
      mo += 1;
    }
    return x;
  }
  int show()
  {
    pushMatrix();
    fill(255,0,0);   
    noStroke();
    translate(x,y);
    rotate(rot);
    rect(0,0,30,30, 0, 55, 55, 0);
    popMatrix();
    return y;
  }
}