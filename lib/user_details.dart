// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class DisplayUsersPage extends StatefulWidget {
//   @override
//   _DisplayUsersPageState createState() => _DisplayUsersPageState();
// }
//
// class _DisplayUsersPageState extends State<DisplayUsersPage> {
//   TextEditingController _tokenController = TextEditingController();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> _checkTokenAndNavigate(
//       String enteredToken, String userEmail) async {
//     try {
//       QuerySnapshot userQuery = await FirebaseFirestore.instance
//           .collection('users')
//           .where('email', isEqualTo: userEmail)
//           .limit(1)
//           .get();
//
//       if (userQuery.docs.isNotEmpty) {
//         String storedToken = userQuery.docs.first.get('token') as String;
//
//         if (enteredToken == storedToken) {
//           Navigator.pushReplacementNamed(context, '/MyHomePage');
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Entered token is incorrect. Please try again.'),
//             ),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('User not found. Please check the email.'),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error fetching user details: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('An error occurred while fetching user details.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Your Token'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AlertDialog(
//               title: Text('Enter Your Token'),
//               content: TextField(
//                 controller: _tokenController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your token',
//                 ),
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       User? currentUser = _auth.currentUser;
//
//                       if (currentUser != null) {
//                         String userEmail = currentUser.email!;
//                         await _checkTokenAndNavigate(
//                           _tokenController.text.trim(),
//                           userEmail,
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('User not authenticated.'),
//                           ),
//                         );
//                       }
//                     } catch (e) {
//                       print('Error fetching user details: $e');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                               'An error occurred while fetching user details.'),
//                         ),
//                       );
//                     } finally {
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
