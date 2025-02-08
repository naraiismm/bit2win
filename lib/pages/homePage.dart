import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onGenerateQR;

  const HomePage({super.key, required this.onGenerateQR});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _infoCard('Bonus Amount', '150 points', Icons.star, Colors.orange),
              const SizedBox(height: 20),
              _infoCard('Trash Weight', '5.2 kg', Icons.recycling, Colors.green),
              const SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Partners:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      _partnerTile('Company 1', 'assets/image.png'),
                      _partnerTile('Company 2', 'assets/image.png'),
                      _partnerTile('Company 3', 'assets/image.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: onGenerateQR,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Generate QR Code', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value, IconData icon, Color color) {
    return Card(
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  Widget _partnerTile(String name, String imagePath) {
    debugPrint('Loading asset: $imagePath'); // ✅ Debugging asset path

    return ListTile(
      leading: Image(image: AssetImage(imagePath), width: 40, height: 40, fit: BoxFit.cover),
      title: Text(name, style: const TextStyle(fontSize: 16)),
    );
  }
}
