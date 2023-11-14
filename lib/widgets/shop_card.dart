import 'package:flutter/material.dart';
import 'package:inventory_list_mobile/screens/menu.dart';
import 'package:inventory_list_mobile/screens/shoplist_form.dart';

class ShopCard extends StatelessWidget {
  final InventoryItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Responsive touch area
        // Area responsive to touch
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("You pressed the ${item.name} button!"),
            ));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Item") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          }
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
