import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/models/favorite_service.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';
import 'package:like_button/like_button.dart';
// Importez le service de favoris

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
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: secondaryHeaderColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
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
              child: Image.asset(widget.iceCream.imagePath),
            ),

            // ice cream flavor
            Text(
              widget.iceCream.name,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LikeButton(
                      size: 25,
                      likeBuilder: (isTapped) {
                        return Icon(
                          Icons.favorite,
                          color: isTapped
                              ? const Color.fromARGB(204, 187, 10, 99)
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

                  // view button
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black54,
                    ),
                    onPressed: widget.onPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
