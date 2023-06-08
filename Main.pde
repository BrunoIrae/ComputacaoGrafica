// Variáveis globais
Casa casa;
Pessoa pessoa;
float eyeOffsetX = 12.5; // Deslocamento horizontal dos olhos em relação ao centro do boneco
float eyeOffsetY = -12.5; // Deslocamento vertical dos olhos em relação ao centro do boneco

float personX = 225; // Coordenada X inicial da pessoa
float personY = 250; // Coordenada Y inicial da pessoa

boolean leftPressed = false;
boolean rightPressed = false;

float starRotation = 0;
boolean rotateStar = false;

void setup() {
  size(400, 400);
  casa = new Casa();
  pessoa = new Pessoa();

  // Chama as funções de teclado
  keyPressed();
  keyReleased();
}

void draw() {
  background(135, 206, 235);

  drawRainbow();

  for (int i = 0; i < 200; i += 20) {
    bezier(mouseX - (i / 2.0), 40 + i, 410, 20, 440, 300, 240 - (i / 16.0), 300 + (i / 8.0));
  }

  // Desenha o sol branco no canto superior esquerdo da tela
  fill(255);
  stroke(255);
  ellipse(50, 50, 80, 80);

  // Desenha a grama verde na parte inferior da tela
  fill(50, 205, 50);
  stroke(50, 205, 50);
  rect(0, 300, 400, 100);

  casa.display();
  pessoa.display();

  pessoa.move();

  if (dist(pessoa.getX(), pessoa.getY(), casa.getX() + casa.getDoorX(), casa.getY() + casa.getDoorY()) <= casa.getDoorWidth() && !casa.isDoorOpen()) {
    casa.openDoor();
    pessoa.hide();
    noLoop(); // adicionado comando para parar o loop de desenho
  }

  casa.increaseSize(0.2); // Aumenta o tamanho da casa em 0.5 a cada frame

  // Desenha o sol branco no canto superior esquerdo da tela
  fill(255);
  stroke(255);
  ellipse(50, 50, 80, 80);

  // Desenha a grama verde na parte inferior da tela
  fill(50, 205, 50);
  stroke(50, 205, 50);
  rect(0, 300, 400, 100);

  // Desenha a estrela amarela no canto superior direito da tela
  pushMatrix();
  translate(350, 50);

  if (rotateStar) {
    starRotation += 0.02;
    rotate(starRotation);
  }

  fill(255, 255, 0);
  stroke(255, 255, 0);
  star(0, 0, 20, 40, 5);
  popMatrix();
}

void drawRainbow() {
  color[] rainbowColors = {color(255, 0, 0), color(255, 165, 0), color(255, 255, 0), color(0, 128, 0), color(0, 0, 255), color(75, 0, 130), color(238, 130, 238)};

  float rainbowHeight = 30; // Altura do arco-íris
  float rainbowWidth = width; // Largura do arco-íris (largura da janela)

  float rainbowX = 0; // Posição X inicial do arco-íris
  float rainbowY = 0; // Posição Y do arco-íris

  for (int i = 0; i < rainbowColors.length; i++) {
    fill(rainbowColors[i]);
    arc(rainbowX, rainbowY, rainbowWidth, rainbowHeight, PI, 0);

    rainbowY += rainbowHeight; // Incrementa a posição Y para desenhar o próximo segmento abaixo do anterior
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    leftPressed = true;
  } else if (keyCode == RIGHT) {
    rightPressed = true;
  } else if (key == 'g' || key == 'G') {
    rotateStar = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  } else if (keyCode == RIGHT) {
    rightPressed = false;
  } else if (key == 'g' || key == 'G') {
    rotateStar = false;
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle / 2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a + halfAngle) * radius1;
    sy = y + sin(a + halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
