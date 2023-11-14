import 'package:flutter/material.dart';
import 'package:inventory_list_mobile/widgets/left_drawer.dart';
import 'package:inventory_list_mobile/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<InventoryItem> items = [
    InventoryItem("View Items", Icons.checklist, Colors.red),
    InventoryItem("Add Item", Icons.add_shopping_cart, Colors.blue),
    InventoryItem("Logout", Icons.logout, Colors.yellow),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text(
              'Inventory List',
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          // Add drawer as parameter of the Scaffold widget
          drawer: const LeftDrawer(),
          body: SingleChildScrollView(
            // Scrolling wrapper widget
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding for the page
              child: Column(
                // Widget to display children vertically
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Text widget to display text with center alignment and appropriate style
                    child: Text(
                      'Inventory List', // Text indicating the shop name
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              // Grid layout
                GridView.count(
                  // Container for our cards.
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: items.map((InventoryItem item) {
                    // Iteration for each item
                    return ShopCard(item);
                  }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class InventoryItem {
  final String name;
  final IconData icon;
  final Color color;

  InventoryItem(this.name, this.icon, this.color);
}