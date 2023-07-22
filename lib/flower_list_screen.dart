import 'package:flutter/material.dart';
import 'package:flutter_application_1/contacts.dart';
import './models/flower.dart';
import './flower_provider.dart';
import 'about.dart';
import 'home.dart';
import 'app_drawer.dart';

class FlowerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower List'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: FlowerDrawer(),
      body: FlowerList(),
    );
  }
}

class FlowerList extends StatefulWidget {
  @override
  _FlowerListState createState() => _FlowerListState();
}

class _FlowerListState extends State<FlowerList> {
  String filterQuery = '';
  FocusNode _searchFocusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: filterQuery);
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      filterQuery = _searchController.text.toLowerCase();
    });

    _searchFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final flowerProvider = FlowerProvider.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus(); 
    });
    return FutureBuilder<void>(
      future: flowerProvider?.fetchData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text('Error fetching flowers'),
          );
        } else {
          final flowers = flowerProvider?.flowers;
          final filteredFlowers = flowers?.where((flower) {
            final name = flower.name.toLowerCase();
            return name.contains(filterQuery);
          }).toList();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredFlowers?.length,
                  itemBuilder: (context, index) {
                    final flower = filteredFlowers?[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        title: Text(
                          flower!.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          flower.sciName,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            flower.url,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FlowerDetailsScreen(
                                flower: flower,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}

class FlowerDetailsScreen extends StatelessWidget {
  final Flower flower;

  const FlowerDetailsScreen({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flower.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(flower.url),
            SizedBox(height: 16.0),
            Text(
              (flower.name),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kingdom: ${flower.kingdom}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Family: ${flower.family}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Genus: ${flower.kingdom}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Local Name: ${flower.localName}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description: ${flower.description}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
