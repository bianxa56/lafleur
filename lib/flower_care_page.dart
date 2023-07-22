import 'package:flutter/material.dart';

class FlowerCarePage extends StatelessWidget {
  final List<Tip> flowerTips = [
    Tip(
      'Clean your vase thoroughly. Bacteria makes flowers wilt faster',
      'assets/vase.jpg',
    ),
    Tip(
      'Trim stems at an angle to maximize water absorption.',
      'assets/trim.jpg',
    ),
    Tip(
      'Keep your flowers in a cool place, out of direct sun and drafts.',
      'assets/cool.jpg',
    ),
    Tip(
      'Change water and recut stems regularly for longer freshness.',
      'assets/water.jpg',
    ),
  ];

  final List<Tip> plantTips = [
    Tip(
      'Water your plants regularly, but avoid overwatering.',
      'assets/plant water.jpg',
    ),
    Tip(
      'Keep plants in medium-light locations – out of direct sunlight.',
      'assets/light.jpg',
    ),
    Tip(
      'Prune your plants to maintain their shape and remove dead parts.',
      'assets/prune.jpg',
    ),
    Tip(
      'Use suitable fertilizers to nourish your plants.',
      'assets/fertilizer.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower and Plant Care Tips'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Floral Arrangement Care Tips',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: flowerTips.length,
              itemBuilder: (context, index) {
                return TipCard(flowerTips[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Plant Care Tips',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: plantTips.length,
              itemBuilder: (context, index) {
                return TipCard(plantTips[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Tip {
  final String description;
  final String imagePath;

  Tip(this.description, this.imagePath);
}

class TipCard extends StatelessWidget {
  final Tip tip;

  TipCard(this.tip);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              tip.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              tip.description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
