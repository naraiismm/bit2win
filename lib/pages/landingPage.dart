import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image at the Top
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/landing_image.png"), // Add image to assets
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Buttons at Bottom
          Column(
            children: [
              // Login Button
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6269E), // White background
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Login", style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 10),

              // Signup Button
              SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/signup");
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFFC6269E), // Text color
                    side: BorderSide(color: Color(0xFFC6269E), width: 2), // Border
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Sign Up", style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
