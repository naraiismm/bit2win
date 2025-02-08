import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: John Doe', style: TextStyle(fontSize: 18)),
          Text('Email: johndoe@example.com'),
          Text('Phone: +123456789'),
          Text('Address: 123 Recycle St, Green City'),
        ],
      ),
    );
  }
}