
import 'package:flutter/material.dart';
import 'package:impulse_app/pages/landingPage.dart';
import 'package:impulse_app/pages/homePage.dart';
import 'package:impulse_app/pages/loginPage.dart';
import 'package:impulse_app/pages/profilePage.dart';
import 'package:impulse_app/pages/qrCodePage.dart';
import 'package:impulse_app/pages/stationPage.dart';
import 'package:impulse_app/pages/registerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;
  bool _showQRPage = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showQRPage = false;
    });
  }

  void _navigateToQRPage() {
    setState(() {
      _showQRPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFC6269E),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1, // ✅ Light shadow for better UX
          centerTitle: false, // ✅ Title aligned to the left
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFC6269E),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFC6269E),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 10,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFFC6269E),
            side: BorderSide(color: Color(0xFFC6269E), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LandingPage(),
        "/login": (context) => LoginPage(
              onToggleRegister: () => Navigator.pushReplacementNamed(context, "/signup"),
            ),
        "/signup": (context) => RegisterPage(
              onToggleLogin: () => Navigator.pushReplacementNamed(context, "/login"),
            ),
        "/home": (context) => Scaffold(
              appBar: _selectedIndex == 2
                  ? null // ✅ REMOVE AppBar in ProfilePage
                  : AppBar(
                      title: Text("Bin2Win"),
                      actions: [
                        IconButton(
                          icon: Icon(Icons.notifications, color: Color(0xFFC6269E)),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Color(0xFFC6269E)),
                          onPressed: () {},
                        ),
                      ],
                    ),
              body: IndexedStack(
                index: _selectedIndex,
                children: [
                  HomePage(onGenerateQR: _navigateToQRPage),
                  StationsPage(),
                  ProfilePage(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Stations'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Color(0xFFC6269E),
                unselectedItemColor: Colors.grey,
                onTap: _onItemTapped,
              ),
            ),
      },
    );
  }
}
