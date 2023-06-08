class Casa {
  float x;
  float y;
  float largura;
  float altura;
  float doorX;
  float doorY;
  float doorWidth;
  boolean doorOpen;

  Casa() {
    x = 50;
    y = 200;
    largura = 100;
    altura = 100;
    doorX = 25;
    doorY = 50;
    doorWidth = 50;
    doorOpen = false;
  }

  void display() {
    fill(255, 255, 153);
    stroke(0);
    rect(x, y, largura, altura);
    fill(102, 51, 0);
    triangle(x, y, x + largura / 2, y - altura / 2, x + largura, y);
    noStroke();
    int stripeWidth = 10;
    for (int i = 0; i < altura; i += stripeWidth) {
      if (i % (stripeWidth * 2) == 0) {
        fill(255);
      } else {
        fill(255, 255, 153);
      }
      rect(x, y + i, largura, stripeWidth);
    }
    if (doorOpen) {
      fill(255, 0, 0);
    } else {
      fill(192, 192, 192);
    }
    rect(x + doorX, y + doorY, doorWidth, doorWidth);
  }

void increaseSize(float increment) {
  if (!doorOpen) {
    float incrementHalf = increment / 2;
    float proporcaoX = doorX / largura;
    float proporcaoY = doorY / altura;
    
    x -= incrementHalf;
    y -= incrementHalf;
    largura += increment;
    altura += increment;
    
    doorX = largura * proporcaoX;
    doorY = altura * proporcaoY;
  }
}

  void openDoor() {
    doorOpen = true;
  }

  void closeDoor() {
    doorOpen = false;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getDoorX() {
    return doorX;
  }

  float getDoorY() {
    return doorY;
  }

  float getDoorWidth() {
    return doorWidth;
  }

  boolean isDoorOpen() {
    return doorOpen;
  }
}
