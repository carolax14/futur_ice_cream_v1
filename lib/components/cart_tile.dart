import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Couleur de l'ombre
            spreadRadius: 2, // Étendue de l'ombre
            blurRadius: 8, // Flou de l'ombre
            offset: const Offset(0, 4), // Décalage de l'ombre (x, y)
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
            color: iconColor, // Couleur de fond rose
            borderRadius: BorderRadius.circular(50), // Arrondir les coins
          ),
          child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white, // Couleur de l'icône en blanc pour contraste
            ),
            onPressed: () {
              _showConfirmationDialog(context);
            },
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Fond transparent pour le Dialog
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60.withOpacity(0.3), // Fond rose transparent
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
                        Navigator.of(context)
                            .pop(); // Fermer la boîte de dialogue
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
                          onPressed!(); // Exécuter l'action de suppression
                        }
                        Navigator.of(context)
                            .pop(); // Fermer la boîte de dialogue
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
