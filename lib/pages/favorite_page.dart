import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/models/favorite_service.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FavoriteIceCreamsPage extends StatefulWidget {
  @override
  _FavoriteIceCreamsPageState createState() => _FavoriteIceCreamsPageState();
}

class _FavoriteIceCreamsPageState extends State<FavoriteIceCreamsPage> {
  @override
  Widget build(BuildContext context) {
    List<IceCream> favorites = FavoriteIceCreamsService.getFavorites();

    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 25, bottom: 25),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Favorite Ice Creams',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: favorites.isEmpty
                ? const Center(
                    child: Text(
                      'No favorites yet!',
                      style: TextStyle(fontSize: 20, color: Colors.white60),
                    ),
                  )
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 350.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                    itemCount: favorites.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      IceCream iceCream = favorites[itemIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              iceCream.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            iceCream.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${iceCream.price}€',
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                FavoriteIceCreamsService.removeFavorite(
                                    iceCream);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  myGradient.colors[4], // Button color
                            ),
                            child: const Text(
                              'Remove',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
