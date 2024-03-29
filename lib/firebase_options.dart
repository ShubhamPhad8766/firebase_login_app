// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDRWEHeOIoI7FlMXiy5acB6JPxlI1ewXEg',
    appId: '1:550750032355:web:3de68c5488efc9d067d0d6',
    messagingSenderId: '550750032355',
    projectId: 'authapp-c776d',
    authDomain: 'authapp-c776d.firebaseapp.com',
    storageBucket: 'authapp-c776d.appspot.com',
    measurementId: 'G-FZKWY2CR1H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeNMki4Wpa_e5L3CiASBgzTmLKaAdI94c',
    appId: '1:550750032355:android:a28eb62714d0420267d0d6',
    messagingSenderId: '550750032355',
    projectId: 'authapp-c776d',
    storageBucket: 'authapp-c776d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0XJRhM7c2zjaYXlXxuShJfKxjRHsO5uk',
    appId: '1:550750032355:ios:d89b16ac985d255667d0d6',
    messagingSenderId: '550750032355',
    projectId: 'authapp-c776d',
    storageBucket: 'authapp-c776d.appspot.com',
    iosBundleId: 'com.example.loginApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0XJRhM7c2zjaYXlXxuShJfKxjRHsO5uk',
    appId: '1:550750032355:ios:355982bb3723db4c67d0d6',
    messagingSenderId: '550750032355',
    projectId: 'authapp-c776d',
    storageBucket: 'authapp-c776d.appspot.com',
    iosBundleId: 'com.example.loginApp.RunnerTests',
  );
}
