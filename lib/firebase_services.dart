// // firebase_services.dart
//
// import 'package:firebase/firebase.dart' as fb;
// import 'package:firebase_core/firebase_core.dart';
//
// bool get isWeb => identical(0, 0.0);
//
// Future<void> initializeFirebase() async {
//   if (isWeb) {
//     // For web
//     fb.initializeApp(
//         apiKey: "AIzaSyB5IkJPj5fWAzJmtm6lTIenbHMkLaZnwIE",
//         authDomain: "dailyquote-a0032.firebaseapp.com",
//         databaseURL: "https://dailyquote-a0032-default-rtdb.firebaseio.com",
//         projectId: "dailyquote-a0032",
//         storageBucket: "dailyquote-a0032.appspot.com",
//         messagingSenderId: "921847466613",
//         appId: "1:921847466613:web:a399840b6d561a0a0ec63c",
//         measurementId: "G-5MF62JWLND");
//   } else {
//     // For other platforms (if needed)
//     await Firebase.initializeApp();
//   }
// }
//
// Future<void> checkUsersCollection(String email) async {
//   // Your existing logic for checking the users collection
// }
