//singleAI : single play with ai
void snglPai1() {

  background(243, 241, 228);
  showBlock();
  showQuaz();//show number of quaz left
  showID("A", "B");
  showDownsideUi();


  gmod = -gmod;
}


void snglPai2() {

  //red, playerA
  //timepannel
  fill(240, 248, 255);
  noStroke();
  ellipse(timeAx, timeAy, 100, 100);

  //turn of A
  if (turn == 0) {
    aiTurn=1;//set Ai for compute
    //hand of timepannel
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 2400, 0, TWO_PI)- HALF_PI;//100 is max
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
          gmod = -gmod;
          turn=2;
          timeA=0;
        } else if (mouseButton == RIGHT&&quazA>0) {
          blk[int((mouseX-204)/57)][int((mouseY+44)/57)]=0;
          gmod = -gmod;
          quazA-=1;
        }
      }
    }

    //say there is quod
    if (click==1&&mouseX<248&&mouseY>540) {
      gmod = -gmod;
      chkQd(0);
      quazA-=1;
      turn=1;
      timeA=0;
    }

    if (timeA<-2400) {
      gmod = -gmod;
      turn = 1; // turn A end for time limit
      timeA = 0;
      timeB = 0;
    }
  }

  if (turn==2) {
    timeA-=60/frameRate;
    float scdA = map(timeA, 0, 250, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(255, 0, 0);
    strokeWeight(3);
    line(timeAx, timeAy, timeAx + cos(scdA)*40, timeAy+sin(scdA)*40);

    if (click==1&&mouseX<248&&mouseY>540)
    {
      gmod = -gmod;
      chkQd(0);
      turn=1;
      quazA-=1;
      timeA=0;
    }      

    if (timeA<-250) {
      gmod = -gmod;
      turn=1; // turn A end for tiem limit
      timeA=0;
    }
  }

  //blue, playerB
  fill(240, 248, 255);
  noStroke();
  ellipse(timeBx, timeBy, 100, 100);

  if (turn==1||turn==3) {
    //part of ai, and need for time delay 2 seconds
    //this could make some code mess..
    if (aiTurn==1) { // after they compute it goes to chkQd one more time..
      chkQd(1);//say if there is quod!
      thread("ai");
      aiTurn=0;
      aiFinish=0;
    }
    if (aiFinish==1) { // after they compute it goes to chkQd one more time..
      blk[aiansX][aiansY]=3;
      lastBlockX=aiansX;
      lastBlockY=aiansY;
      chkQd(1);
      gmod = -gmod;
      aiFinish=0;
    }

    timeB-=60/frameRate;
    float scdB = map(timeB, 0, 150, 0, TWO_PI) - HALF_PI; // 100 is max
    stroke(0, 0, 255);
    strokeWeight(3);
    line(timeBx, timeBy, timeBx + cos(scdB)*40, timeBy+sin(scdB)*40);

    if (timeB<-150) {
      gmod = -gmod;
      turn=0; // turn A end for tiem limit
      timeB=0;
    }
  }
}