import 'package:face_detection_with_flutter/phone_auth/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_service.dart';
import 'background.dart';
import 'customField.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  Color kPrimaryColor = Colors.red.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.red[50],
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _signin(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Background(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 80),
                    child: Center(
                      child: Container(
                        child: svg,
                        height: 250,
                      ),
                    ),
                  ),
                ),
                _emailAddress(),
                const SizedBox(
                  height: 6,
                ),
                _password(),
                const SizedBox(
                  height: 6,
                ),
                _confirmPassword(),
                const SizedBox(
                  height: 8,
                ),
                // _signin(context),
                GestureDetector(
                  onTap: () async {
                    await AuthService().signup(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextField(
                      obscureText: true,
                      enabled: false,
                      cursorColor: kPrimaryColor,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Sign Up",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ));
  }

  Widget _signup(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(double.infinity, 60),
        elevation: 0,
      ),
      onPressed: () async {
        await AuthService().signup(
            email: _emailController.text,
            password: _passwordController.text,
            context: context);
      },
      child: const Text("Sign Up"),
    );
  }

  Widget _emailAddress() {
    return TextFieldContainer(
      child: TextField(
        controller: _emailController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              Icons.person,
              color: Colors.red[900],
            ),
            hintText: "Email address",
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget _password() {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: _passwordController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.red[900],
            ),
            hintText: "Password",
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget _confirmPassword() {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        controller: _confirmPasswordController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.red[900],
            ),
            hintText: "Confirm Password",
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget _signin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "Already Have Account? ",
              style: TextStyle(
                  color: Colors.red[900]!,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            TextSpan(
                text: "Log In",
                style: TextStyle(
                    color: Colors.red[900]!,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
          ])),
    );
  }
}

final String assetName = 'assets/login.png';
final Widget svg = Image.asset(assetName);
