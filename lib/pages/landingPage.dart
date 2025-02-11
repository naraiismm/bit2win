import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Ensures center alignment
        children: [
          // Logo Image (Adjusted)
          Padding(
            padding: EdgeInsets.only(top: 80, bottom: 20), // Adjust position
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6, // 60% of screen width
              child: Image.asset(
                "lib/assets/images/landing_image.png",
                fit: BoxFit.contain,
              ),
            ),
          ),

          // 📌 Motto Text (Centered Fix)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Win for You, Win for Planet!",
                textAlign: TextAlign.center, // ✅ Centers text within the widget
                style: GoogleFonts.lobster( // Fancy Font
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC6269E), // Branding Color
                ),
              ),
            ),
          ),

          // Buttons Section
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login Button
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6269E),
                    foregroundColor: Colors.white,
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
                    foregroundColor: Color(0xFFC6269E),
                    side: BorderSide(color: Color(0xFFC6269E), width: 2),
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
