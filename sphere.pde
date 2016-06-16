class Sphere{
  
  int radius = 120;
  int x = width / 2 , y = height / 2, z = 0, r = 100, len;
  
  Sphere(){} 

  void display(int len){
    pushMatrix();
    colorMode(HSB, fft.specSize());
    strokeWeight(2);
    translate(x, y, z);
    rotateZ(frameCount*.01);

    for(int i = 0; i < fft.specSize(); i++) {
      float mag = map(fft.getBand(i), 0, 512, 1, 100);
      stroke(i, fft.specSize(), fft.specSize()*0.6);
      line( mag*r*cos(radians((float)i*360/fft.specSize())), mag*r*sin(radians((float)i*360/fft.specSize())), -300, 
        len*cos(radians((float)i*360/fft.specSize()))*fft.getBand(i), len*sin(radians((float)i*360/fft.specSize()))*fft.getBand(i), 100 );
    }
    popMatrix();
  }

}
