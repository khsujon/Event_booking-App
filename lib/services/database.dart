import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  //upload data of event
  Future addEvent(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Event")
        .doc(id)
        .set(userInfoMap);
  }

  //Fetch Data
  Future<Stream<QuerySnapshot>> getallEvents() async {
    return await FirebaseFirestore.instance.collection("Event").snapshots();
  }
}
