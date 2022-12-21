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
    apiKey: "AIzaSyAgmXvLMbg4_9L21BeBYu7DEBgg6lPezO4",
    authDomain: "miaged-9f163.firebaseapp.com",
    projectId: "miaged-9f163",
    storageBucket: "miaged-9f163.appspot.com",
    messagingSenderId: "70428582576",
    appId: "1:70428582576:web:3ab60e601ceecaa7c61175",
    measurementId: 'G-5QRBYEDEWC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgmXvLMbg4_9L21BeBYu7DEBgg6lPezO4',
    appId: '1:70428582576:android:716759158d66f257c61175',
    messagingSenderId: '70428582576',
    projectId: 'miaged-9f163',
    storageBucket: 'miaged-9f163.appspot.com',
  );
}