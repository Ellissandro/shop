import 'dart:math';

import 'package:flutter/material.dart';

import 'cart.dart';
import 'order.dart';

class OrderList with ChangeNotifier {
  final String _token;
  final List<Order> _items = [];

  OrderList(this._token);

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        products: cart.itemsValue,
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
