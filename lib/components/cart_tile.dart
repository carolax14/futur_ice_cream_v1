import 'package:flutter/material.dart';
import '../models/ice_cream.dart';

/*

CART TILE

This is the tile seen on the iceCream order page.
User can remove from cart by tapping the tile.


*/

// ignore: must_be_immutable
class CartTile extends StatelessWidget {
  final IceCream iceCream;
  void Function()? onPressed;
  CartTile({
    super.key,
    required this.iceCream,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        leading: Image.asset(iceCream.imagePath),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            iceCream.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text('${iceCream.price}€'),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.black54,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
