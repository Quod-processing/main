//v0.6.0b2
//beware for singleAI in ai check time.
void draw() {
  
  log.println();
  log.println(hour()+":"+minute()+":"+second()+"."+millis());
  log.println("fps : "+frameRate);
  log.println("gmod : "+gmod);
  log.println("X : "+mouseX+" Y : "+mouseY);

  inputmod = -1;

  if (serverstate==1 && myClient.available()>0) recieveServer();

  if (escmod == 0) menu();
  else switch(gmod) {

  case -100:
    loadS1(); // loading screne, "click to start"
  case 100:
    loadS2();
    break;

  case -200:
    statM1(); // start menu
  case 200:
    statM2();
    break;

  case -300:
    snglP1(); // singlePlay
  case 300:
    snglP2();
    break;

  case -400:
    snglPai1(); // single Play ai
  case 400:
    snglPai2();
    break;

  case -500:
    snglPvs1(); // single Play 1 vs 1 
  case 500:
    snglPvs2();
    break;

  case -600:
    onlP1(); // onlinePlay
  case 600:
    onlP2();
    break;

  case -700:
    onlPL1(); // online login
  case 700:
    onlPL2();
    break;

  case 710:
    onlLR(); // online login request to server
    break;

  case -800:
    onlPS1(); // online signup
  case 800:
    onlPS2();
    break;
    
  case 810:
    onlSR(); // online signup request to server
    break;

  case -750:
  case 750:
    onlLVSBefore(); // online play with others before for waiting
    break;

  case -900:
    onlPvs1(); //online play
  case 900:
    onlPvs2(); //online play
    break;

  case -1000:
  case 1000:
    aWin(); // a win
    break;

  case -2000:
  case 2000:
    bWin(); // b win
    break;

  case -3000:
  case 3000:
    help(); // help
    break;
  }
  if (statemod==1) state();

  click=0;
}