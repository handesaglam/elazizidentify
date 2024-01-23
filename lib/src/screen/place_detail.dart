import 'package:elaziz/models/places.dart';
import 'package:flutter/material.dart';
class PlacesDetail extends StatefulWidget {
  Places? places;
   PlacesDetail({super.key,this.places});

  @override
  State<PlacesDetail> createState() => _PlacesDetailState();
}

class _PlacesDetailState extends State<PlacesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
  leading: GestureDetector(
    onTap: (){
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back),
  ),
  title: Text(widget.places!.name.toString()),
 ),
 body: Column(children: [
  Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: 
          Image.network(
            widget.places!.url.toString(),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
          ),

Container(
  padding: EdgeInsets.all(10),
  child: Text(widget.places!.title.toString()),
)


 ]),
    )
    ;
  }
}