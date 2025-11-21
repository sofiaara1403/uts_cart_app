import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../blocs/cart_cubit.dart';

class CartHomePage extends StatelessWidget {
  CartHomePage({super.key});

  final List<ProductModel> dummyProducts = [
    ProductModel(
      id: "1",
      name: "Gitar Pink",
      price: 5000000,
      image: "assets/images/gitar_pink.png",
    ),
    ProductModel(
      id: "2",
      name: "Gitar Biru",
      price: 7000000,
      image: "assets/images/gitar_biru.png",
    ),
    ProductModel(
      id: "3",
      name: "Gitar Ungu",
      price: 10000000,
      image: "assets/images/gitar_ungu.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: const Text(
          "Toko Gitar Aesthetic 💗",
          style: TextStyle(fontFamily: "Comic Sans MS"),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade400,
        child: const Icon(Icons.shopping_cart),
        onPressed: () => Navigator.pushNamed(context, "/summary"),
      ),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(12),
        children: dummyProducts.map((p) {
          return ProductCard(
            product: p,
            onAdd: () => context.read<CartCubit>().addToCart(p),
          );
        }).toList(),
      ),
    );
  }
}
