// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCygtBaWaUwK3zZo2isVHA-nszHdYs1VJ4',
    appId: '1:454888897386:android:0a721ca4fe73a050404313',
    messagingSenderId: '454888897386',
    projectId: 'habitual-51fa8',
    storageBucket: 'habitual-51fa8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3tQRUWIFsNaOzTbSsAkQM2JFz8P1Ok54',
    appId: '1:454888897386:ios:b0bda79350ab31ba404313',
    messagingSenderId: '454888897386',
    projectId: 'habitual-51fa8',
    storageBucket: 'habitual-51fa8.appspot.com',
    iosClientId:
        '454888897386-9cnts2sslq8gnvmfgj0tb918lnphbbgk.apps.googleusercontent.com',
    iosBundleId: 'com.kmt.flutter.habitual',
  );
}
