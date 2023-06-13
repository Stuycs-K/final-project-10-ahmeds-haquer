# Work Log

## Sadat Ahmed

### 5/22/23
Started designing the Tube class and added all of the instance variables including an array named tube and three int variables as capacity, numBalls, and ballsTransferred.

### 5/23/23
Wrote the Tube constructors. One has the parameter, size, which allows the program to construct a Tube with a capacity of size. The other constructor is a parameterless constructor Altered the fill method, empty method, transfer method, and the necessary helper methods. The helper methods added to and removed from a Tube, making the fill, remove, and transfer methods easier to implement.

### 5/24/23
Fixed the errors with the Tube constructor and texted it extensively. The balls were not properly put in the Tube.

### 5/25/23
Solved merge conflicts. Began working on solve on Atom. Finished a first draft, but did not account for possibility of no solution.

### 5/26/23
Finished solve. Added two helper methods, one that finds the GCD of two numbers using Euclid's algorithm and another that checks if there is a solution. For homework from the day before, I did it during a free period and wrote the helper methods. I cleaned it up and finished up the solve code.

### 5/29/23
Added solve onto processing, and made necessary changes for it to work there. There is still some trouble showing the actual steps and the program runs into errors.

### 5/30/23
Worked on fixing merge conflicts and discussed future of project in class. Decided not to include solve in the demo because it is too complex and the errors are hard to understand.

### 5/31/23
Fixed merge conflicts, fixed the transfer method in the Tube class along with fill and empty. Fixed a few bugs to allow for the screen to display. Was absent today so did all of the work in one sitting at home.

### 6/1/23
Debugged transfer because there was a bug again because sometimes it transferred when it didn't have to. The transfer method did not always empty a tube when transferring. Added a VICTORY mode that resets the game. Also fixed the random  tube generator to choose two different tubes. Played through the game one time and it worked.

### 06/07/23
Worked using logic to debug the infinite recursion that occurred with solve(). The problem was that the solve method always filled the first tube rather than filling it only when empty.

### 6/9/23
Changed solve to work in all cases. Fixed ifPossible because it prevented users from clicking the number 7. Created a victory page. Created a way to restart the game.

### 6/10/23
Updated README. Changed the numSelect screen to put the different numbers in circles so it could be more like the actual screen in MoMath. Fixed spacing for text in numSelect mode and un the drawEmptier method. Worked on victory screen.

### 6/11/23
Updated README. Added sound to the game to make it more interested. Added an instructions button with a new page that outlined instructions. Added an image to the victory page using PImage. Slowed down solve to show the process happening. Did this using countdown variables that illustrated each step.

## Ramisa Haque

### 5/22/23
Wrote empty() and fill() methods for the Tube class.

### 5/23/23

### 5/24/23
Wrote an outline for the Mind Over Measure class (with methods); paper diagrams to design the specific aspects.

### 5/25/23
Wrote randomizeTube method, wrote methods to account for the differences in drawing of capped tubes, empty station (tube obj), and fill station (also tube obj).

### 5/26/23
Implemented the visual aspects of transfer, empty, and fill to allow user the updated state of the game per time.

### 5/27/23 - 5/29/23
Added states to keep track of user decisions; implemented keyPressed() to use user input accordingly. Added text prompts to guide user (including invalid input). Implemented mouseClicked() to determine user input and included data to enhance features of keyPressed().

### 5/30/23
Fixed merge conflicts and made sure branches were properly updated. Added new states to the game to keep better track of user decisions as well as more variables to hold such data. Improved implementation of user-prompted transfer to account for ALL exceptions (making sure only correct/possible user input is accepted).

### 5/31/23
Organized code to flow more logically. Debugged (a lot) due to logical errors. Implemented initial interface of the game. Completed implementations of fill and empty (with accompanying visuals), transfer implementation nearly complete, but not quite as intended. Added even more instance variables to keep track of specifics and enhance the flow of the game. Also, added a few on-screen text elements for better UX.

### 06/01/23
Fixed all text to remain on screen for an appropriate amount of time. Made minor changes/rewrites to codes to simplify and minimize memory/maximize efficiency. Added forfeit mode.

### 06/07/23
Worked through logic to debug the infinite recursion that occurred with solve().

### 06/09/23
Created Button class, implemented a home screen.

### 06/10/23
Home button and worked on a simulator mode (didn't make it into the final) and victory mode/screen. Added a couple visuals throughout the game.

## Working Features
  - Instructions button: if you click on it, it takes you to a page with instructions that also tells you how to start the game.
  - Play button: takes you to a screen that allows you to use keys to select the number of balls. There is text on this screen as well. keyPressed() is used to make sure that the number is chosen; there are error messages if the wrong key is clicked.
  - Two randomized tubes are highlighted and they were chosen randomly using the generateCapacities() method. This method avoided two tubes that would not have a solution with the chosen number.
  - Fill mode: If you click 'f' or 'F' you enter fill mode and you can fill a tube that you click on using the mouse. If you choose a tube that is not designated, you get an error message. This method fills the tube to the top.
  - Empty mode: If you click 'e' or 'E' you enter empty mode and you can empty a tube that you click on using the mouse. If you choose a tube that is not designated, you get an error message. This method empties the tube to the bottom.
  - Transfer mode: If you click on 't' or 'T' you enter transfer mode and you can transfer balls from one tube to another. You click the tube that you want to transfer from and if you choose a tube that is not designated, you get an error message. The transfer method transfers all of the balls that are in the tube you want to transfer from into the other tube as long as there is space. 
  - Restart button: If you press the restart button, it takes you back to the screen where you choose a number. You may also select 'r' or 'R' to restart.
  - Forfeit mode: if you click 's' or 'S' the solver method is called and using countdown, it carefully shows you the solution to the problem. Every five seconds, the next step in the algorithm occurs.
  - Victory mode; if you end up with a tube with the chosen number of balls, you get taken to a screen displaying a victory message. You are given the choice to type 'r' or 'R' to restart.
  - Sound; there is background music as well as sound effects when you click a number in the numSelect page, when you call any of the Tube methods, and when you solve the problem. \
  - PImage; There is a background image in the victory page.
## Broken Features/bugs
  - Sometimes, when you click on one tube, it empties the other because it does not register the click well. This is a bug that we were not able to fix.
  - Sometimes the program stops registering clicks when you use your mouse to click on tubes. This is a bug we were not able to fix.
  - Eventually the music stops because we only call it once. This is not really a bug; it is just a flaw.
  - When you click a key apart from the numbers in the numSelect page, the text alignment changes in a bad way.
## Content Resources
  - Processing documentation; this helped us use different methods and understand how they work.
  - John McCaffrey YouTube; he created a video that taught us how to add sound to a processing project using a Sound library. This helped us use sound.
  - konstantinnovation.github.io; this helped us use the countdown variables and it gave us the general basis for all of our programming knowledge.
  - w3schools.com; this helped us understand how to use color and use some of the methods.
