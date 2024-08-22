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

  // Function to increment the quantity of ice cream
  void increment() {
    setState(() {
      // Maximum quantity is 10
      if (quantity < 10) {
        quantity++;
      }
    });
  }

  // Function to decrement the quantity of ice cream
  void decrement() {
    // Prevent the quantity from going below 0
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  // Function to add the selected ice cream to the cart
  void addToCart() {
    // Only add to cart if quantity is greater than 0
    if (quantity > 0) {
      // Add the ice cream to the cart using the Provider
      Provider.of<IceCreamShop>(context, listen: false)
          .addItemToCart(widget.iceCream, quantity);

      // Close the order page and return to the shop page
      Navigator.pop(context);

      // Show a dialog to confirm the successful addition of the item to the cart
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
              // Ice cream image
              Image.asset(
                widget.iceCream.imagePath,
                height: 130,
              ),

              const SizedBox(height: 50),

              // Quantity selection
              Column(
                children: [
                  // Heading for quantity
                  const Text(
                    "Q U A N T I T Y",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  // Counter for quantity selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Decrement button
                      IconButton(
                        onPressed: decrement,
                        icon: const Icon(Icons.remove),
                        color: Colors.white,
                      ),

                      // Display the current quantity
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

                      // Increment button
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

              // Display the number of calories
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

              // Button to add the ice cream to the cart
              MyButton(text: "Add to cart", onTap: addToCart),
            ],
          ),
        ),
      ),
    );
  }
}
