import 'package:camera/camera.dart';
import 'package:face_detection_with_flutter/capture.dart';
import 'package:face_detection_with_flutter/phone_auth/auth_gate.dart';
import 'package:face_detection_with_flutter/view/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Fetch available cameras.
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere(
    (camera) => camera.lensDirection == CameraLensDirection.front,
    orElse: () => cameras
        .first, // Fallback to the first camera if no front camera is found
  );

  runApp(
    MaterialApp(
      home: AuthGate(camera: frontCamera),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xff6C63FF)),
          primaryTextTheme:
              GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
          textTheme:
              GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(
        path: '',
      ),
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
