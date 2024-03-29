// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/signin.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = '';
  final _forkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  forgetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password Reset Email has been Sent",
        style: TextStyle(color: Colors.black, fontSize: 18.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User Found that Email",
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(133, 60, 8, 8),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.0),
        child: Form(
            child: Column(
          children: [
            SizedBox(
              height: 70.0,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Enter your mail",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Form(
                    child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2.0),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Email ",
                          hintStyle:
                              TextStyle(fontSize: 18.0, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 30.0,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    margin: EdgeInsets.only(left: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_forkey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                              });
                            }
                            forgetPassword();
                          },
                          child: Container(
                              width: 140,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 184, 166, 6),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Send Email",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) => LoginScreen(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                                (route) => false);
                          },
                          child: Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Text("Create",
                            style: TextStyle(
                              color: Color.fromARGB(255, 184, 166, 6),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )),
                      )
                    ],
                  )
                ],
              ),
            )))
          ],
        )),
      ),
    );
  }
}
