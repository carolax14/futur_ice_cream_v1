import "package:flutter/material.dart";
import "package:futur_ice_cream_v1/const.dart";
import "package:futur_ice_cream_v1/models/ice_cream.dart";

/*

ICE CREAM TILE

This is the tile seen on the shop page.
User can add to cart by tapping the tile.

*/

// ignore: must_be_immutable
class IceCreamTile extends StatelessWidget {
  final IceCream iceCream;
  void Function()? onPressed;
  bool isFavorited = false;
  IceCreamTile({
    super.key,
    required this.iceCream,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '${iceCream.price}€',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),

            // ice cream picture
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 54.0, vertical: 0),
              child: Image.asset(iceCream.imagePath),
            ),

            // ice cream flavor
            Text(
              iceCream.name,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 0),
            const Text(
              '120 kal',
              style: TextStyle(
                color: Colors.black38,
              ),
            ),

            // love icon + view button
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // love icon
                  IconButton(
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.red : Colors.black26,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                  ),

                  // view button
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black54,
                    ),
                    onPressed: onPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
