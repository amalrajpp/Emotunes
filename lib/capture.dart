import 'package:face_detection_with_flutter/Bottom%20NavBar/bottom_nav.dart';
import 'package:face_detection_with_flutter/detection_loading.dart';
import 'package:face_detection_with_flutter/faceId/view/face_id_view.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'view/main_screen.dart';

class CameraApp extends StatefulWidget {
  final CameraDescription camera;

  const CameraApp({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize().then((_) {
      // Automatically capture image after initialization
      _captureImage();
    });
  }

  // Capture image automatically
  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      await Future.delayed(const Duration(seconds: 2));
      final image = await _controller.takePicture();
      // Optionally display or use the image file
      print('Image captured ');
      print(image.path);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstPage(path: image.path)),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //return CameraPreview(_controller);
            return FaceIDView();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
