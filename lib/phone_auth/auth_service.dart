import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Bottom NavBar/bottom_nav.dart';
import '../capture.dart';
import 'login.dart';

class AuthService {
  Future<void> signup(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras
            .first, // Fallback to the first camera if no front camera is found
      );
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var collection = FirebaseFirestore.instance.collection('user');
      String uid = FirebaseAuth.instance.currentUser!.uid;
      collection
          .doc(uid) // <-- Document ID
          .set({'uid': uid, 'mail': email}) // <-- Your data
          .then((_) => print('Added'))
          .catchError((error) => print('Add failed: $error'));
      await Future.delayed(const Duration(seconds: 1));
      /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  CameraApp(camera: frontCamera)));*/
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  CameraApp(camera: frontCamera)));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
    } catch (e) {}
  }

  Future<void> signin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras
            .first, // Fallback to the first camera if no front camera is found
      );
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 1));
      /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  CameraApp(camera: frontCamera)));*/
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  CameraApp(camera: frontCamera)));
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
    } catch (e) {}
  }

  Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }
}
