int balance = 100;
int[] reels = new int[4];
boolean spinning = false;
int[] spinCounters = {0, 0, 0, 0};
int spinSpeed = 10;

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(32);
}

void draw() {
  background(200);
  drawSlotMachine();
  drawBalance();

  if (spinning) {
    spinReels();
  }
}

void drawSlotMachine() {
  strokeWeight(4);
  stroke(0);
  fill(255);

  for (int i = 0; i < 4; i++) {
    fill(255);
    rect(60 + i * 160, 100, 120, 120);
    textSize(64);
    fill(0);
    text(reels[i], 60 + 80 + i * 160, 170);
  }

  fill(255);
  rect(350, 500, 200, 80, 10);
  fill(0);
  textSize(32);
  text("Spin", 450, 540);
}

void drawBalance() {
  fill(0);
  textSize(32);
  text("Balance: $" + balance, width/2, 50);
}

void spinReels() {
  for (int i = 0; i < 4; i++) {
    spinCounters[i] += spinSpeed;

    if (spinCounters[i] >= 160) {
      spinCounters[i] = 0;
      reels[i] = (int) random(1, 10);
    }
  }

  if (spinCounters[0] == 0 && spinCounters[1] == 0 && spinCounters[2] == 0 && spinCounters[3] == 0) {
    spinning = false;
    checkWin();
  }
}

void checkWin() {
  int sum = reels[0] + reels[1] + reels[2] + reels[3];
  if (sum == 20) {
    balance += 50;
    alert("You win $50!");
  } else {
    balance -= 1;
    alert("You lose $1!");
  }
}

void mousePressed() {
  if (mouseX >= 350 && mouseX <= 550 && mouseY >= 500 && mouseY <= 580 && !spinning && balance > 0) {
    spinning = true;
    balance -= 1;
  }
}

void alert(String message) {
  textSize(32);
  fill(255);
  rect(200, 200, 400, 100, 10);
  fill(0);
  text(message, 400, 250);
  delay(2000);
}
