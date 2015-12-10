//set, basic settings 
import processing.net.*;
//import java.io.InputStreamReader;//for os x battery
//String commandToRun = "pmset -g batt";//for os x battery
//String response=null;//for os x battery
Client myClient;

PImage mileuIcon, quodIcon;
PShape infoIcon, speakerIcon, settingsIcon;

BufferedReader reader;
PrintWriter log;

String[] Settings = new String[20];
int dataIn;


int gmod, turn;// gmod : game mode, turn is play turn 0:A(ai), 1:B(ai), 2: A after do his color block(ai), 3 : B after do his color block(ai) 4:A(1vs1), 5:B(1vs1), 6: A after do his color block(1vs1), 7 : B after do his color block(1vs1)
int escmod = -1;//help, option, menu
int inputmod = -1;//keyboard input mod
int menuKind = 0;
int statemod = 1;//server state, etc..
int serverstate = 0;
int aiTurn = -1;//check if ai will work or not
int[][] blk = new int[50][50];//x,y coordinate if tile exist 0:no, 1: default 2:red 3: blue
int[][] aiBlk = new int[50][50];//for tile, for ai compute
double aiScore=-5000;
int aiansX, aiansY, aicacheX, aicacheY;
int aiFinish=0;

float timeA, timeB;//time left of player A, B
int timeAx, timeAy, timeBx, timeBy;//time left pannel for player A,B
int timeCache;//time cache for click delay
int quazA, quazB;//quazer left of player A, B
int lastBlockX, lastBlockY;// say what was last block

String loginID=" ", loginPD=" ", DeviceID=" ";
String signupID=" ", signupPD=" ", signupPDC=" ", signupEmail=" "; // SignupPDC is check password to avoid typos
String enemyID=" ";
int lastEnemyAction = 0; //0 default, 1 is quod, 2 is quaz, 3 is say quod(squd)
int enemyBlkX=0, enemyBlkY=0; //x, y coordinate of enemy;

int loginCache=-1, signupCache=-1;
int loginCacheSmall=0, signupCacheSmall=0;
int validIDPDLI=0, validIDPDSU=0, validEmail=0; //valid of login and signup id and password
int worldValid=333333;
int roomRequested = 0; //0 is none, 1 is yes, 2 is client is playing
int onlineJoinRoom = 0; //0 is none, room 1~6

int click;
PFont font;

void settings() {

  size(1136, 640, P2D);
  /*
  size(1136, 640, P2D); -> for OS X
   size(1136, 640); -> for windows
   unknown error why p2d is not run on windows
   */
  pixelDensity(displayDensity());
}

void setup() {

  background(243, 241, 228);

  //check for os x battery
  /*
  try {
   Process proc = (Runtime.getRuntime()).exec(commandToRun);
   
   BufferedReader stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));
   
   
   while ((response = stdInput.readLine()) != null) {
   System.out.println(response);
   }
   
   }
   catch(Exception e) {
   println(e);
   }
   */
  
  log = createWriter("log.txt");
  log.println("Log created date : "+year()+"/"+month()+"/"+day()+" "+hour()+":"+minute()+":"+second()+"."+millis());
  reader = createReader("setting.txt");
  readText();
  indexText();
  thread("connectServer");
  surface.setSize(parseInt(Settings[0]), parseInt(Settings[1]));
  surface.setTitle("quod v0.6.0b2");
  surface.setResizable(true);
  font = loadFont("mileuEn.vlw");
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  smooth();
  frameRate(60);
  quodIcon = loadImage("myicon.PNG");
  mileuIcon = loadImage("mileu.png");
  infoIcon = loadShape("info.svg");
  speakerIcon = loadShape("speaker.svg");
  settingsIcon = loadShape("settings.svg");
  imageMode(CENTER);


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
  gmod=-100;
  turn=-1;
}

void connectServer() {
  myClient = new Client(this, Settings[2], parseInt(Settings[3]));
  serverstate = 1;
}