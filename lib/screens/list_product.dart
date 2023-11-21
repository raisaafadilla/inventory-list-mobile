import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory_list_mobile/models/product.dart';
import 'package:inventory_list_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:inventory_list_mobile/screens/detail_page.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
    Future<List<Product>> fetchProduct() async {
    // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
        // var url = Uri.parse(
        //     'http://"http://127.0.0.1:8000/json/');
        // var response = await http.get(
        //     url,
        //     headers: {"Content-Type": "application/json"},
        // );

        // // decode the response to JSON
        // var data = jsonDecode(utf8.decode(response.bodyBytes));
        final request = context.watch<CookieRequest>();
        final response = await request.get('http://127.0.0.1:8000/json/');

        // convert the JSON to Product object
        List<Product> list_product = [];
        for (var d in response) {
            if (d != null) {
                list_product.add(Product.fromJson(d));
            }
        }
        return list_product;    
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
        future: fetchProduct(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return const Column(
                children: [
                    Text(
                    "No product data available.",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => DetailPage(
                            item: snapshot.data![index],
                        ),
                        ),
                    );
                    },
                    child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.amounts}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.description}")
                        ],
                    ),
                    ),
                ),
                );
            }
            }
        },
        ),
    );
    }
}
