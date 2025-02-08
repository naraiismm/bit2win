import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onGenerateQR;

  const HomePage({super.key, required this.onGenerateQR});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Normal white background
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Information Cards (Bonus & Trash Weight)
              _infoCard('Bonus Amount', '150 points', Icons.star, Colors.orange),
              const SizedBox(height: 20),
              _infoCard('Trash Weight', '5.2 kg', Icons.recycling, Colors.green),
              const SizedBox(height: 30),

              // Partners Section
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Partners',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFC6269E)),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _partnerImage('assets/images/coca_cola.png'),
                          _partnerImage('assets/images/nestle.png'),
                          _partnerImage('assets/images/ecofund.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Generate QR Code Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onGenerateQR,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6269E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Generate QR Code', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bonus & Trash Weight Info Cards
  Widget _infoCard(String title, String value, IconData icon, Color color) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFC6269E)),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  // Partner Logos
  Widget _partnerImage(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
