import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

class QRCodeGeneratorPage extends StatefulWidget {
  @override
  _QRCodeGeneratorPageState createState() => _QRCodeGeneratorPageState();
}

class _QRCodeGeneratorPageState extends State<QRCodeGeneratorPage> {
  String _qrData = "";

  String _generateRandomQRCode() {
    final random = Random();
    return "QR-${random.nextInt(1000000)}"; // Generates a unique QR code each time
  }

  void _generateQR() {
    setState(() {
      _qrData = _generateRandomQRCode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Generator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Click the button to generate a QR Code", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQR,
              child: Text("Generate QR Code"),
            ),
            SizedBox(height: 20),
            _qrData.isNotEmpty
                ? QrImageView(
                    data: _qrData,
                    size: 200,
                    backgroundColor: Colors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}