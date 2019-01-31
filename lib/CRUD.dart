import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUD {
  IsSignedInUser() {
    if (FirebaseAuth.instance.currentUser() != null)
      return true;
    else
      return false;
  }

  Future<void> AddItem(cardata) async {
    Firestore.instance.collection('cars').add(cardata).catchError((e) {
      print(e);
    });
  }
}
