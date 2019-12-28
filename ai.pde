//ai.. sorry this doesn't have any algorithm..
void ai() {
  int i, j, k, l, m;

  // check max important block's important factor, that's x, y allis
  float aiImportantMax;
  int aiImportantX, aiImportantY;
  int colorblock = 1; // check if computer have left blocks
  int aiX[] = new int[100];
  int aiY[] = new int[100];
  m = 0; // number that maybe attacked next time

  aiScore=0;

  //reset
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      aiBlk[i][j]=2;
    }
  }

  //x,y coordinate if tile exist 0:no, 1: default 2:red 3: blue
  //aiBlk gen for playerA
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              //2 of quod, keep care other 2 point
              if (blk[k][l]==2&&(blk[i-j+l][i+j-k]==1&&blk[l+k-j][l-k+i]==1)) {
                //change this number to more attack or defensive
                aiBlk[i-j+l][i+j-k]*=1.4;
                aiBlk[l+k-j][l-k+i]*=1.4;
              }
            }
          }
        }
      }
    }
  }

  //aiBlk gen for playerB
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==3) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              //2 of quod, keep care other 2 point
              if (blk[k][l]==3&&(blk[i-j+l][i+j-k]==1&&blk[l+k-j][l-k+i]==1)) {
                //change this number to more attack or defensive
                aiBlk[i-j+l][i+j-k]*=1.1;
                aiBlk[l+k-j][l-k+i]*=1.1;
              }
            }
          }
        }
      }
    }
  }

  //set not useable block disabled(blk not 1)
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]!=1)
        aiBlk[i][j]=0;
    }
  }



  aiImportantMax = 2;
  aiImportantX = 0;
  aiImportantY = 0;
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (aiBlk[i][j]>aiImportantMax) {
        aiImportantMax = aiBlk[i][j];
        aiImportantX = i;
        aiImportantY = j;
      }
    }
  }

  for (j=1; j<12; j++) {
    for (i=1; i<12; i++) {
      if (aiBlk[i][j]==0)
        if (blk[i][j]==0)
          System.out.print("  ");
        else if (blk[i][j]==2)
          System.out.print("R ");
        else if (blk[i][j]==3)
          System.out.print("B ");
        else System.out.print("0 ");
      else System.out.print(int(aiBlk[i][j]) + " ");
    }
    System.out.println("end");
  }
  System.out.println(aiImportantMax);

  //check quod in player A next time
  for (i=1; i<12; i++) {
    for (j=1; j<12; j++) {
      if (blk[i][j]==2) {
        for (k=1; k<12; k++) {
          for (l=1; l<12; l++) {// blk is avaible for 50 so it is ok for larger then 12, so only care if it is plus
            if (i+j-k>0&&i-j+l>0&&l+k-j>0&&l-k+i>0&&!(k==i&&l==j)) {
              if (blk[k][l]==2&&(blk[i-j+l][i+j-k]==2||blk[l+k-j][l-k+i]==2)) {
                if (blk[i-j+l][i+j-k]==2&&blk[l+k-j][l-k+i]==1) {
                  m+=1;
                  aiX[m]=l+k-j;
                  aiY[m]=l-k+i;
                }
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
              if (colorblock==1&&blk[k][l]==3&&(blk[i-j+l][i+j-k]==3||blk[l+k-j][l-k+i]==3)) {
                if (blk[i-j+l][i+j-k]==3&&blk[l+k-j][l-k+i]==1) {
                  aiansX=l+k-j;
                  aiansY=l-k+i;
                  colorblock-=1;
                  m=-1;
                }
              }
            }
          }
        }
      }
    }
  }

  if (m>0) {

    while (m>0) {

      if (quazB>=1&&blk[aiX[m+1]][aiY[m+1]]==1) {
        if (aiImportantMax>2.1&&aiX[m+1]==aiImportantX&&aiY[m+1]==aiImportantY) {
          System.out.println("AiImportant! Defence mode available!");
        }
        //if (aiImportantMax>2.1&&aiX[m+1]==aiImportantX&&aiY[m+1]==aiImportantY) {
        //  System.out.println("AiImportant! Defence mode!");
        //  aiansX=aiImportantX;
        //  aiansY=aiImportantY;
        //} else {
        blk[aiX[m+1]][aiY[m+1]]=0;
        quazB=quazB-1;
        //}
      }
      m-=1;
    }
    if (colorblock==1) {
      aiansX=aiX[1];
      aiansY=aiY[1];
    }
    m=-1;
  } else if (m==0) {
    if (aiImportantMax<2.1) {
      i=int(random(3, 10));
      j=int(random(3, 10));
      while (blk[i][j]!=1) {
        i=int(random(3, 10));
        j=int(random(3, 10));
      }
      if (colorblock==1) {
        aiansX=i;
        aiansY=j;
      }
    } else {
      System.out.println("AiImportant!");
      aiansX = aiImportantX;
      aiansY = aiImportantY;
    }
  }

  aiFinish=1;
}
