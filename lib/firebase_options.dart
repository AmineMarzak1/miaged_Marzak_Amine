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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCkrD1QRv6Jhem-J0MnkqQcpZSGlq0mGzY',
    appId: '1:371680361631:web:a21b929022987b3d7976aa',
    messagingSenderId: '371680361631',
    projectId: 'fir-7e358',
    authDomain: 'fir-7e358.firebaseapp.com',
    storageBucket: 'fir-7e358.appspot.com',
    measurementId: 'G-5QRBYEDEWC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUQMtVIlyPaowCbKCOweAb61qykSkQ3Qc',
    appId: '1:371680361631:android:fa254f4f9ecc398c7976aa',
    messagingSenderId: '371680361631',
    projectId: 'fir-7e358',
    storageBucket: 'fir-7e358.appspot.com',
  );
}