// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfmbmEOYv41od5_RiceGMNbAOK5Xzohhs",
            authDomain: "baseapp-9a504.firebaseapp.com",
            projectId: "baseapp-9a504",
            storageBucket: "baseapp-9a504.appspot.com",
            messagingSenderId: "793060035494",
            appId: "1:793060035494:web:6d1ca336ec297fb6cf1d67",
            measurementId: "G-EQ7CD6WNLG"));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
