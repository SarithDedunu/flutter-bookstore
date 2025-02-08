import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),

            const SizedBox(height: 20),

            // User Name
            Text(
              'John Doe', // Replace with dynamic data if needed
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // Email
            Text(
              'johndoe@example.com', // Replace with actual user email
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),

            const SizedBox(height: 20),

            // Address
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text('123 Main Street, City, Country'),
            ),

            // Phone Number
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('+1 234 567 890'),
            ),

            const SizedBox(height: 20),

            // Logout Button
            ElevatedButton.icon(
              onPressed: () {
                Get.snackbar(
                    "Logout", "You have been logged out successfully.");
                // Add logout logic if needed
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
