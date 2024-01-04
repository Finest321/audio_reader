// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Home Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to My Home Page!'),
//       ),
//     );
//   }
// }
//
// class PaymentScreen extends StatelessWidget {
//   final TextEditingController _tokenController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _tokenController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your token',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () => _checkToken(context),
//               child: Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _checkToken(BuildContext context) async {
//     final String enteredToken = _tokenController.text.trim();
//     print('Entered Token: $enteredToken');
//
//     // Check if the entered token exists in Firestore
//     final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
//         .instance
//         .collection('users')
//         .where('token', isEqualTo: enteredToken)
//         .get();
//
//     print('Firestore Query Result:');
//     for (QueryDocumentSnapshot<Map<String, dynamic>> document in result.docs) {
//       print('Document ID: ${document.id}, Data: ${document.data()}');
//     }
//
//     if (result.docs.isNotEmpty) {
//       // Token exists, navigate to MyHomePage
//       Navigator.pushReplacementNamed(context, '/myHomePage');
//     } else {
//       // Token does not exist, show error SnackBar
//       _showErrorSnackBar(context, 'Invalid token');
//     }
//   }
//
//   void _showErrorSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(
//     MaterialApp(
//       routes: {
//         '/': (context) => PaymentScreen(),
//         '/myHomePage': (context) => MyHomePage(),
//         // other routes...
//       },
//     ),
//   );
// }
