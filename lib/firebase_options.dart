// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBdDPeEOSQsEhBhLvK5ephaYAU397HhLlc',
    appId: '1:821785474289:web:012ecce537d692f3072550',
    messagingSenderId: '821785474289',
    projectId: 'project-todo-1708c',
    authDomain: 'project-todo-1708c.firebaseapp.com',
    storageBucket: 'project-todo-1708c.appspot.com',
    measurementId: 'G-R05TPKZ9ZD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBElWdsfy5bAYJ4PhxS_oZ-qsFR6PJgZ4c',
    appId: '1:821785474289:android:0168185b5364bb61072550',
    messagingSenderId: '821785474289',
    projectId: 'project-todo-1708c',
    storageBucket: 'project-todo-1708c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBU6alfqBAsqU6HvjDlzyhG89M3KcHE5Oc',
    appId: '1:821785474289:ios:1eceff032c1c34a6072550',
    messagingSenderId: '821785474289',
    projectId: 'project-todo-1708c',
    storageBucket: 'project-todo-1708c.appspot.com',
    iosBundleId: 'com.example.fbaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBU6alfqBAsqU6HvjDlzyhG89M3KcHE5Oc',
    appId: '1:821785474289:ios:1eceff032c1c34a6072550',
    messagingSenderId: '821785474289',
    projectId: 'project-todo-1708c',
    storageBucket: 'project-todo-1708c.appspot.com',
    iosBundleId: 'com.example.fbaseApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdDPeEOSQsEhBhLvK5ephaYAU397HhLlc',
    appId: '1:821785474289:web:ca5dc81f4235cc5e072550',
    messagingSenderId: '821785474289',
    projectId: 'project-todo-1708c',
    authDomain: 'project-todo-1708c.firebaseapp.com',
    storageBucket: 'project-todo-1708c.appspot.com',
    measurementId: 'G-B8MCRC3FG1',
  );
}