import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  @override
  loginpagestate createState() {
    // TODO: implement createState
    return loginpagestate();
  }
}

class loginpagestate extends State<loginpage>
    with SingleTickerProviderStateMixin {
  String _email, _password;
  Animation animation, delanimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    delanimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.bounceInOut)));
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    // TODO: implement build
    var w = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                      delanimation.value * w, 0.0, 0.0),
                  child: Container(
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
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * w, 0.0, 0.0),
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'PassWord',
                        labelText: 'PassWord',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text('LogIn'),
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((onValue) {
                        Navigator.of(context).pushNamed('/home');
                      }).catchError((e) => print(e));
                    },
                  ),
                ),
                Text('Create New Account'),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text('SignUp'),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/anima");
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
