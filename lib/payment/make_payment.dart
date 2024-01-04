import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'; // Import InAppWebView

class MakePaymentButton extends StatelessWidget {
  void _makePayments(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InAppWebViewPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _makePayments(context),
      child: Text('Make Payments'),
    );
  }
}

class InAppWebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paystack Payment'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://paystack.com/'), // Replace with your Paystack URL
        ),
      ),
    );
  }
}
