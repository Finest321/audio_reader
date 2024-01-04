// import 'package:audio_reader/chapters/chapter1.dart';
// import 'package:audio_reader/chapters/chapter2.dart';
// import 'package:flutter/material.dart';
// import 'chapters/index.dart';
// import 'home.dart'; // Import the index.dart file
// import 'payment.dart'; // Import the payment screen file
//
// class MyHomePage extends StatelessWidget {
//   final Map<String, dynamic> user; // Assuming user data is available
//
//   MyHomePage({required this.user});
//
//   @override
//   Widget build(BuildContext context) {
//     // Check if the user has a "token" field
//     if (!user.containsKey("token")) {
//       // Navigate to PaymentScreen if "token" is not present
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => PaymentScreen()),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('My Home'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             //... (rest of your code remains unchanged)
//           ],
//         ),
//       ),
//     );
//   }
//
// //... (rest of your code remains unchanged)
// }
//
// class PaymentScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Payment Screen'),
//       ),
//       body: Center(
//         child: Text(
//           'Please make a payment to access the content.',
//           style: TextStyle(color: Colors.white, fontSize: 16.0),
//         ),
//       ),
//     );
//   }
// }
//
// //... (rest of your code remains unchanged)
