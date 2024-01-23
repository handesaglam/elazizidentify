import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaziz/models/places.dart';
import 'package:elaziz/src/screen/place_detail.dart';
import 'package:flutter/material.dart';
class District extends StatefulWidget {
  const District({super.key});

  @override
  State<District> createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder(
        stream:FirebaseFirestore.instance.collection('city').snapshots(),
        builder: (context,snapshots) {
          if(snapshots.hasData){
            return Column(
        children: List.generate(snapshots.data!.docs.length, (index){
          return  GestureDetector(
            onTap: (){
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PlacesDetail(
      places: Places(
        name: snapshots.data!.docs[index].get("name").toString(),
        url:  snapshots.data!.docs[index].get("url").toString(),
         title: snapshots.data!.docs[index].get("title").toString()


      ),
    )));
            },
            child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: 
          Image.network(
            snapshots.data!.docs[index].get("url").toString(),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
          ),
          );

        }),

      );


          }else{
            return Center();


          }
          


          
        },
      )
,
        )
        
        /*Column(
        children: List.generate(5, (index){
          return Container(
            child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            'https://elazig.ktb.gov.tr/Resim/101544,dsc0052.png?0',
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
          );

        }),

      ),*/
      )
    );
  }
}