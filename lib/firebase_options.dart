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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkGjJmdBRat9bj_kDviyRIFQo_GkdTpkI',
    appId: '1:726657195114:android:9657832a0466fabf67be13',
    messagingSenderId: '726657195114',
    projectId: 'tic-tac-toe-d4023',
    storageBucket: 'tic-tac-toe-d4023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0-RUj1s850KR330hfDuOkm2Fq3gLASLM',
    appId: '1:726657195114:ios:c0805115b1d0544f67be13',
    messagingSenderId: '726657195114',
    projectId: 'tic-tac-toe-d4023',
    storageBucket: 'tic-tac-toe-d4023.appspot.com',
    androidClientId: '726657195114-9k8qf8tp8ti4lv541n9kclogg3mv86ch.apps.googleusercontent.com',
    iosClientId: '726657195114-pq2cik6baif7jathllqrpi6pbo38hcum.apps.googleusercontent.com',
    iosBundleId: 'tech.bitcube.ticTacToe',
  );
}