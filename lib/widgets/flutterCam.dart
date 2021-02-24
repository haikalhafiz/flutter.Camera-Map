import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class flutCam extends StatefulWidget {
  @override
  _flutCamState createState() => _flutCamState();
}

class _flutCamState extends State<flutCam> {

  File imageFile;

  _openGallery(BuildContext context) async{
             var photo = await ImagePicker.pickImage(source: ImageSource.gallery);
             this.setState(() {
            imageFile = photo;
             });
             Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async{
           var photo = await ImagePicker.pickImage(source: ImageSource.camera);
           this.setState(() {
             imageFile = photo;
             });
           Navigator.of(context).pop();
           //to remove the alert dialog after user select image//
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text("Select you image from"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                },
              ),
             Padding(padding: EdgeInsets.all(18.0)),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              )
            ],
          ),
        ),
      );
    });
  }

  //widget to display the image//
  Widget imageDisplay(){

    if(imageFile == null){
      return Text("No Image Selected");
    }else{
     return Image.file(imageFile,width: 500,height: 500,);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Camera"),backgroundColor: Colors.pink,),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              imageDisplay(),
              RaisedButton(onPressed: (){
                        _showChoiceDialog(context);
                      },
                child: Text("Select Image"),),
              ],
          ),
        ),
      ),
    );
  }
}
