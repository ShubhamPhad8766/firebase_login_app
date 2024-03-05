// ignore_for_file: unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/screens/login.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = '', password = '', name = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  registraion() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registerd SuccessFully",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Week",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Alreday exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283793),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 130.0, right: 20.0, left: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello...!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF4c59a5),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                        hintText: 'Your Name',
                        hintStyle: TextStyle(color: Colors.white60)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF4c59a5),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    controller: mailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        hintText: 'Your E-mail',
                        hintStyle: TextStyle(color: Colors.white60)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF4c59a5),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white60)),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = mailController.text;
                        name = nameController.text;
                        password = passwordController.text;
                      });
                    }
                    registraion();
                  },
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 55,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFf95f3b),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account?",
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                              color: Color(0xFFf95f3b),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
