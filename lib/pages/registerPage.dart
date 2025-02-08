import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback onToggleLogin;

  const RegisterPage({super.key, required this.onToggleLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC6269E), // Same as button border
                ),
              ),
              SizedBox(height: 20),

              // Name Input
              TextField(
                decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),

              // Surname Input
              TextField(
                decoration: InputDecoration(labelText: 'Surname', border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),

              // Phone Number Input
              TextField(
                decoration: InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),

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

              // Full-width Register Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onToggleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6269E), // Full pink button
                    foregroundColor: Colors.white, // White text
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Join Now", style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 10),

              // Already have an account? Login Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onToggleLogin,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFFC6269E), // Text color same as button border
                    backgroundColor: Colors.white, // White background
                    side: BorderSide(color: Color(0xFFC6269E), width: 2), // Border
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Already have an account? Login", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
