import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: -50,
              left: -50,
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Color(0xFFF4B4B4),
                  borderRadius: BorderRadius.circular(150),
                ),
              )),
          Positioned(
            top: 275,
            right: -70,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Color(0xFFF4B4B4),
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
