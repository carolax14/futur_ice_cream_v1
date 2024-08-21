import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../const.dart';
import '../models/ice_cream.dart';
import '../models/ice_cream_shop.dart';

class IceCreamOrderPage extends StatefulWidget {
  final IceCream iceCream;
  const IceCreamOrderPage({super.key, required this.iceCream});

  @override
  State<IceCreamOrderPage> createState() => _IceCreamOrderPageState();
}

class _IceCreamOrderPageState extends State<IceCreamOrderPage> {
  int quantity = 1;

  void increment() {
    setState(() {
      if (quantity < 10) {
        quantity++;
      }
    });
  }

  void decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {
    if (quantity > 0) {
      Provider.of<IceCreamShop>(context, listen: false)
          .addItemToCart(widget.iceCream, quantity);

      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 108, 209, 170),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: const SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.white, size: 40),
                SizedBox(height: 10),
                Text(
                  "Successfully added to cart",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
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
        backgroundColor: const Color.fromARGB(108, 153, 142, 224),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: buttonTextColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(108, 153, 142, 224),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // iceCream image
              Image.asset(
                widget.iceCream.imagePath,
                height: 130,
              ),

              const SizedBox(height: 50),

              // quantity
              Column(
                children: [
                  // heading
                  const Text(
                    "Q U A N T I T Y",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                        color: Colors.white,
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

                      // increment
                      IconButton(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // size
              const Text(
                "KALORIES",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "120",
                    style: TextStyle(
                        color: cardColor,
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
