import javax.swing.JOptionPane;
import processing.net.*;

Client c;
String input;
int data[];

void setup() 
{
  size(50, 50);
  background(204);
  c = new Client(this, "192.168.1.53", 12345); // Replace with your IP and port
}

void draw() 
{
  String r = JOptionPane.showInputDialog(null,"1223", "Text input", JOptionPane.QUESTION_MESSAGE);
  c.write(r+"\n");
  
}
