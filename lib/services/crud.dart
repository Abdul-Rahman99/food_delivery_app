import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class crudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(restaurantData) async {
    if (isLoggedIn()) {
      FirebaseFirestore.instance
          .collection('RestaurantData')
          .add(restaurantData)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to log in');
    }
  }
}
