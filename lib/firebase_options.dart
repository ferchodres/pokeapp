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
    apiKey: 'AIzaSyCiMQNfQR8NSpfSnC12EX5n6G1th9aSQ4I',
    appId: '1:118479827334:web:7892b1f913a69078b27c07',
    messagingSenderId: '118479827334',
    projectId: 'pokebase-b0e25',
    authDomain: 'pokebase-b0e25.firebaseapp.com',
    databaseURL: 'https://pokebase-b0e25-default-rtdb.firebaseio.com',
    storageBucket: 'pokebase-b0e25.appspot.com',
    measurementId: 'G-EVSS1ZM40V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCB4Og1TZ0vMwvAxSOxiXai5dzITdIR16c',
    appId: '1:118479827334:android:33400b38815eda3cb27c07',
    messagingSenderId: '118479827334',
    projectId: 'pokebase-b0e25',
    databaseURL: 'https://pokebase-b0e25-default-rtdb.firebaseio.com',
    storageBucket: 'pokebase-b0e25.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUl_g_P1CM-NmaZ6V6VR6OaphL9kQ5u2s',
    appId: '1:118479827334:ios:38b609e0f3fa1747b27c07',
    messagingSenderId: '118479827334',
    projectId: 'pokebase-b0e25',
    databaseURL: 'https://pokebase-b0e25-default-rtdb.firebaseio.com',
    storageBucket: 'pokebase-b0e25.appspot.com',
    iosClientId: '118479827334-m1cgiujkdh4gs0q2b1c7095dul8hk383.apps.googleusercontent.com',
    iosBundleId: 'com.example.pokeApp',
  );
}
