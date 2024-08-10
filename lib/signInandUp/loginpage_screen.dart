import 'package:flutter/material.dart';
import 'package:wucommerce/signInandUp/forgotpassword_screen.dart';
import 'package:wucommerce/signInandUp/registerpage_screen.dart';
// Make sure this file exists and is properly configured.

class LoginPageScreen extends StatefulWidget {
  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            SizedBox(height: 60.0),
            // Logo
            Center(
              child: Text(
                'sHopMe',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 60.0),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            // Password TextField
            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Implement forgot password functionality
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(), // Replace with your target screen
                    ),
                  );
                },
                child: Text('Forgot Password?', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            SizedBox(height: 20.0),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                ),
                onPressed: () {
                  // Implement sign in functionality

                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // OR Text
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20.0),
            // Sign In with Google Button
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: OutlinedButton.icon(
                // icon: Image.asset(
                //   'assets/google_logo.png', // Make sure you have a Google logo asset
                //   height: 24.0,
                //   width: 24.0,
                // ),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  // Implement sign in with Google functionality
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            // Don't have an account? Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    // Navigate to Register Page Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPageScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
