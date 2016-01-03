//snglPvs() single play 1 vs 1 in one computer
void snglPvs1() {

  background(243, 241, 228);
  showBlock();
  showQuaz();//show number of quaz left
  showID("A", "B");
  showDownsideUi();

  gmod = -gmod;
}

void snglPvs2() {

  //red, playerA
  //timepanel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  if (turn==0) {
    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=2;
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          turn=2;
          gmod = -gmod;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          quazA-=1;
          gmod = -gmod;
        }
      }
    }

    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      quazA-=1;
      turn=1;
      gmod = -gmod;
      timeA=0;
    }   

    if (timeA<-2400) {
      turn=1; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }
  }

  if (turn==2) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    if (click==1&&mouseX<248&&mouseY>540) {
      chkQd(0);
      turn=1;
      gmod = -gmod;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      turn=1; // turn A end for tiem limit
      gmod = -gmod;
      timeA=0;
    }
  }


  ////////////////////////////////////////////////

  //blue, player B

  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);

  if (turn==1) {
    //hand of timepannel
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 3000, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    //mouse click check
    if (click==1&&0<int((mouseX-204)/57)&&int((mouseX-204)/57)<12&&((mouseX-204)%57)<45&&0<int((mouseY+44)/57)&&int((mouseY+44)/57)<12&&((mouseY+44)%57)<45) {
      if (blk[int((mouseX-204)/57)][int((mouseY+44)/57)]==1) {
        if (mouseButton == LEFT) {
          lastBlockX=int((mouseX-204)/57);
          lastBlockY=int((mouseY+44)/57);
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=3;        
          turn=3;
          gmod = -gmod;
          timeB=0;
        } else if (mouseButton == RIGHT&&quazB>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          quazB-=1;
          gmod = -gmod;
        }
      }
    }

    //say there is quod
    if (click==1&&mouseX>888&&mouseY>540) {
      chkQd(1);
      quazB-=1;
      turn=0;
      gmod = -gmod;
      timeB=0;
    }   

    if (timeB<-3000) {
      turn=0; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }

  if (turn==3) {
    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    if (click==1&&mouseX>888&&mouseY>540) {
      chkQd(1);
      turn=0;
      gmod = -gmod;
      quazB-=1;
      timeB=0;
    }      

    if (timeB<-250) {
      turn=0; // turn A end for tiem limit
      gmod = -gmod;
      timeB=0;
    }
  }
}