import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_drawer.dart';
import 'text_layout.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/logo2.png'),
            TextLayout(),
          ],
        ),
      ),
    );
  }
}
