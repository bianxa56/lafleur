import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import './views/flower_creator_screen.dart';
import 'flower_list_screen.dart';
import 'flower_provider.dart';
import 'models/flower.dart';
import 'flower_care_page.dart';

ThemeData themeData = ThemeData(primarySwatch: Colors.purple);

MaterialApp app = MaterialApp(
      title: 'Flower App',
      theme: themeData,
      home: FlowerProvider(
        child: FlowerListScreen(),
      ),
);

FlowerProvider provider = FlowerProvider(child: app);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return provider;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

