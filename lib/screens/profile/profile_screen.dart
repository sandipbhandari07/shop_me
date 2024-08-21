import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String finalUsername;
  final String finalEmail;

  const ProfileScreen({
    Key? key,
    required this.finalUsername,
    required this.finalEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $finalUsername', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 8.0),
            Text('Email: $finalEmail', style: TextStyle(fontSize: 18.0)),

          ],
        ),
      ),
    );
  }
}
