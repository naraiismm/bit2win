import 'package:flutter/material.dart';
import 'package:impulse_app/pages/qrCodePage.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onGenerateQR;

  HomePage({super.key, required this.onGenerateQR});

  final List<String> _partners = [
    'lib/assets/images/bonaqua.jpeg',
    'lib/assets/images/cola.jpeg',
    'lib/assets/images/nestle.jpeg',
    'lib/assets/images/sirab.png',
    'lib/assets/images/sprite.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Banner
              Image.asset(
                'lib/assets/images/image (1).png', // Make sure to have the correct image path
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              
              // Bonus & Items Cards in a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _infoCard(
                      'Bonus Amount',
                      '150 points',
                      Icons.star,
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _infoCard(
                      'Total Items',
                      '13',
                      Icons.widgets,
                      Color(0xFFF59498),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Partners Section with Scrollable List
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Partners',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC6269E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 80, // Height of the scrolling section
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _partners.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: _partnerImage(_partners[index]),
                            );
                          },
                        ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QRCodeGeneratorPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC6269E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Generate QR Code',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bonus & Items Info Cards
  Widget _infoCard(String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC6269E),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  // Scrollable Partner Logos
  Widget _partnerImage(String imagePath) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, size: 40, color: Colors.grey);
          },
        ),
      ),
    );
  }
}