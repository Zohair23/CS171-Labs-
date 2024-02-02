// Topic 3 - Lab 3
// A game to demonstrate probabilities for small numbers.

// Declaring our variables.
// Here we declare variables which will control our whole program.

// To translate our game into a simple scheme and strategy we will 
// employ the following approach: 
/*
colour = Name of colour
0 = Orange, 
1 = Green, 
2 = Blue, 
3 = White 

Orange guess from user = O or o key
Green guess from user = G or g key
Blue guess from user = B or b key
White guess from user = W or w key
Exit and restart the game = X or x 
No other key is recognised. 
*/
int guesses = 0; // the number of guesses the user currently has made
int correct = 0; // the number of correct guesses the user currently has made
boolean stop = false; // the status of the game is stopped (currently false)
boolean validKey = false; // this boolean variable indicates if the user has typed
// a valid key on the keyboard.

int userGuess = -1; // what is the 'value' of the user guess? Currently -1 as the user
// has not made any guesses.

void setup()
{
  size(1000, 400);
  textSize(40);
  background(0, 0, 0);  // black background
  // fill your name and student number in here
  surface.setTitle("Meer Akbar Zohair Moosavi, 22925002");
}

//***********************************************//
void draw()
{
  // if there are no guesses so far. 
  // Then we wipe the panel and start again. 
  // this starts a new game. 
  if (guesses == 0)
  {
    background(0, 0, 0); // black
    fill(255, 255, 255); // white
    text("Game ready", 50, 50);
    text("Type your first guess now ", 50, 100);
    stop = false; // game status is stop = false
    correct = 0; // no correct answers
    validKey = false; // no valid keys typed yet. 
  }

  // the user has used all of their guesses. 
  if (guesses == 4)
  {
    fill(255, 255, 255); // white
    text("Game over", 50, 50);
    text("Correct answers = " + correct, 50, 100);
    
    // let's write out some comments to the user. 
    if (correct == 4)
    {
      text("All correct! AMAZING!", 500, 100);
    }

    if (correct == 3)
    {
      text("3 out of 4 - that's very good!", 500, 100);
    }
 
    if (correct == 2)
    {
      text("2 out of 4 - that's 50-50", 500, 100);
    }    
 
    if (correct <= 1)
    {
      text("Better luck next try", 500, 100);
    }    
    
    stop = true; // game status is stop = true (it is stopped)
    validKey = false; // no valid keys typed (as the game is stopped).
  }
  saveFrame("game.png");
}
//***********************************************//
// keyTyped() is a function provided by Processing
// Everytime a key is typed or pressed by the user
// this function is executed or invoked. 
//***********************************************//

void keyTyped()
{
  // The x or X key will stop and restart the game
  
  if ((key == 'x') || (key == 'X'))
  {
    guesses = 0; // reset guesses 
    stop = true; // // game status is stop = true (it is stopped)  
    correct = 0; // user has zero correct answers 
    validKey = false; // no valid keys typed (as the game is stopped). 
  } else   // the user must have typed a different key to x or X
  {
    // if the game is not stopped AND the number of guesses is 0,1,2,3 
    // then we will see what other key the user might have pressed or 
    // typed into the game 
    
    if ((stop == false) && (guesses < 4))
    {

      // user has typed the O or o key 
      if ((key == 'O') || (key == 'o')) {
        guesses++; // add 1 to the number of guesses 
        validKey = true; // this is a valid key 
        println("User selects Orange");
        userGuess = 0;// let's store the userGuess as 0 (refer to our game code above)
        
      } else if ((key == 'G') || (key == 'g')) {
        guesses++; // add 1 to the number of guesses
        validKey = true; // this is a valid key 
        println("User selects green");
        userGuess = 1; // let's store the userGuess as 1 (refer to our game code above)

      } else if ((key == 'B') || (key == 'b')) {
        guesses++; // add 1 to the number of guesses
        validKey = true; // this is a valid key 
        println("User selects blue");
        userGuess = 2; // let's store the userGuess as 2 (refer to our game code above)

      } else if ((key == 'W') || (key == 'w')) {
        guesses++; // add 1 to the number of guesses
        validKey = true; // this is a valid key 
        println("User selects white");        
        userGuess = 3; // let's store the userGuess as 3 (refer to our game code above)

      } else  // the user has pressed a key other than O,o,W,w,B,b,G,g 
      {
        validKey = false; // because an invalid key has been typed. 
      }

      if (validKey == true) // only play if there is a validKey pressed above  
      {

        // The computer game now generates a choice of random color
        //refer to our game code above
        int colour = pickRandomColor();
        
        // This if statement simply tells processing which colour to 
        // fill in the circle we will draw
        if (colour == 0)
        {
          fill(255, 164, 0); // orange
        } else if (colour == 1)
        {
          fill(0, 255, 0); //green
        } else if (colour == 2)
        {
          fill(0, 0, 255); //blue
        } else
        {
          fill(255, 255, 255); // white
        }

        // This if statement simply draws our circle
        // and fills in the colour choice from Processing. 
        // This if statement decides where to place the circle.
        // 1st guess (left)
        if (guesses == 1)
        {
          background(0, 0, 0);
          circle(width*0.2, height/2, 100);
        }
        if (guesses == 2)  // 2nd guess
        {
          circle(width*0.4, height/2, 100);
        }
        if (guesses == 3)
        {
          circle(width*0.6, height/2, 100); // 3rd guess
        }

        if (guesses == 4) // 4th guess (right)
        {
          circle(width*0.8, height/2, 100);
        }
        
        // let's see if the user has guessed correctly!
        // Remember their key pressed should correspond to the 
        // colour choice generated randomly by Processing 
        if (userGuess == colour) {
          correct++;
          println("User guessed CORRECTLY!");
        } else
        {
          println("User guessed INCORRECTLY");
        }        
        
      }// if statement closing for the valid key check
    } // if statemet closing for stop and guesses 
  } // else closing for any key except for x or X. 
} // keyTyped function closes 


//***********************************************//
// pickRandomColor() is a function written by us the programmer
// Study this function carefully. 
// The function generates random numbers
// Then this random number is connected to a colour choice. 
// In the original program we have four colours 
// orange, blue, green and white. 
// In the initial code we use random(0,100) to generate a random 
// number between 0 and 100;
//***********************************************//

int pickRandomColor()
{
  int randomNumber = (int)randomGaussian()*10;

  int colour = 0;

  if ((randomNumber >= 0) && (randomNumber < 50))
  {
    colour = 0; // orange
    println("Computer selects orange");
  } else if ((randomNumber >= 50) && (randomNumber <= 100))
  {
    colour = 1; // green
    println("Computer selects green");
  } else if ((randomNumber > 100) && (randomNumber <= 125))
  {
    colour = 2; // blue
    println("Computer selects blue");
  } else
  {
    colour = 3; // white
    println("Computer selects white");
  }

  return colour;
}
