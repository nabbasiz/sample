import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SingUpPage extends StatefulWidget {
  @override
  SingUpState createState() {
    // TODO: implement createState
    return SingUpState();
  }
}

class SingUpState extends State<SingUpPage> {
  File  sampleImage;
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child:
          
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'PassWord',
                  labelText: 'PassWord',
                  border: OutlineInputBorder(),
                ),
                onChanged: (vlue) {
                  setState(() {
                    _password = vlue;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              child: RaisedButton(
                color: Colors.lightBlue,
                child: Text('LogIn'),
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  )
                      .then((singeduser) {
                    Firestore.instance.collection('/users').add({
                      'email': singeduser.email,
                      'uid': singeduser.uid
                    }).then((value) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/home');
                    }).catchError((e) => print(e));
                  }).catchError((e) => print(e));
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:(){
             
        } ,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,

      ),
    );
  }
}
