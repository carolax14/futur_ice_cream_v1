import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../const.dart';
import '../models/ice_cream.dart';
import '../models/ice_cream_shop.dart';

/*

iceCream ORDER PAGE

User can select the quantity and size of their iceCream order.
User can 'Add to cart' on this page

*/

class IceCreamOrderPage extends StatefulWidget {
  final IceCream iceCream;
  const IceCreamOrderPage({super.key, required this.iceCream});

  @override
  State<IceCreamOrderPage> createState() => _IceCreamOrderPageState();
}

class _IceCreamOrderPageState extends State<IceCreamOrderPage> {
  // quantity of order
  int quantity = 1;

  // increment quantity
  void increment() {
    setState(() {
      // max out at 10
      if (quantity < 10) {
        quantity++;
      }
    });
  }

  // decrement quantity
  void decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  // add to cart
  void addToCart() {
    // only add to cart if quantity is greater than 0
    if (quantity > 0) {
      Provider.of<IceCreamShop>(context, listen: false)
          .addItemToCart(widget.iceCream, quantity);

      // pop order screen to go back to shop page
      Navigator.pop(context);

      // let the user know that item was added to cart successfully
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: buttonColor,
          title: const Center(
            child: Text(
              "Successfully added to cart",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[900],
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // iceCream image
              Image.asset(
                widget.iceCream.imagePath,
                height: 120,
              ),

              const SizedBox(height: 50),

              // quantity
              Column(
                children: [
                  // heading
                  const Text(
                    "Q U A N T I T Y",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  // counter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // decrement
                      IconButton(
                        onPressed: decrement,
                        icon: const Icon(Icons.remove),
                        color: Colors.grey,
                      ),

                      // count
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: bodyText1,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),

                      // icrement
                      IconButton(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // size
              const Text(
                "KALORIES",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "120 kal",
                    style: TextStyle(
                        color: bodyText1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),

              const SizedBox(height: 75),

              // add to cart button
              MyButton(text: "Add to cart", onTap: addToCart),
            ],
          ),
        ),
      ),
    );
  }
}
