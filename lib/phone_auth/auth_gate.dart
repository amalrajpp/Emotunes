import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:face_detection_with_flutter/phone_auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../capture.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key, this.camera});

  final camera;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Login();
        }
        return CameraApp(camera: camera);
      },
    );
  }
}
