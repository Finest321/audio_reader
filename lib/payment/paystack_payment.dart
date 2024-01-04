// paystack_payment.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'; // Use InAppWebView
import 'package:http/http.dart' as http;

class PaystackPaymentPage extends StatelessWidget {
  final String token;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  PaystackPaymentPage({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paystack Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Token: $token'),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Amount',
              ),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _initializePayment(context);
              },
              child: Text('Initialize Payment'),
            ),
          ],
        ),
      ),
    );
  }

  void _initializePayment(BuildContext context) async {
    try {
      int amountInKobo = (double.parse(_amountController.text) * 100).round();

      final response = await http.post(
        Uri.parse('https://api.paystack.co/transaction/initialize'),
        headers: {
          'Authorization':
              'Bearer your_test_secret_key', // Replace with your actual Paystack test secret key
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'amount': '$amountInKobo',
          'email': _emailController.text,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final accessCode = jsonResponse['data']['access_code'];
        final paymentUrl = 'https://checkout.paystack.com/$accessCode';

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentWebView(paymentUrl: paymentUrl),
          ),
        );
      } else {
        print('Failed to initialize payment');
      }
    } catch (error) {
      print('Error initializing payment: $error');
    }
  }
}

class PaymentWebView extends StatelessWidget {
  final String paymentUrl;

  PaymentWebView({required this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment WebView'),
      ),
      body: InAppWebView(
        // Use InAppWebView
        initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
      ),
    );
  }
}
