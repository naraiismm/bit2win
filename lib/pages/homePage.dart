import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final VoidCallback onGenerateQR; // ✅ Callback for QR navigation

  const HomePage({super.key, required this.onGenerateQR});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Partners:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Coca-Cola, Nestlé, EcoFund'),
          SizedBox(height: 20),
          Text('Bonus Amount: 150 points'),
          Text('Trash Weight: 5.2 kg'),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: onGenerateQR, // ✅ This navigates to the QR page
              child: Text('Generate QR Code'),
            ),
          ),
        ],
      ),
    );
  }
}