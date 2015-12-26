//aWin, bWin : show, A, B win
//showBlock : show gameboard
//showQuaz
//menu
//hexChange
//SHA-256
//help
void menu() {
  statemod=0;

  //stroke of menu
  noStroke();
  fill(244, 244, 244);
  rect(32, 18, 48, height-36);
  fill(200);
  rect(48, 18, width-87, height-36);

  //exit button of menu
  fill(251, 73, 72);
  ellipse(40, 32, 12, 12);
  if (mouseX>=32 && mouseX<=48 && mouseY>=18 && mouseY <=46) {
    stroke(0);
    strokeWeight(1);
    line(37, 29, 43, 35);
    line(43, 29, 37, 35);
    if (click==1) {
      escmod=-1;
      gmod = -gmod;
    }
  }

  //main menu
  noStroke();
  fill(231, 233, 227);
  rect(48, 27, width-96, height-54);
  switch(menuKind) {
  case 0:
    fill(255, 159, 113);
    rect(48, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("info", width/8+36, 57);
    image(quodIcon, width/2, 170, 130, 130);
    text("quod v0.6.0b2 BUILD55", width/2, 265);
    image(mileuIcon, width/2, 370, 130, 130);
    text("software by mileu, seungwonpark", width/2, 480);
    text("visit 'mileu.ml' for more information", width/2, 550);
    upmenuButton();
    break;

  case 1:
    fill(255, 159, 113);
    rect(width/4+24, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("display", width*3/8+12, 57);

    textAlign(LEFT, CENTER);
    text("resolution", 80, 130);
    text(Settings[0], 320, 130);
    text("X", 390, 130);
    text(Settings[1], 420, 130);

    upmenuButton();
    break;

  case 2:
    fill(255, 159, 113);
    rect(width/2, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/4*3-24, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("sound", width*5/8-12, 57);

    textAlign(LEFT, CENTER);
    text("music sound", 80, 130);
    text(Settings[5], 320, 130);

    upmenuButton();
    break;

  case 3:
    fill(255, 159, 113);
    rect(width/4*3-24, 27, width/4-24, 60);
    fill(255, 198, 117);
    rect(48, 27, width/4-24, 60);
    rect(width/4+24, 27, width/4-24, 60);
    rect(width/2, 27, width/4-24, 60);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0);
    text("network", width*7/8-36, 57);

    textAlign(LEFT, CENTER);
    text("server IP", 80, 130);
    text(Settings[2], 350, 130);
    text("server PORT", 80, 200);
    text(Settings[3], 350, 200);

    if (mouseX > 340&& mouseX < 500 && mouseY > 110 && mouseY < 160) {
      fill(231, 233, 227);
      rect(340, 110, 160, 50);
      fill(255, 0, 0);
      textAlign(LEFT, CENTER);
      text(Settings[2], 350, 130);
      inputmod = 4010;
    }

    upmenuButton();
    break;
  }
}

void upmenuButton() {
  textAlign(CENTER, CENTER);
  if (mouseY<=87&&mouseY>=27) {
    if (mouseX>=48&&mouseX<=width/4+24) {
      fill(0);
      text("info", width/8+36, 57);
      if (click==1) menuKind=0;
    } else if (mouseX>=width/4+24&&mouseX<=width/2) {
      fill(0);
      text("display", width*3/8+12, 57);
      if (click==1) menuKind=1;
    } else if (mouseX>=width/2&&mouseX<=width*3/4-24) {
      fill(0);
      text("sound", width*5/8-12, 57);
      if (click==1) menuKind=2;
    } else if (mouseX>=width*3/4-24&&mouseX<width-48) {
      fill(0);
      text("network", width*7/8-36, 57);
      if (click==1) menuKind=3;
    }
  }
}

void showBlock() {
  int i, j;
  fill(255);
  noStroke();
  rect(248, 0, 640, 640); //game display
  for (i=1; i<12; i++) { //show block!
    for (j=1; j<12; j++) {
      fill(255);
      if (blk[i][j]==1) fill(103, 212, 136); 
      else if (blk[i][j]==2) fill(255, 0, 0);
      else if (blk[i][j]==3) fill(0, 0, 255);
      rect(204+i*57, -44+j*57, 44, 44);
    }
  }
  fill(255);
  rect(204+lastBlockX*57, -44+lastBlockY*57, 44, 44);
  if (blk[lastBlockX][lastBlockY]==2) fill(255, 0, 0);
  else fill(0, 0, 255);
  rect(204+lastBlockX*57, -44+lastBlockY*57, 44, 44, 11);
}

void showQuaz() {
  if (quazA>0) {
    fill(255, 227, 212);
    rect(0, 220, 248, 40);
  }
  if (quazA>1) {
    fill(255, 212, 194);
    rect(0, 270, 248, 40);
  }
  if (quazA>2) {
    fill(255, 197, 188);
    rect(0, 320, 248, 40);
  }
  if (quazA>3) {
    fill(255, 163, 162);
    rect(0, 370, 248, 40);
  }
  if (quazA>4) {
    fill(231, 94, 90);
    rect(0, 420, 248, 40);
  }
  if (quazA>5) {
    fill(187, 62, 69);
    rect(0, 470, 248, 40);
  }

  if (quazB>0) {
    fill(212, 163, 110);
    rect(888, 220, 248, 40);
  }
  if (quazB>1) {
    fill(196, 132, 85);
    rect(888, 270, 248, 40);
  }
  if (quazB>2) {
    fill(156, 97, 71);
    rect(888, 320, 248, 40);
  }
  if (quazB>3) {
    fill(131, 88, 74);
    rect(888, 370, 248, 40);
  }
  if (quazB>4) {
    fill(110, 76, 68);
    rect(888, 420, 248, 40);
  }
  if (quazB>5) {
    fill(79, 69, 64);
    rect(888, 470, 248, 40);
  }
}

void aWin() {

  fill(255);
  noStroke();
  rect(0, 0, 248, 640);
  fill(255, 0, 0);

  if (loginID.equals(" ")) text("A win!!", 124, 300);
  else {
    text(loginID + " win!!", 124, 300);
  }

  fill(193, 243, 214);     
  rect(0, 540, 248, 100); 
  textSize(60);
  fill(0);     
  text("Replay?", 124, 590);

  fill(193, 243, 214);     
  rect(0, 640, 248, 100); 
  textSize(60);
  fill(0);     
  text("Main Menu", 124, 690);

  if (click==1&&mouseX<248&&mouseY>540) {
    gmod=-200;
    reset();
  }
}

void bWin() {

  fill(255);
  noStroke();
  rect(888, 0, 248, 640);
  fill(0, 0, 255);
  if (enemyID.equals(" ")) text("B win!!", 1012, 300);
  else {
    text(enemyID+" wins!!", 1012, 300);
  }


  fill(193, 243, 214);     
  rect(888, 540, 248, 100);
  textSize(60);
  fill(0);     
  text("Replay?", 1012, 590);

  if (click==1&&mouseX>888&&mouseY>540) {
    gmod=-200;
    reset();
  }
}

void reset() {
  lastBlockX=0;
  lastBlockY=0;
  statemod=1;
  //block setting
  int i, j;
  for (i=1; i<12; i++)
    for (j=1; j<12; j++)
      blk[i][j]=1;
  // 4 corner of quod is blank
  blk[1][1]=0;
  blk[1][11]=0;
  blk[11][1]=0;
  blk[11][11]=0;


  //time left pannel x,y-coordinate
  timeAx=124;
  timeAy=130;
  timeBx=1012;
  timeBy=130;

  timeCache=0;//time cache, for click delay

  quazA=6;
  quazB=6;
  click=0;
  gmod=-200;
  turn=-1;
}

void readText() {
  int i=0;
  int readableCache=1;
  while (readableCache==1) {

    try {
      Settings[i] = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      Settings[i] = null;
    }
    if (Settings[i] == null) readableCache=0;
    i++;
  }
}

void indexText() {
  int i=0;
  while (Settings[i]!=null) {
    String indexTextCache[] = split(Settings[i], ":");
    Settings[i]=trim(indexTextCache[1]);
    i++;
  }
}

//change byte[] to string, for sha/aes
String hexChange(byte[] message) {
  String messageString="";
  for (int i=0; i<message.length; i++) messageString+=(hex(message[i], 2));
  messageString = messageString.toLowerCase();
  return messageString;
}
//SHA-256
byte[] messageDigest(String message, String algorithm) {
  try {
    java.security.MessageDigest md = java.security.MessageDigest.getInstance(algorithm);
    md.update(message.getBytes());
    return md.digest();
  } 
  catch(java.security.NoSuchAlgorithmException e) {
    return null;
  }
}

void help() {

  background(243, 241, 228);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("help", width/2, 200);
  textSize(70);
  text("visit 'mileu.ml'", width/2, 350);
  fill(241, 232, 212);
  rect(width/2-140, 460, 280, 70);

  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(255, 206, 160);
    if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }

  fill(0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("Back", width/2, 495);
}

void ThinkDifferent() {
  log.flush();
  log.close();
  exit();
}