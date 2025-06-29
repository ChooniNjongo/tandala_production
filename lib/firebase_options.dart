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
        return windows;
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
    apiKey: 'AIzaSyDjMPYee60TLsAXR0X8V_k0BQAE3SaU2Ws',
    appId: '1:251188717400:web:f041ceb4175b1cdcd0672d',
    messagingSenderId: '251188717400',
    projectId: 'tandala-85875',
    authDomain: 'tandala-85875.firebaseapp.com',
    storageBucket: 'tandala-85875.firebasestorage.app',
    measurementId: 'G-7ML7LW1CRX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAkjvaxhnzdj6MX5nKgKgNrM0wJqOjLEY',
    appId: '1:251188717400:android:7eefbafa2a6c8f39d0672d',
    messagingSenderId: '251188717400',
    projectId: 'tandala-85875',
    storageBucket: 'tandala-85875.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBATkYyEU1y2G_kdU1nvwJtXZsuvmzoUag',
    appId: '1:251188717400:ios:67a952b3ba1eeafcd0672d',
    messagingSenderId: '251188717400',
    projectId: 'tandala-85875',
    storageBucket: 'tandala-85875.firebasestorage.app',
    iosBundleId: 'com.example.cwtEcommerceAdminPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBATkYyEU1y2G_kdU1nvwJtXZsuvmzoUag',
    appId: '1:251188717400:ios:67a952b3ba1eeafcd0672d',
    messagingSenderId: '251188717400',
    projectId: 'tandala-85875',
    storageBucket: 'tandala-85875.firebasestorage.app',
    iosBundleId: 'com.example.cwtEcommerceAdminPanel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjMPYee60TLsAXR0X8V_k0BQAE3SaU2Ws',
    appId: '1:251188717400:web:3b9ebe662c9c7e02d0672d',
    messagingSenderId: '251188717400',
    projectId: 'tandala-85875',
    authDomain: 'tandala-85875.firebaseapp.com',
    storageBucket: 'tandala-85875.firebasestorage.app',
    measurementId: 'G-NC068T9JTS',
  );

}