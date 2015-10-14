//statM : start menu
//loadS : load screne

void loadS1() {
  statemod=1;

  background(184, 241, 241);
  fill(23, 93, 126);
  textSize(120);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  textSize(48);
  fill(0);
  textAlign(CENTER, BOTTOM);
  text("click to start", width/2, height-10);

  //set loadS2
  gmod = -gmod;
}
void loadS2() {
  statemod=1;

  noStroke();
  fill(184, 241, 241);
  rect(45, 0, 200, 50);
  if (frameCount>48) frameCount=0;
  fill(0, (abs(frameCount-25)%26)*10);
  textSize(40);
  textAlign(LEFT, CENTER);
  text("'TAB' to set", 50, 25);

  if (click == 1) {
    gmod = -200;
    click = 0;
  }
}

void statM1() {
  statemod=1;
  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("Quod", width/2, 120);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Local Play", width/2, 335);
  text("Online Play", width/2, 415);
  text("Help", width/2, 495);

  gmod = - gmod;
}

void statM2() {
  statemod=1;
  noStroke();
  textAlign(CENTER, CENTER);
  fill(255, 206, 160);
  rect(width/2-140, 300, 280, 70);
  rect(width/2-140, 380, 280, 70);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  text("Local Play", width/2, 335);
  text("Online Play", width/2, 415);
  text("Help", width/2, 495);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>300&&mouseY<370) { // Local Play
      rect(width/2-140, 300, 280, 70);
      if (click==1) {
        gmod=-300;
        click=0;
      }
    } else if (mouseY>380&&mouseY<450) { // Online Play
      rect(width/2-140, 380, 280, 70);
      if (myClient.active()==false) {
        myClient = new Client(this, Settings[2], parseInt(Settings[3])); //retry to connect
        if (myClient.active()==false) {
          fill(255, 0, 0);
          textAlign(CENTER, CENTER);
          textSize(24);
          text("server connection fail", width/2, 415);
        }
      } else if (click==1) {
        gmod = -600;
        click=0;
      }
    } else if (mouseY>460&&mouseY<530) { // Help
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=3000;
        click=0;
      }
    }
  }
}