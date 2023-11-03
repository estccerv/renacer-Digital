import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDXj-d1YXqbrseqOk4aCtOemug8BD8yZpM",
            authDomain: "nftslatam-123.firebaseapp.com",
            projectId: "nftslatam-123",
            storageBucket: "nftslatam-123.appspot.com",
            messagingSenderId: "1084615168058",
            appId: "1:1084615168058:web:a73d29959473b552d0e503",
            measurementId: "G-R81BM7N85L"));
  } else {
    await Firebase.initializeApp();
  }
}
