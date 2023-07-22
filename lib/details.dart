import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String photoUrl;
  final String title;
  final String subtitle;

  DetailsPage({
    required this.photoUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Image.asset(photoUrl),
        ],
      ),
    );
  }
}