import 'package:flutter/material.dart';
import 'package:inventory_list_mobile/models/product.dart';

class DetailPage extends StatelessWidget {
  final Product item;

  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), 
          ),
          margin: const EdgeInsets.all(40.0),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.fields.name,
                  style: const TextStyle(
                    fontSize: 28.0, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Amount: ${item.fields.amounts}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 15),
                Text(
                  "Description: ${item.fields.description}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.pop(context); 
    //     },
    //     child: const Icon(Icons.arrow_back),
    //   ),
    );
  }
}