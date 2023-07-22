import 'package:flutter/material.dart';
import './models/flower.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlowerProvider extends InheritedWidget {
  final flowers = <Flower>[];

  FlowerProvider({Key? key, Widget? child}) : super(key: key, child: child!);

  Future<void> fetchData() async {
    flowers.clear();
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('flowers')
        .get();

    querySnapshot.docs.forEach((doc) {
      
      final flower = Flower(
        name: doc["name"],
        sciName: doc["sciName"],
        kingdom: doc["kingdom"],
        family: doc["family"],
        genus: doc["genus"],
        localName: doc["localName"],
        description: doc["description"],
        url: doc["url"],
      );
      flowers.add(flower);
    });
  } catch (e) {
    print('Error fetching flowers: $e');
  }

  print('Fetched ${flowers.length} flowers'); // Print the number of fetched flowers for debugging
}

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static FlowerProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlowerProvider>();
  }
}