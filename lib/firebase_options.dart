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
    apiKey: 'AIzaSyA5kP_OJCIO227PEWtFACHiK37vUaVecXg',
    appId: '1:394868807147:web:1a7865c64441c84b0b35ae',
    messagingSenderId: '394868807147',
    projectId: 'login-e1b68',
    authDomain: 'login-e1b68.firebaseapp.com',
    storageBucket: 'login-e1b68.appspot.com',
    measurementId: 'G-07Y71XDYCG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDBvai3hARJcggs6jMbv9yHmbTTgnlTrI',
    appId: '1:394868807147:android:834889474570259c0b35ae',
    messagingSenderId: '394868807147',
    projectId: 'login-e1b68',
    storageBucket: 'login-e1b68.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCULUpaWHDALTw4mgefi52eCbdp7m-koTk',
    appId: '1:394868807147:ios:a0803eb2885154440b35ae',
    messagingSenderId: '394868807147',
    projectId: 'login-e1b68',
    storageBucket: 'login-e1b68.appspot.com',
    iosBundleId: 'com.example.googlelogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCULUpaWHDALTw4mgefi52eCbdp7m-koTk',
    appId: '1:394868807147:ios:c0634bad408242740b35ae',
    messagingSenderId: '394868807147',
    projectId: 'login-e1b68',
    storageBucket: 'login-e1b68.appspot.com',
    iosBundleId: 'com.example.googlelogin.RunnerTests',
  );
}
