import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Function to add a diary entry
Future<void> createPlayed(Map<String, dynamic> song) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance
      .collection('user')
      .doc(uid)
      .collection("played")
      .add(song);
  print("success");
}
