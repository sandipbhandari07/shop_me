import 'package:flutter/material.dart';
import 'package:wucommerce/screens/auth/changepassword_screen.dart';
import 'package:wucommerce/utils/theme/theme.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: AppColors.dimblack,
            fontFamily: 'Montse',
          ),
        ),
        centerTitle: true,
      ),
      body: _profileData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.blue_blue,
                fontFamily: 'Montse',
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Name', _profileData!['customer_name']),
                    SizedBox(height: 10),
                    _buildInfoRow('Email', _profileData!['email']),
                    SizedBox(height: 10),
                    _buildInfoRow('Phone', _profileData!['phone']),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildProfileOptionsCard(),
            SizedBox(height: 10),
            _buildAdditionalOptionsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montse',
          ),
        ),
        Text(
          value ?? 'N/A',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
            fontFamily: 'Montse',
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOptionsCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildListTile(
            icon: Icons.password_sharp,
            title: 'Change Password',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()),);
            },
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.shopping_bag,
            title: 'My Orders',
            onTap: () {},
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.location_on,
            title: 'My Addresses',
            onTap: () {},
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.payment,
            title: 'Payment Methods',
            onTap: () {},
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalOptionsCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildListTile(
            icon: Icons.favorite,
            title: 'Wishlist',
            onTap: () {},
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {},
          ),
          _buildDivider(),
          _buildListTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: _logout,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.blue_blue),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montse',
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[300],
    );
  }
}
