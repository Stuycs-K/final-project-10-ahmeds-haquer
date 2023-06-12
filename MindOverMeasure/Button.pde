public class Button {
  private int buttonX, buttonY;
  private int buttonSizeX, buttonSizeY;
  private color buttonColor;
  private color buttonHighlight;
  private color currentColor;
  private boolean hover = false;

  public Button(color og, color highlight, int xpos, int ypos, int sizeX, int sizeY) {
    rect(xpos, ypos, sizeX, sizeY);
    buttonColor = og;
    buttonHighlight = highlight;
    currentColor = og;
    buttonSizeX = sizeX;
    buttonSizeY = sizeY;
    buttonX = xpos;
    buttonY = ypos;
  }

  public boolean isPressed() {
    boolean onIt = false;
    if (mouseX >= buttonX && mouseX <= buttonX + buttonSizeX) {
      if (mouseY >= buttonX && mouseY <= buttonY + buttonSizeY) {
        onIt = true;
      }
    }
    return onIt;
  }

  public void changeColor() {
    if (currentColor == buttonColor) {
      fill(buttonHighlight);
    } else if (currentColor == buttonHighlight) {
      fill(buttonColor);
    }
  }
}
