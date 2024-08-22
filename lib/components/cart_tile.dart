import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
import '../models/ice_cream.dart';

/*

CART TILE

This is the tile seen on the ice cream order page.
User can remove an item from the cart by tapping the delete icon.

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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius of the shadow
            blurRadius: 8, // Blur radius of the shadow
            offset: const Offset(0, 4), // Shadow offset (x, y)
          ),
        ],
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
        trailing: Container(
          decoration: BoxDecoration(
            color: iconColor, // Background color for the delete button
            borderRadius: BorderRadius.circular(50), // Rounded corners
          ),
          child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white, // Icon color set to white for contrast
            ),
            onPressed: () {
              _showConfirmationDialog(context);
            },
          ),
        ),
      ),
    );
  }

  /// Shows a confirmation dialog before removing the item from the cart.
  ///
  /// This method displays a dialog with "Cancel" and "Delete" options.
  /// If "Delete" is selected, the item is removed from the cart.
  ///
  /// @param context The BuildContext used to show the dialog.
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Transparent background for the dialog
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60
                  .withOpacity(0.3), // Light pink transparent background
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Confirm Deletion",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Are you sure you want to remove this item from your cart?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: iconColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (onPressed != null) {
                          onPressed!(); // Execute the delete action
                        }
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
