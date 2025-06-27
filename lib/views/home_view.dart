import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<dynamic>> _products;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _products = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Search Products',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (val) {
              setState(() {}); // trigger rebuild for filtering
            },
          ),
        ),
        Expanded(
          child: FutureBuilder<List<dynamic>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final filtered = snapshot.data!
                    .where(
                      (p) => p['title'].toLowerCase().contains(
                        _searchController.text.toLowerCase(),
                      ),
                    )
                    .toList();

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) =>
                      ProductCard(product: filtered[index]),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
