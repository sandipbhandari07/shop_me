import 'package:flutter/material.dart';
import 'package:wucommerce/colors/appcolors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0),
            // Back Button
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.0),
            // Forgot Password Text
            Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Instruction Text
            Center(
              child: Text(
                "Don't worry! We will send an OTP to your registered email address.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 40.0),
            // Email Address TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40.0),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue_blue, // Background color
                ),
                onPressed: () {
                  // Implement the continue action (e.g., sending OTP)
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
