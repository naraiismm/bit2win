import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onToggleRegister;

  const LoginPage({super.key, required this.onToggleRegister});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Message
            Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC6269E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Login to continue",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30),

            // Email Input
            TextField(
              decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),

            // Password Input
            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Full-colored Login Button (Navigates directly to HomePage)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/home"); // FIX: Navigates directly to Home
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC6269E), // Full pink button
                  foregroundColor: Colors.white, // White text
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Login", style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 10),

            // "Don't have an account? Register" at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: onToggleRegister,
                child: Text(
                  "Don't have an account? Register",
                  style: TextStyle(color: Color(0xFFD47A7C)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
