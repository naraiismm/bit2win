import 'package:flutter/material.dart';
import 'package:impulse_app/pages/homePage.dart';
import 'package:impulse_app/pages/loginPage.dart';
import 'package:impulse_app/pages/profilePage.dart';
import 'package:impulse_app/pages/qrCodePage.dart';
import 'package:impulse_app/pages/stationPage.dart';

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
  bool _isRegistering = false;
  bool _showQRPage = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showQRPage = false;
    });
  }

  void _toggleAuthState() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  void _toggleRegister() {
    setState(() {
      _isRegistering = !_isRegistering;
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
        primaryColor: Color(0xFFF59498),
        scaffoldBackgroundColor: Color(0xFFFFEAEA),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF59498),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFD47A7C),
          unselectedItemColor: Colors.grey,
          backgroundColor: Color(0xFFF59498),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF59498),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      home: _isLoggedIn
          ? (_showQRPage
              ? QRCodeGeneratorPage()
              : Scaffold(
                  appBar: AppBar(
                    title: Text('Bin2Win'),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.settings),
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
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.map), label: 'Stations'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: 'Profile'),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.blue,
                    onTap: _onItemTapped,
                  ),
                ))
          : _isRegistering
              ? RegisterPage(onToggleLogin: _toggleRegister)
              : LoginPage(
                  onToggleRegister: _toggleRegister,
                  onLoginSuccess: _toggleAuthState),
    );
  }
}
