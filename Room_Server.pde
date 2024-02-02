import processing.net.*;
import java.net.InetAddress;

InetAddress inet;

Server s;
Client c;
String input;
int data[];
int line=0;

void setup() 
{
  size(600, 500);
  background(204);
  textSize(48);
  fill(0);
  s = new Server(this, 12345); // Start a simple server on a port 12345
}

void draw() 
{
  // Receive data from client
  c = s.available();
  if (c != null) 
  {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n")); // Only up to the newline
    
    
String myIP;
  try {
    inet = InetAddress.getLocalHost();
    myIP = inet.getHostAddress();
  }
  catch (Exception e) {
    e.printStackTrace();
    myIP = "couldnt get IP";
  }
  textSize(30);
  text("IP address: "+myIP,290,40);
    
    textSize(50);
    text(input,10,48+48*(line));
    line++;
    if(line==10) {line=0; background(204);}
   
  }
}
