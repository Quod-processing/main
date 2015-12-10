//chkQd : check if there is quod, if yes : 0, no : 1;
//state
void state() {
  //settings
  noStroke();
  fill(243, 241, 228);
  rect(1000, 25, 136, 60);
  shape(settingsIcon, 10, 10, 30, 30);
  if (gmod != 100){
    rect(50, 10, 85, 30);
  }
  if (mouseX>0 && mouseX<=50 && mouseY>0 && mouseY<=50) {
    textAlign(LEFT, CENTER);
    textSize(30);
    fill(0);
    text("settings", 50, 25);
    if (click==1) escmod = 0;
  }

  //server state
  textAlign(RIGHT, CENTER);
  textSize(30);
  fill(0);
  text("server", width-30, 40);
  stroke(255);
  strokeWeight(3);
  if (serverstate==1 && myClient.active()==true) fill(0, 255, 0);
  else {
    fill(0);
    text("reconnect", width-20, 65);
    if (mouseX>width-140 && mouseX<width-10 && mouseY>30 && mouseY<80) {
      text("?", width-10, 65);
      if (click==1) {
        thread("connectServer"); //retry to connect
      }
    }
    fill(255, 0, 0);
  }
  ellipse(width-20, 40, 20, 20);
}

void chkQd(int aorb) {
  int i, j, k, l;
  int round=0;
  noStroke();
  for (i=1; i<12; i++) { //show block!
    for (j=1; j<12; j++) {
      if (blk[i][j]==1) {
        fill(103, 212, 136); 
        rect(204+i*57, -44+j*57, 44, 44);
      } else if (blk[i][j]==2) {
        fill(255, 0, 0);
        round=0;
        if (i==lastBlockX&&j==lastBlockY) round=44/4;
        rect(204+i*57, -44+j*57, 44, 44, round);
      } else if (blk[i][j]==3) {
        fill(0, 0, 255);
        round=0;
        if (i==lastBlockX&&j==lastBlockY) round=44/4;
        rect(204+i*57, -44+j*57, 44, 44, round);
      }
    }
  }

  if (aorb==0) {
    stroke(255, 0, 0);
  }
  if (aorb==1) {
    stroke(0, 0, 255);
  }

  strokeWeight(5);

  //check quod in player A
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==2&&blk[i-j+l][i+j-k]==2&&blk[l+k-j][l-k+i]==2) {
                line(226+i*57, -22+j*57, 226+k*57, -22+l*57);
                line(226+k*57, -22+l*57, 226+(l+k-j)*57, -22+(l-k+i)*57);
                line(226+(l+k-j)*57, -22+(l-k+i)*57, 226+(i-j+l)*57, -22+(i+j-k)*57);
                line(226+(i-j+l)*57, -22+(i+j-k)*57, 226+i*57, -22+j*57);
                if(aorb == 0) gmod = 1000;
                else gmod = 2000;
              }
            }
          }
        }
      }
    }
  }

  //check quod in player B
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==3) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==3&&blk[i-j+l][i+j-k]==3&&blk[l+k-j][l-k+i]==3) {
                line(226+i*57, -22+j*57, 226+k*57, -22+l*57);
                line(226+k*57, -22+l*57, 226+(l+k-j)*57, -22+(l-k+i)*57);
                line(226+(l+k-j)*57, -22+(l-k+i)*57, 226+(i-j+l)*57, -22+(i+j-k)*57);
                line(226+(i-j+l)*57, -22+(i+j-k)*57, 226+i*57, -22+j*57);
                if(aorb == 0) gmod = 1000;
                else gmod = 2000;
              }
            }
          }
        }
      }
    }
  }
}