void help() {

  background(184, 241, 241);
  textSize(120);
  noStroke();
  fill(23, 93, 126);
  textAlign(CENTER, CENTER);
  text("help", width/2, 200);
  textSize(70);
  text("visit 'mileu.ml'", width/2, 350);
  fill(255, 206, 160);
  rect(width/2-140, 460, 280, 70);
  fill(0);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("Back", width/2, 495);
  if (mouseX>(width/2-140)&&mouseX<(width/2+140)) {
    fill(241, 232, 212);
    if (mouseY>460&&mouseY<530) {
      rect(width/2-140, 460, 280, 70);
      if (click==1) {
        gmod=-200;
        click=0;
      }
    }
  }
}