
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';



class flutterMap extends StatefulWidget {
  @override
  _flutterMapState createState() => _flutterMapState();
}

class _flutterMapState extends State<flutterMap> {
  
 List<Marker> allMarkers = [];
 GoogleMapController _controller ;
  
  @override

  //to display the red marker on the map which show current position//
  void initState(){
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId("My Marker"),
        draggable: true,  //to allow the marker to be drag by user//
        onTap: (){
          print("Marker Tapped");
                 },
        position: LatLng(3.139003,101.686852)
        ));
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Map"),
        backgroundColor: Colors.pink,
                   ),
      body: Stack(
        children:[ Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
              initialCameraPosition: CameraPosition( 
                      target: LatLng(3.139003,101.686852),
                      zoom: 12.0   //this is to set intial display(position&zoom) of the map when flutter map is pressed// 
                           ),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,

                      ),
                   ),
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: InkWell(
                     onTap: movetoBangi,
                     child: Container(
                       height: 40.0,
                       width: 40.0,
                       decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue
                                ),
                       child: Icon(Icons.forward,color: Colors.white,),
                     ),
                   ),
                 ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: movetoKualaLumpur,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue
                        ),
                        child: Icon(Icons.backspace,color: Colors.white,),
                      ),
                    ),
                  )
                  ]
                 ),
                );
              }

  void mapCreated(controller){
    setState(() {
      _controller = controller;
    });
  }
  movetoBangi(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(2.962860,101.751503),
        zoom: 15.0,
        bearing: 45.0,
        tilt: 45.0,
    )));
  }
 movetoKualaLumpur(){
   _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
     target: LatLng(3.139003,101.686852),
     zoom: 12.0,
     bearing: 45.0,
     tilt: 45.0,
   )));
 }
}
