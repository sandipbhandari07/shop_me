import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wucommerce/colors/appcolors.dart';
import 'package:wucommerce/screens/homepage_screen.dart';
import 'package:wucommerce/signInandUp/loginpage_screen.dart';
import 'package:wucommerce/signInandUp/registerpage_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/images/wwshop.png",
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 45),
            //login button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: AppColors.blue_blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPageScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                              fontFamily: 'RobotoMono'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //register button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xFF1E232C),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPageScreen()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFF1E232C),
                            fontSize: 16,
                              fontFamily: 'RobotoMono'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomepageScreen()));
              },
              child: const Text(
                "Continue as a guest",
                style: TextStyle(
                  color: Color(0xFF35C2C1),
                    fontFamily: 'RobotoMono'
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}