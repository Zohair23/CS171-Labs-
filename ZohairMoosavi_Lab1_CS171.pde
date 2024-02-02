void setup()
{
  size(800,800); // create window
}

void draw()
{
  background(255,255,255); // clear screen
  strokeWeight(5); // line thickness
  line(mouseX+0,mouseY+0,mouseX+0,mouseY+150); // position and dimensions of line
  
  fill(0,236,250); // cyan, boat colour
  quad(mouseX-125,mouseY+150,mouseX+125,mouseY+150,mouseX+50,mouseY+200,mouseX-40,mouseY+200); // position and dimensions of boat
  
  fill(255,250,10); // bright yellow, flag colour
  triangle(mouseX+0,mouseY+0,mouseX+75,mouseY+55,mouseX+0,mouseY+110); // position and dimensions of flag
}
