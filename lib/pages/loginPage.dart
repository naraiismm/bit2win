import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onToggleRegister;
  final VoidCallback onLoginSuccess;

  const LoginPage({super.key, required this.onToggleRegister, required this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFC6269E))),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onLoginSuccess,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: onToggleRegister,
              child: Text("Don't have an account? Register", style: TextStyle(color: Color(0xFFD47A7C))),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final VoidCallback onToggleLogin;

  const RegisterPage({super.key, required this.onToggleLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF59498))),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onToggleLogin,
              child: Text('Register'),
            ),
            TextButton(
              onPressed: onToggleLogin,
              child: Text("Already have an account? Login", style: TextStyle(color: Color(0xFFD47A7C))),
            ),
          ],
        ),
      ),
    );
  }
}