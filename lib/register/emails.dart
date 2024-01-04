import 'package:audio_reader/register/tokens.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false; // Added variable to track loading state

  Future<void> registerEmail(BuildContext context) async {
    setState(() {
      isLoading =
          true; // Set loading to true when the registration process starts
    });

    String email = emailController.text;

    // Validate if the email field is empty
    if (email.isEmpty) {
      _showErrorSnackBar(context, 'Please enter your email.');
      return;
    }

    // Validate email format
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      _showErrorSnackBar(context, 'Please enter a valid email address.');
      return;
    }

    // Check network availability
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showErrorSnackBar(
        context,
        'No network available. Please check your internet connection.',
      );
      setState(() {
        isLoading = false; // Set loading to false when an error occurs
      });
      return;
    }

    // Check if the email already exists in Firestore
    DocumentSnapshot emailDocument =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (emailDocument.exists) {
      // Email already registered, navigate to SecondScreen with user's email
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(userEmail: email),
        ),
      );
    } else {
      // Generate a random token (you can use a more secure method)
      String token = DateTime.now().millisecondsSinceEpoch.toString();

      // Store email and token in Firestore with email as the document ID
      await FirebaseFirestore.instance.collection('users').doc(email).set({
        'email': email,
        'token': token,
      });

      // Show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Your mail was registered. Make payments to get your token.'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(userEmail: email),
        ),
      );
    }

    setState(() {
      isLoading =
          false; // Set loading to false when the registration process is complete
    });
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
    setState(() {
      isLoading = false; // Set loading to false when an error occurs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 50, 80),
      appBar: AppBar(
        title: Text('Enter Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: isLoading ? null : () => registerEmail(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 50.0,
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
