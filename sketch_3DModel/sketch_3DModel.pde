import gifAnimation.*;

ArrayList<Point> points = new ArrayList<Point>();
boolean menu = true;
boolean showResult = false;
PShape result;

int zoom = 0;

int z = -500;

int quality = 10;

float rotX, rotY = 0;

//float rotateUp, rotateDown, rotateLeft, rotateRight;

void setup(){
  size(1000,800, P3D);
  
  menu();
}

void draw(){
  if(menu){
    menu();
  }else if(!showResult){
    app();
  }else{
    background(0);
    
    textSize(20);
    fill(255,255,255);
    text("- Press R to make another model", 20, 40);
    text("- Press the arrows to control the rotation", 20, 60);
    text("- Press I or O to zoom in or zoom out", 20, 80);
    text("- Press , or . to decrease o increase the quality", 20, 100);

    pushMatrix();
    z += zoom;
    translate(width/2, height/2, z);
    result.rotateX(rotX);
    result.rotateY(rotY);
    shape(result);
    popMatrix();
  }
}

void menu(){
  background(0);
  textSize(50);
  fill(255,255,255);
  textAlign(CENTER);
  text("Design your 3D model", width/2, height*0.2);
  
  textSize(30);
  text("Controls", width/2, height*0.4);
  text("- Draw your figure with the mouse", width/2, height*0.5);
  text("- Use only the right side from the center line", width/2, height*0.55);
  text("- Use minimum two points in your model", width/2, height*0.6);

  text("- Press enter when finish", width/2, height*0.65);
  
  text("Press enter to start", width/2, height*0.85);
}

void app(){
  background(0);
  fill(255,255,255);
  textAlign(LEFT);
  textSize(30);
  text("Press space to show menu", 20, 380);
  text("Press R to restart the draw", 20, 430);
  stroke(255);
  strokeWeight(3);
  line(width/2, 0, width/2, height);
  stroke(0,112,255);
  strokeWeight(2);
  
  //dibujamos toda la figura creada hasta el momento
  for(int i = 1; i < points.size(); i += 1){
    line(points.get(i - 1).getX() + width/2, points.get(i - 1).getY() + height / 2, points.get(i).getX() + width/2, points.get(i).getY() + height / 2);
  }
  
  //mostramos la linea resultante si el usuario hiciera click siempre que se encuentre en en lado que empezó usando
  if(points.size() > 0 && mouseX > width/2){
    line(points.get(points.size() - 1).getX() + width/2, points.get(points.size() - 1).getY() + height / 2, mouseX, mouseY);
  }
}

void showResult(){
  
  result = createShape();
  
  result.beginShape(TRIANGLE_STRIP);
  
  result.fill(255,23,0);
  
  for(int i = 0; i < points.size() - 1; i += 1){
    
    Point upPoint = points.get(i);
    Point downPoint = points.get(i + 1);
    
    result.vertex(upPoint.getX(), upPoint.getY(), upPoint.getZ());
    result.vertex(downPoint.getX(), downPoint.getY(), downPoint.getZ());
    
    float angle = PI/quality;
    
    for(float j = angle; j <= 2*PI; j += angle){
            
      println(upPoint.x, upPoint.y, upPoint.z);
      
      upPoint = new Point(upPoint.getX() * cos(angle) - upPoint.getZ() * sin(angle), upPoint.getY(), upPoint.getX() * sin(angle) + upPoint.getZ() * cos(angle));
      
      println(upPoint.x, upPoint.y, upPoint.z);
      
      result.vertex(upPoint.getX(), upPoint.getY(), upPoint.getZ());
      
      downPoint = new Point(downPoint.getX() * cos(angle) - downPoint.getZ() * sin(angle), downPoint.getY(), downPoint.getX() * sin(angle) + downPoint.getZ() * cos(angle));
      
      result.vertex(downPoint.getX(), downPoint.getY(), downPoint.getZ());
    }
  }
    
  result.endShape();
}

void mousePressed(){
  
  //asi conseguimos que no se detecten nuevos puntos mientras está en el menú
  if(menu) return;
  
  //si estamos en la app
  if(!menu && !showResult){
    
    //al guardar el punto restamos la mitad de la pantalla ya que a la hora de hacer el modelo este debe tomar las medidas partiendo de cero
    Point pointPressed = new Point(mouseX - width/2, mouseY - height / 2, 0);
    
    //guardamos el punto pulsado en la colección
    if(points.size() == 0 && mouseX >= width / 2){
      points.add(pointPressed);
    }else if(points.size() > 0 && mouseX >= width / 2){
      points.add(pointPressed);
    }
  }
  
}

void keyPressed(){
  if(keyCode == ENTER && menu){
    menu = false;
  }else if(key == ' ' && !menu && !showResult){
    menu = true;
    points.clear();
  }else if(keyCode == ENTER && !menu && points.size() >= 2 && !showResult){
    showResult();
    showResult = true;
  }else if((key == 'r' || key == 'R') && showResult){
    showResult = false;
    points.clear();
  }else if((key == 'r' || key == 'R') && !showResult && !menu){
    points.clear();
  }else if((key == 'i' || key == 'I') && showResult){
    zoom = 10;
  }else if((key == 'O' || key == 'o') && showResult){
    zoom = -10;
  }
  
  if(keyCode == UP){
    rotX = 0.05;
  }
  
  if(keyCode == DOWN){
    rotX = -0.05;
  }
  
  if(keyCode == LEFT){
    rotY = -0.05;
  }
  
  if(keyCode == RIGHT){
    rotY = 0.05;
  }
  
  if(key == ',' && quality > 2){
    quality -= 1;
    showResult();
  }
  
  if(key == '.'){
    quality += 1;
    showResult();
  }
  
  
}

void keyReleased(){
  if(keyCode == UP || keyCode == DOWN){
    rotX = 0;
  }
  
  if(keyCode == LEFT || keyCode ==RIGHT){
    rotY = 0;
  }
  
  if((key == 'i' || key == 'I') && showResult){
    zoom = 0;
  }else if((key == 'O' || key == 'o') && showResult){
    zoom = 0;
  }
  
}
