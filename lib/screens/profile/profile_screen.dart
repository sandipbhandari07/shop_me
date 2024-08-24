import 'package:flutter/material.dart';
import 'package:wucommerce/screens/splash/welcomepage_screen.dart';
import 'package:wucommerce/utils/theme/theme.dart';

import '../../services/auth_services.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  String email = '';
  String phoneNumber = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      isLoading = true;
    });

    final profileData = await AuthService.fetchProfileData();

    if (profileData != null) {
      setState(() {
        username = profileData['name'] ?? 'N/A';
        email = profileData['email'] ?? 'N/A';
        phoneNumber = profileData['phone'] ?? 'N/A';
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  void logout() {
    AuthService.getToken().then((value) {
      AuthService.clearToken();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColors.blue_blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue_blue,
                        ),
                      ),
                      SizedBox(height: 12),
                      _buildProfileInfoRow(Icons.person, 'Username:', username),
                      _buildProfileInfoRow(Icons.email, 'Email:', email),
                      _buildProfileInfoRow(Icons.phone, 'Phone:', phoneNumber),
                    ],
                  ),
                ),
              ),
              _buildProfileActionItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              _buildProfileActionItem(
                icon: Icons.history,
                title: 'Order History',
                onTap: () {},
              ),
              _buildProfileActionItem(
                icon: Icons.location_on,
                title: 'Address',
                onTap: () {},
              ),
              _buildProfileActionItem(
                icon: Icons.payment,
                title: 'Payment Methods',
                onTap: () {},
              ),
              _buildProfileActionItem(
                icon: Icons.help,
                title: 'Support',
                onTap: () {},
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: logout,
                  icon: Icon(Icons.logout, color: Colors.white),
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    backgroundColor: AppColors.blue_blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.blue_blue, size: 20),
          SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(width: 8),
          Text(
            value.isNotEmpty ? value : 'Loading...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActionItem({required IconData icon, required String title, required Function() onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.blue_blue),
        title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
