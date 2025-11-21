import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>();

    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: const Text("Ringkasan Belanja 💕",
          style: TextStyle(fontFamily: "Comic Sans MS")
        ),
        backgroundColor: Colors.pink.shade300,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: cart.state.map((item) {
                return ListTile(
                  tileColor: Colors.pink.shade50,
                  leading: Image.network(item["product"].image, width: 50),
                  title: Text(item["product"].name),
                  subtitle: Text("Qty: ${item["qty"]}"),
                  trailing: Text("Rp ${item["product"].price * item["qty"]}"),
                );
              }).toList(),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.pink.shade200,
            ),
            child: Text(
              "Total: Rp ${cart.getTotalPrice()}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Comic Sans MS",
              ),
            ),
          )
        ],
      ),
    );
  }
}
