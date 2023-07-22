import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeasonalFlowersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> seasonalFlowers = [
    {
      'name': 'Peony',
      'imagePath': 'assets/peony.jpg',
      'season': 'Spring',
    },
    {
      'name': 'Tulip',
      'imagePath': 'assets/tulip.jpg',
      'season': 'Spring',
    },
    {
      'name': 'Lily of the Valley',
      'imagePath': 'assets/lilyofthevalley.jpg',
      'season': 'Spring',
    },
    {
      'name': 'Sunflower',
      'imagePath': 'assets/sunflower.jpg',
      'season': 'Summer',
    },
    {
      'name': 'Dahlia',
      'imagePath': 'assets/dahlia.jpg',
      'season': 'Summer',
    },
    {
      'name': 'Bougainvilleas',
      'imagePath': 'assets/bougainvilleas.jpg',
      'season': 'Summer',
    },
    {
      'name': 'Bidens',
      'imagePath': 'assets/bidens.jpg',
      'season': 'Fall',
    },
    {
      'name': 'Aster',
      'imagePath': 'assets/aster.jpg',
      'season': 'Fall',
    },
    {
      'name': 'Marigold',
      'imagePath': 'assets/marigold.jpg',
      'season': 'Fall',
    },
    {
      'name': 'Poinsettia',
      'imagePath': 'assets/poinsettia.jpg',
      'season': 'Winter',
    },
    {
      'name': 'Camellias',
      'imagePath': 'assets/Camellias.jpg',
      'season': 'Winter',
    },
    {
      'name': 'Hellebores',
      'imagePath': 'assets/Hellebores.jpg',
      'season': 'Winter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seasonal Flowers'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Spring Flowers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (int index = 0; index < seasonalFlowers.length; index++)
                  if (seasonalFlowers[index]['season'] == 'Spring')
                    Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              seasonalFlowers[index]['imagePath'],
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            seasonalFlowers[index]['name'],
                            style: GoogleFonts.openSans(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Summer Flowers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (int index = 0; index < seasonalFlowers.length; index++)
                  if (seasonalFlowers[index]['season'] == 'Summer')
                    Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              seasonalFlowers[index]['imagePath'],
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            seasonalFlowers[index]['name'],
                            style: GoogleFonts.openSans(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Fall Flowers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (int index = 0; index < seasonalFlowers.length; index++)
                  if (seasonalFlowers[index]['season'] == 'Fall')
                    Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              seasonalFlowers[index]['imagePath'],
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            seasonalFlowers[index]['name'],
                            style: GoogleFonts.openSans(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Winter Flowers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (int index = 0; index < seasonalFlowers.length; index++)
                  if (seasonalFlowers[index]['season'] == 'Winter')
                    Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              seasonalFlowers[index]['imagePath'],
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            seasonalFlowers[index]['name'],
                            style: GoogleFonts.openSans(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
