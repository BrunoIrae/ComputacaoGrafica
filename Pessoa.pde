class Pessoa {
  float personX;
  float personY;
  float size;
  float targetX;
  float targetY;
  float speed;
  boolean hidden;
  float irisX1;
  float irisX2;
  float eyeY;
  float eyeSize;
  float irisSize;

  Pessoa() {
    personX = 225;
    personY = 250;
    size = 30;
    targetX = 0;
    targetY = 250;
    speed = 1;
    hidden = false;
    eyeY = personY - 12.5;
    eyeSize = 10;
    irisSize = 5;
    irisX1 = personX - 8;
    irisX2 = personX + 8;
  }

  void display() {
    if (!hidden) {
      fill(255, 153, 153);
      stroke(0);
      rect(personX, personY, 25, 38);
      float headSize = 38;
      float headX = personX + 12.5;
      float headY = personY - 12.5;
      ellipse(headX, headY, headSize, headSize);

      fill(255);
      ellipse(personX - 8, eyeY, eyeSize, eyeSize);
      ellipse(personX + 8, eyeY, eyeSize, eyeSize);

      fill(0);
      ellipse(irisX1, eyeY, irisSize, irisSize);
      ellipse(irisX2, eyeY, irisSize, irisSize);

      // Desenha os pés
      float feetY = personY + 38;
      line(personX, feetY, personX - 10, feetY + 10);
      line(personX + 25, feetY, personX + 35, feetY + 10);

      // Desenha os braços
      float armsY = personY + 10;
      line(personX, armsY, personX - 10, armsY + 10);
      line(personX + 25, armsY, personX + 35, armsY + 10);
    }
  }

  void move() {
    if (leftPressed) {
      personX = max(personX - 5, size / 2);
    }
    if (rightPressed) {
      personX = min(personX + 5, width - size / 2);
    }

    irisX1 = map(mouseX, 0, width, personX - 13, personX - 3);
    irisX2 = map(mouseX, 0, width, personX + 3, personX + 13);
  }

  float getX() {
    return personX;
  }

  float getY() {
    return personY;
  }

  void hide() {
    hidden = true;
  }

  void show() {
    hidden = false;
  }
}
