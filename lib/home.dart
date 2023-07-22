import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'details.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;
final storageRef = FirebaseStorage.instance.ref();

// final loveImg = getImage("love.jpg");
// final imagesLove = getImage("love.jpg");
// final friendshipImg = getImage("friendship.jpg");
// final imagesFriendship = getImage("friendship.jpg");
// final sympathyImg = getImage("sympathy.jpg");
// final imagesSympathy = getImage("sympathy.jpg");
// final gratitudeImg = getImage("gratitude.jpg");
// final imagesGratitude = getImage("gratitude.jpg");
// final celebrationImg = getImage("celebration.jpg");
// final imagesCelebration = getImage("celebration.jpg");

Reference getImage(String fileName) {
  return storageRef.child(fileName);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> photoUrls = [
    // imagesLove.fullPath,
    // imagesFriendship.fullPath,
    // imagesSympathy.fullPath,
    // imagesGratitude.fullPath,
    // imagesCelebration.fullPath,
  ];

  final List<String> photoTitles = [
    'ROSE',
    // 'Friendship',
    // 'Sympathy',
    // 'Gratitude',
    // 'Celebration',
  ];

  final List<String> photoSubtitles = [
    'Flowers to express love',
    // 'Flowers to give for friends',
    // 'Flowers to express deep sympathy',
    // 'Flowers to show gratitude',
    // 'Flowers perfect to celebrate special occasions',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Fleur'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: photoUrls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(photoTitles[index]),
                  subtitle: Text(photoSubtitles[index]),
                  leading: Image.asset(photoUrls[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          photoUrl: photoUrls[index],
                          title: photoTitles[index],
                          subtitle: photoSubtitles[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      // drawer: AppDrawer(),
    );
  }
}
