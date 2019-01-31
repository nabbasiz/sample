import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class homepage extends StatefulWidget {
  @override
  homepagestate createState() {
    // TODO: implement createState
    return homepagestate();
  }
}



class homepagestate extends State<homepage> {
  File salmpleImage;

Future getImage( ) async{
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  
  setState(() {
      salmpleImage = image;
    });
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: salmpleImage == null
              ? MaterialButton(
                  child: Text('add'),
                  color: Colors.pink,
                  highlightElevation: 5.0,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.file(
                      salmpleImage,
                      height: 300.0,
                      width: 300.0,
                    ),
                    MaterialButton(
                      child: Text('UPLOAD'),
                      color: Colors.pink,
                      highlightElevation: 5.0,
                      onPressed: () {
                        final StorageReference ref =FirebaseStorage.instance.ref().child('myimage.jpg');
                        ref.putFile(salmpleImage);
                            
                      },
                    ),
                  ],
                )

          // OutlineButton(
          //   child: Text('LogOut'),
          //   onPressed: (){
          //     FirebaseAuth.instance.signOut().then((onValue){
          //       Navigator.of(context).pushReplacementNamed('/landing');
          //     }).catchError((e)=>print(e));
          //   },
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/dashbord');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
