import 'package:flutter/material.dart';
import 'package:wucommerce/signInandUp/loginpage_screen.dart';


class RegisterPageScreen extends StatefulWidget {
  @override
  _RegisterPageScreenState createState() => _RegisterPageScreenState();
}

class _RegisterPageScreenState extends State<RegisterPageScreen> {
  bool _isObscure = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            SizedBox(height: 40.0),
            // Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Create a New Account Text
            Center(
              child: Text(
                'Create a New Account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            // Full Name TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            // Email Address TextField
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
            SizedBox(height: 20.0),
            // Agree to Terms Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "I agree to the Privacy Policy and Terms & Conditions of sHopMe.",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Register Button
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                ),
                onPressed: _agreeToTerms
                    ? () {
                  // Implement registration functionality
                }
                    : null, // Disable button if terms are not agreed to
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            // Already have an account? Log in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    // Navigate to Login Page Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.black,
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
