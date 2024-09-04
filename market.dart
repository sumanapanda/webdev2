import 'package:flutter/material.dart';

void main() => runApp(MarketApp());

class MarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agri Market',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MarketPage(),
    );
  }
}

class MarketPage extends StatelessWidget {
  final List<String> greenVegetables = [
    'Spinach',
    'Lettuce',
    'Kale',
    'Broccoli',
    'Cabbage',
  ];

  final List<String> perennialProducts = [
    'Apple',
    'Grapes',
    'Mango',
    'Orange',
    'Banana',
  ];

  final List<String> buyers = [
    'Fertilizers',
    'Seeds',
    'Tractors',
    'Pesticides',
    'Irrigation Equipment',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agri Market'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Section(
                title: 'Green Vegetables',
                items: greenVegetables,
                icon: Icons.local_florist,
                backgroundColor: Colors.green[50],
              ),
              Divider(),
              Section(
                title: 'Perennial Products',
                items: perennialProducts,
                icon: Icons.nature,
                backgroundColor: Colors.orange[50],
              ),
              Divider(),
              Section(
                title: 'Buyer\'s Products',
                items: buyers,
                icon: Icons.shopping_cart,
                backgroundColor: Colors.blue[50],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle Add Product
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<String> items;
  final IconData icon;
  final Color? backgroundColor;

  Section({
    required this.title,
    required this.items,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Icon(icon, color: Colors.green),
                  title: Text(items[index]),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${items[index]} selected')),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
