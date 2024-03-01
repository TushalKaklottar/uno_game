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
    apiKey: 'AIzaSyDEoTCoTA_rdONC7BRlEpY4XbUM6XQRPT0',
    appId: '1:30279156199:web:287dc314d419fa0228fd42',
    messagingSenderId: '30279156199',
    projectId: 'uno-game-edb7e',
    authDomain: 'uno-game-edb7e.firebaseapp.com',
    storageBucket: 'uno-game-edb7e.appspot.com',
    measurementId: 'G-LT7KETZ53K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhntE2dBc6_QZ1zNe4Z0RfL1pphGy2T5U',
    appId: '1:30279156199:android:d3ee4bf89c5a0d8528fd42',
    messagingSenderId: '30279156199',
    projectId: 'uno-game-edb7e',
    storageBucket: 'uno-game-edb7e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvJIvWht5giaHImouQJcvoA1jnSprsRF0',
    appId: '1:30279156199:ios:b54740f549c9ae5528fd42',
    messagingSenderId: '30279156199',
    projectId: 'uno-game-edb7e',
    storageBucket: 'uno-game-edb7e.appspot.com',
    iosBundleId: 'com.example.unoGame',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvJIvWht5giaHImouQJcvoA1jnSprsRF0',
    appId: '1:30279156199:ios:b54740f549c9ae5528fd42',
    messagingSenderId: '30279156199',
    projectId: 'uno-game-edb7e',
    storageBucket: 'uno-game-edb7e.appspot.com',
    iosBundleId: 'com.example.unoGame',
  );
}