import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  //data retrive from firestore
  getUserDetails(String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).get();
  }
}
