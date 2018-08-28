//Studio Sonder 2017

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioInput in;

import processing.pdf.*;
PGraphicsPDF pdf;

FFT fft;
String note;// name of the note
int n;//int value midi note
color c;//color
float hertz;//frequency in hertz 
float midi;//float midi note
int noteNumber;//variable for the midi note
int sampleRate= 44100;//sampleRate of 44100
float [] max= new float [sampleRate/2];//array that contains the half of the sampleRate size, because FFT only reads the half of the sampleRate frequency. This array will be filled with amplitude values.
float maximum;//the maximum amplitude of the max array
float frequency;//the frequency in hertz

int  r = 170; // radius of circle

boolean record;

void setup() {

  size(displayWidth, displayHeight);
  background(0);//black BG
  fill(0);


  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO, 1024, sampleRate);
  fft = new FFT(in.left.size(), sampleRate);
}

void draw()
{
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height); // creates a delay in layers fading
  //int bsize = in.bufferSize(); 

  translate(width/2, height/2); //centers the circle
  noFill(); // fill colour
  strokeWeight(2); //thickness of ring
  //strokeGrow = strokeGrow + 0.5;
  findNote();

  textSize(20); //size of the text

  // text (frequency-6+"hz", 50, 200);//display the frequency in hertz
  pushStyle();
  fill(c);
  //text ("this is "+note, 50, 150);//display the note name
  popStyle();
}

void findNote() 
{
  fft.forward(in.left);
  for (int f=0; f<sampleRate/2; f++) { 
    max[f]=fft.getFreq(float(f));
  }

  maximum=max(max);

  for (int i=0; i<max.length; i++) {
    if (max[i] == maximum) {
      frequency= i;
    }
  }


  midi= 69+12*(log((frequency-6)/440));// formula that transform frequency to midi numbers
  n= int (midi);//cast to int

  ///the octave have 12 tones and semitones. So, if we get a modulo of 12, we get the note names independently of the frequency  
  if (n%12==9)
  {
    note = ("a");
    c = color (255, 0, 0);

    int bsize = in.bufferSize(); 
    int m = second();

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#343FFF);   //colour of ring
      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }

    endShape(CLOSE); // joins last two points
  }


  if (n%12==10)
  {
    note = ("a#");
    c = color (255, 0, 80);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#3461FF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);

      //strokeWeight(strokeGrow); //thickness of ring
      //strokeGrow = strokeGrow + 0.5;
    }
    endShape(CLOSE); // joins last two points
  }


  if (n%12==11)
  {
    note = ("b");
    c = color (255, 0, 150);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#348DFF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==0)
  {
    note = ("c");
    c = color (200, 0, 255);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#34A5FF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==1)
  {
    note = ("c#");
    c = color (100, 0, 255);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#34B2FF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==2)
  {
    note = ("d");
    c = color (0, 0, 255);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#34C7FF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }

  if (n%12==3)
  {
    note = ("d#");
    c = color (0, 50, 255);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#34E9FF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==4)
  {
    note = ("e");
    c = color (0, 150, 255);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#34FFF0);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==5)
  {
    note = ("f");
    c = color (0, 255, 255);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#95FFF7);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==6)
  {
    note = ("f#");
    c = color (0, 255, 0);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#BFFFFA);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==7)
  {
    note = ("g");
    c = color (255, 255, 0);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#E5FFFD);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }



  if (n%12==8)
  {
    note = ("g#");
    c = color (255, 150, 0);
    int bsize = in.bufferSize(); 

    beginShape();

    for (int i = 0; i < bsize; i+=10)  // this for loop is feeding the continuous line new vertices based on the values of the audio input
    {
      stroke(#FFFFFF);   //colour of ring

      float x2 = (r + in.left.get(i)*800)*cos(i*2*PI/bsize);
      float y2 = (r + in.left.get(i)*800)*sin(i*2*PI/bsize);
      curveVertex(x2, y2);
    }
    endShape(CLOSE); // joins last two points
  }

  // if (frameCount % 2 == 0){
  // This code executes ever 2 frames.
  //record = true;
  //record = false;
  //beginRecord(PDF, "###.pdf");   //saves new pdf every 2nd frame
  //}

  //  if (frameCount % 2 == 1){
  //  endRecord();
  //record = false;
  //endRecord();   
  //}
}



void stop()
{
  //always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}

void keyPressed() {
  if (key==' ')exit();            //quit out of the program with spacebar
  //if(key=='s')saveFrame("###.jpeg");  //take a photo by tapping s

  if (key=='s')beginRecord(PDF, "###.pdf"); 
  if (key=='p')endRecord();
}