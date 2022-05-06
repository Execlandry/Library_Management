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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUHbfdWC22Ni2JyEK-4uDvmFGUVl9bpWw',
    appId: '1:903690053260:web:57a429007edcc263b5fda9',
    messagingSenderId: '903690053260',
    projectId: 'libflut',
    authDomain: 'libflut.firebaseapp.com',
    storageBucket: 'libflut.appspot.com',
    measurementId: 'G-8FSMB070Y1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlYltbyuIHGC54XzGLkKAVta8657yFk88',
    appId: '1:903690053260:android:b379b829320f806ab5fda9',
    messagingSenderId: '903690053260',
    projectId: 'libflut',
    storageBucket: 'libflut.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOOmjYUU6olymqILiVMJeuvhFYnSFKmlA',
    appId: '1:903690053260:ios:cff929baf02e0ab4b5fda9',
    messagingSenderId: '903690053260',
    projectId: 'libflut',
    storageBucket: 'libflut.appspot.com',
    iosClientId: '903690053260-5dndknegv0cdqi3rqja9o5s5js8c27dh.apps.googleusercontent.com',
    iosBundleId: 'com.example.libraryManagement',
  );
}