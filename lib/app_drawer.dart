import 'package:flutter_application_1/flower_care_page.dart';

import 'about.dart';
import 'seasonal_flowers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/contacts.dart';
import 'flower_list_screen.dart';

class FlowerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/logo.jpg"), fit: BoxFit.cover)),
              child: Text(
                'La Fleur',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.purple, size: 30),
              title: Text('Home', style: TextStyle(color: Colors.purple, fontSize: 20)),  
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => FlowerListScreen(),
                 ),
                );
              },
            ),
             ListTile(
              leading: Icon(
                Icons.eco,
                color: Colors.purple,
                size: 30,
              ),
              title: Text(
                'Care Tips', style: TextStyle(color: Colors.purple, fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => FlowerCarePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_florist,
                color: Colors.purple,
                size: 30,
              ),
              title: Text(
                'Seasonal Flowers', style: TextStyle(color: Colors.purple, fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => SeasonalFlowersScreen()));
              },
            ),
            ListTile( 
              leading: Icon(Icons.email, color: Colors.purple, size: 30),
              title: Text('Contact Us', style: TextStyle(color: Colors.purple, fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage()));
              },
            ),
            ListTile( 
              leading: Icon(Icons.info, color: Colors.purple, size: 30),
              title: Text('About', style: TextStyle(color: Colors.purple, fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}