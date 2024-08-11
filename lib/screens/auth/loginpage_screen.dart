import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wucommerce/screens/auth/registerpage_screen.dart';
import 'package:wucommerce/utils/theme.dart';

import 'forgotpassword_screen.dart';

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
            Center(
              child: Text(
                'ShopMe',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
            SizedBox(height: 60.0),
            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blue_blue)
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Password TextField
            TextField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blue_blue)
                ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text('Forgot Password?', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue_blue,
                ),
                onPressed: () {

                },
                child: Text(

                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
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
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: OutlinedButton.icon(
                icon: Image.asset(
                  'assets/images/google_logo.png',
                  height: 24.0,
                  width: 24.0,
                ),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                      fontFamily: 'RobotoMono'
                  ),
                ),
                onPressed: () {

                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                ),
                ),
                GestureDetector(
                  onTap: () {
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
                      color: AppColors.blue_blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
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
