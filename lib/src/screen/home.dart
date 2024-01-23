import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaziz/models/places.dart';

import 'package:elaziz/src/screen/place_detail.dart';
import 'package:elaziz/src/widget/button_color.dart';
import 'package:flutter/material.dart';
import 'package:notification_center/notification_center.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: [
        Stack(
      children: [

        Container(
  
  height: MediaQuery.of(context).size.height/1.7,
  width: MediaQuery.of(context).size.width,

   child: 
 


     
    Expanded(
        child: 
          Image.network(
            "https://i.arkeolojikhaber.com/pool_file/2020/20/21811_elazig-saklikaya-karaleylek-kanyon-070520-800x2.jpg",
            fit: BoxFit.cover,
          ),
        
      ),



    
   ),

 

Positioned(
  bottom: 140,
  left: 20,
  child: Text("Hoşgeldiniz",
  style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
  
  ),
  
  )
  
),


Positioned(
  bottom: 120,
  left: 20,
  child: Text("Aziz şehir Elazığ'a hoşgeldiniz",
  style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600
  
  ),
  
  )
  
),
Positioned(
  bottom: 30,
  left: 20,
  child: ButtonColor()
  
),
  
      ],
    ),
Row(
  children: [
    Container(
      padding: EdgeInsets.all(20),
      child: Text("Popüler Yerler",
      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
      ),
    )
  ],
),

Container(




  child: StreamBuilder(
    stream:
     FirebaseFirestore.instance.collection('places').snapshots(), 
     builder: (context,snapshots){
      if(snapshots.hasData){
        return  CarouselSlider(
              items: List.generate(snapshots.data!.docs.length-1, (index) {
                return 
                GestureDetector(
                  onTap: (){
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlacesDetail(
      places: Places(
        name: snapshots.data!.docs[index].get("name").toString(),
        url:  snapshots.data!.docs[index].get("image").toString(),
         title: snapshots.data!.docs[index].get("title").toString()


      ),
    )),
  );

                  },
                  child: Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                         snapshots.data!.docs[index].get("image").toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                );

              }), 
                //1st Image of Slider
               

              //Slider Container properties
              //carousel Slider flutter
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            );

      }else{
         return Text("");
         
       

      }
    

     })
  
 

)
          ],


        
    
  


      
    );
  }
}