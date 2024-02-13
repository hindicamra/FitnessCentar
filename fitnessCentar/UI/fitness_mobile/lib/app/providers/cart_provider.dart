import 'package:fitness_mobile/app/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> listItems = [];

  addItemToCart(CartModel cartModel) {
    listItems.add(cartModel);
  }

  removeItemFromCart(CartModel cartModel) {
    listItems.remove(cartModel);
  }
}
