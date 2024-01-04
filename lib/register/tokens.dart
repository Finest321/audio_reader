import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../myhome.dart';

class SecondScreen extends StatelessWidget {
  final TextEditingController tokenController = TextEditingController();
  final String userEmail; // Add this property to store the user's email

  // Constructor to initialize the userEmail property
  SecondScreen({required this.userEmail});

  void checkToken(BuildContext context) async {
    String token = tokenController.text;

    // Check if the token and email are associated in Firestore
    QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('token', isEqualTo: token)
        .where('email', isEqualTo: userEmail)
        .get();

    if (result.docs.isNotEmpty) {
      // Token is valid and associated with the entered email, navigate to MyHomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      // Show a snackbar for invalid token or mismatched email
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Enter a valid token associated with your email. OR PURCHASE TOKEN',
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          padding:
              EdgeInsets.all(16.0), // Adjust padding to position it at the top

          duration: Duration(seconds: 5), // Show for 5 seconds
          margin: EdgeInsets.only(top: 20.0),
        ),
      );
    }
  }

  void contactSupport(BuildContext context) {
    // Handle the action when the "PURCHASED TOKEN? BUT YET TO RECEIVE IT CONTACT THE SUPPORT TEAM" is tapped
    // You can implement the logic to contact the support team
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 50, 80),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Enter Token'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            // Center the entire Column
            child: Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Vertically center content
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 240), // Added SizedBox to create space

                  TextField(
                    controller: tokenController,
                    textAlign:
                        TextAlign.start, // Center-align text in TextField
                    decoration: InputDecoration(
                      hintText: 'Enter Your Token',
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
                    onPressed: () => checkToken(context),
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
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaystackWebView(),
                        ),
                      );
                    },
                    child: Text(
                      "Don't Have a Token? 'PURCHASE TOKEN'",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  Text(
                    'PURCHASE TOKEN? But yet to Receive it, \n CONTACT THE SUPPORT TEAM on lifechangerhelp@gmail.com',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

// InAppWebView widget to display Paystack website
class PaystackWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Token'),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse('https://paystack.com/pay/9il3b00n-y')),
      ),
    );
  }
}
