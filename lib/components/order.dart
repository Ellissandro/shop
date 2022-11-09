import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderWidget extends StatelessWidget {
  final Order order;

  const OrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ExpansionTile(
            collapsedTextColor: Colors.black,
            textColor: Colors.black,
            trailing: const Icon(
              Icons.expand_more,
            ),
            title: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text('R\$ ${order.total.toStringAsFixed(2)}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(
                  order.date,
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                height: (order.products.length * 30.0) + 10,
                child: ListView(
                  children: order.products.map(
                    (product) {
                      return SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${product.quantity}x R\$ ${product.price}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
