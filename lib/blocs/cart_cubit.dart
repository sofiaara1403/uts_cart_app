import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  // ➕ Tambah ke keranjang
  void addToCart(ProductModel product) {
    final updated = List<Map<String, dynamic>>.from(state);

    // cek apakah product sudah ada di keranjang
    final index = updated.indexWhere(
      (item) => item["product"].id == product.id,
    );

    if (index != -1) {
      updated[index]["qty"] += 1; // tambah qty jika sudah ada
    } else {
      updated.add({
        "product": product,
        "qty": 1,
      });
    }

    emit(updated);
  }

  // ❌ Hapus item dari keranjang
  void removeFromCart(ProductModel product) {
    final updated = List<Map<String, dynamic>>.from(state);
    updated.removeWhere((item) => item["product"].id == product.id);
    emit(updated);
  }

  // 🔄 Update quantity
  void updateQuantity(ProductModel product, int qty) {
    final updated = List<Map<String, dynamic>>.from(state);

    for (var item in updated) {
      if (item["product"].id == product.id) {
        item["qty"] = qty;
      }
    }

    emit(updated);
  }

  // 🧮 Total semua item
  int getTotalItems() {
    return state.fold(0, (sum, item) => sum + (item["qty"] as int));
  }

  // 💰 Total harga keseluruhan
  int getTotalPrice() {
    return state.fold(
      0,
      (sum, item) =>
          sum + ((item["product"].price as int) * (item["qty"] as int)),
    );
  }
  
}
