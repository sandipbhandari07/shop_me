import 'package:flutter/material.dart';
import '../../services/auth_services.dart';
import '../splash/welcomepage_screen.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _profileData;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final data = await AuthService.fetchProfile();
    setState(() {
      _profileData = data;
    });
  }

  void _logout() async {
    await AuthService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _profileData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/images/profile_placeholder.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _profileData!['customer_name'] ?? 'Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _profileData!['email'] ?? 'Email',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      _profileData!['phone'] ?? 'Phone',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('My Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('My Addresses'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Payment Methods'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Other Services
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Wishlist'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: _logout, // Handle logout
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
