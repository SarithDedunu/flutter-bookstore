import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: const Text("User Profile Information",
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
