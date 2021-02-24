import 'package:flutter/material.dart';
import 'package:fluttercomboapps/widgets/flutterCam.dart';
import 'package:fluttercomboapps/widgets/flutterMap.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Flutter Combo App")),
               backgroundColor: Colors.pink,
              ),
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
                 Image.asset("assets/flutter.jpg",height: 200,width: 200,),
                 SizedBox(height: 40,),
                 RaisedButton(
                   onPressed: (){
                     Navigator.push(context,MaterialPageRoute(builder: (context)=> flutCam()));
                   },
                   color: Colors.pink,
                   child: Text("Flutter Camera",style: TextStyle(fontWeight: FontWeight.bold),),
                 ),
                 SizedBox(height: 20,),
                 RaisedButton(
                   onPressed: (){
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>flutterMap()));
                   },
                   color: Colors.pink,
                   child: Text("Flutter Map",style: TextStyle(fontWeight: FontWeight.bold),),
                 ),
                 SizedBox(height: 20,),
               ],
              ),
        )
        ),
      );


  }
}
