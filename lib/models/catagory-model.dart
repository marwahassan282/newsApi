




class Catagory{

 String title;

 String image;
 String colorCode;
 String id;
 Catagory(this.title,this.image,this.colorCode,this.id);

static  List <Catagory>   getCatagory(){

  return [ Catagory('sports','assets/images/sports.png','0xFFC91C22','sports'),
   Catagory('technology','assets/images/Politics.png','0xFF003E90','technology'),
   Catagory('health','assets/images/health.png','0xFFED1E79','health'),
   Catagory('business','assets/images/bussines.png','0xFFED1E79','business'),
   Catagory('entertainment','assets/images/environment.png','0xFF4882CF','entertainment'),
   Catagory('science','assets/images/science.png','0xFFF2D352','science')];
 }



}