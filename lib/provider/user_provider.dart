import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  void addUserData(User currentUser, String userName, String userEmail,
      String userImage, String userUid) async {
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(currentUser.uid)
        .set(
      {
        'userName': userName,
        'userEmail': userEmail,
        'userImage': userImage,
        'userUid': userUid
      },
    );
  }
}
