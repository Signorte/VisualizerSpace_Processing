import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim; 
AudioPlayer player;   
FFT fft;
ParticleSystem ps;
Sphere sp;
PImage sprite;

void setup() {
  //size(1024, 768, P3D);
  size(displayWidth, displayHeight, P3D);
  orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  ps = new ParticleSystem(5000);
  sp = new Sphere();
  colorMode(HSB, 255);
  frameRate(60);
  
  minim = new Minim(this);
  player = minim.loadFile("sample1.wav", 512);
  fft = new FFT(player.bufferSize(), player.sampleRate());
  player.play();

  hint(DISABLE_DEPTH_MASK);
} 

void draw () {
  fft.forward(player.mix);
  //pushMatrix();
  //translate(mouseX - width/2, mouseY - height/2, 300*sin(radians(frameCount/frameRate)));
  //camera(mouseX, mouseY, 100, width/2, height/2, 0, 0, 0, 0);
  pointLight(63*sin(radians(frameCount/15))+127, 255, 35*sin(radians(frameCount))+220, 0, 0, 10);
  background(0);

  sp.display(fft.specSize());
  ps.update();
  ps.display();
  ps.setEmitter(width/2, height/2);
  //popMatrix();
  
  if(mousePressed) {
    stop();
    exit();
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}


