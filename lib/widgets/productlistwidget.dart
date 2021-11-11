import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_roleperm/models/products.dart';
import 'package:flutter_auth_roleperm/screens/productdetailsscreen.dart';

class ProductListWidget extends StatelessWidget {
  final List<Products> products;

  const ProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.isEmpty ? 0 : products.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Card(
            color: const Color.fromARGB(255, 252, 142, 54),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(products: products[index])),
                );
              },
              child: ListTile(
                leading: const Icon(
                  Icons.group_work,
                  size: 48,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  products[index].prodName.toString(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                subtitle: Text(
                  products[index].prodDescription.toString(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
