import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Image.network(product['image'], width: 50),
        title: Text(product['title']),
        subtitle: Text("\$${product['price']}"),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(product['description']))),
      ),
    );
  }
}
