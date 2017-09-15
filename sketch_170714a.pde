PImage photo;
int chillin = 100;
String name = "Koala";
void setup() {
  size(1024, 768);
  photo = loadImage(name+".jpg");
  int dimension = photo.width * photo.height;
  color [] lastx = new color[chillin];
  photo.loadPixels();
  for (int i = 0; i < dimension; i += 1) {
      lastx[i%chillin] = photo.pixels[i];
      if(i%chillin == chillin-1){
        for(int j = 0; j < lastx.length-1; j++){
          for(int k = j+1; k < lastx.length; k++){
            if(red(lastx[j])/(red(lastx[j])+green(lastx[j])+blue(lastx[j])) > red(lastx[k])/(red(lastx[k])+green(lastx[k])+blue(lastx[k]))){
              lastx[j] ^= lastx[k];
              lastx[k] ^= lastx[j];
              lastx[j] ^= lastx[k];
            }
          }
        }
        for(int j = 0; j < lastx.length; j++){
          photo.pixels[i-lastx.length+1+j] = lastx[j];
        }
      }
    } 
  photo.updatePixels();
}

void draw() {
  image(photo, 0, 0);
  photo.save("Sorted"+name+chillin+".jpg");
}