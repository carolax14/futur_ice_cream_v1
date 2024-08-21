import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/models/favorite_service.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';
import 'package:like_button/like_button.dart';

class IceCreamTile extends StatefulWidget {
  final IceCream iceCream;
  final void Function()? onPressed;

  const IceCreamTile({
    super.key,
    required this.iceCream,
    required this.onPressed,
  });

  @override
  _IceCreamTileState createState() => _IceCreamTileState();
}

class _IceCreamTileState extends State<IceCreamTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 2, // Shadow Casting Radius
              blurRadius: 8, // Shadow blur ray
              offset: const Offset(0, 4), // Shadow offset (x, y)
            ),
          ],
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
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.2), // Couleur de l'ombre
                        spreadRadius: 1, // Étendue de l'ombre
                        blurRadius: 4, // Flou de l'ombre
                        offset:
                            const Offset(0, 2), // Décalage de l'ombre (x, y)
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '${widget.iceCream.price}€',
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
              child: Image.asset(
                widget.iceCream.imagePath,
                height: 75,
                width: double.infinity,
                //fit: BoxFit.cover,
              ),
            ),

            // ice cream flavor
            Center(
              child: Text(
                widget.iceCream.name,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 0),
            const Text(
              '120 kal',
              style: TextStyle(
                color: Colors.black38,
              ),
            ),

            // Spacer to push buttons to the bottom
            const Spacer(),

            // love icon + view button
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // love icon (bottom left)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LikeButton(
                      size: 25,
                      likeBuilder: (isTapped) {
                        return Icon(
                          Icons.favorite,
                          color: isTapped
                              ? const Color(0xffe684ae)
                              : Colors.white38,
                        );
                      },
                      onTap: (isLiked) async {
                        if (isLiked) {
                          FavoriteIceCreamsService.removeFavorite(
                              widget.iceCream);
                        } else {
                          FavoriteIceCreamsService.addFavorite(widget.iceCream);
                        }
                        return !isLiked;
                      },
                    ),
                  ),

                  // view button (bottom right)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.black54,
                      ),
                      onPressed: widget.onPressed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
