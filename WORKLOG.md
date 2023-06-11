# Work Log

## Sadat Ahmed

### 5/22/23
Started designing the Tube class and added all of the instance variables
### 5/23/23
Wrote the Tube constructors. Altered the fill method, empty method, transfer method, and the necessary helper methods
### 5/24/23
There were errors with the Tube constructor, so I fixed this and tested it on Atom.
### 5/25/23
Solved merge conflicts. Began working on solve on Atom. Finished a first draft, but did not account for possibility of no solution.

## 5/26/23
Finished solve. Added two helper methods, one that finds the GCD of two numbers using Euclid's algorithm and another that checks if there is a solution. For homework from the day before, I did it during a free period and wrote the helper methods. I cleaned it up and finished up the solve code.
info

## 5/29/23
Added solve onto processing, and made necessary changes for it to work there.

## 5/30/23
Worked on fixing merge conflicts and discussed future of project in class.

## 5/31/23
Fixed merge conflicts, fixed the transfer method in the Tube class along with fill and empty. Fixed a few bugs to allow for the screen to display. Was absent today so did all of the work in one sitting.

## 6/1/23
I debugged transfer because there was a bug again because sometimes it transferred when it didn't have to. I added a VICTORY mode that resets the game. Also fixed the random  tube generator Played through the game one time and it worked.
## 6/9/23
Changed solve to work in all cases. Fixed ifPossible because it prevented users from clicking the number 7. Created a victory page. Created a way to restart.

## 6/10/23
Updated README. Changed the numSelect screen to put the different numbers in circles. Fixed spacing for text in numSelect mode and drawEmptier. Worked on victory screen.
## Ramisa Haque

### 5/22/23
Wrote empty() and fill methods for the Tube class.
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
