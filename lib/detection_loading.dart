import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetectionLoading extends StatelessWidget {
  DetectionLoading({Key? key}) : super(key: key);
  final spinkit = SpinKitFadingCube(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: SafeArea(child: spinkit),
      ),
    );
  }
}
