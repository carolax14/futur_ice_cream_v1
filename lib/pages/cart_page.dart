import "package:flutter/material.dart";
import "package:futur_ice_cream_v1/components/cart_tile.dart";
import "package:futur_ice_cream_v1/models/ice_cream.dart";
import "package:futur_ice_cream_v1/models/ice_cream_shop.dart";
import "package:provider/provider.dart";

import "../components/my_button.dart";

/*

CART PAGE

  - User can check their cart and remove items if necessary
  - User can tap 'Pay now' button €

*/
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove an item from the user's cart
  void removeItemFromCart(IceCream iceCream) {
    Provider.of<IceCreamShop>(context, listen: false)
        .removeItemFromCart(iceCream);
  }

  // pay button tapped
  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<IceCreamShop>(
      builder: (context, value, child) => Column(
        children: [
          // heading
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 25, bottom: 25),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),

          // list of cart items
          Expanded(
            child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
                // get individual cart items
                IceCream iceCream = value.userCart[index];

                // return as a list tile
                return CartTile(
                  iceCream: iceCream,
                  onPressed: () => removeItemFromCart(iceCream),
                );
              },
            ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: MyButton(text: "Pay now", onTap: payNow),
          )
        ],
      ),
    );
  }
}
