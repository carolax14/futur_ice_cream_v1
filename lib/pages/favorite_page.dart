import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/models/favorite_service.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FavoriteIceCreamsPage extends StatefulWidget {
  @override
  _FavoriteIceCreamsPageState createState() => _FavoriteIceCreamsPageState();
}

class _FavoriteIceCreamsPageState extends State<FavoriteIceCreamsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<IceCream> favorites = FavoriteIceCreamsService.getFavorites();

    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 25, bottom: 25),
            child: Row(
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
                ? Center(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _animation.value),
                          child: Image.asset(
                            'lib/icons/broken-heart.png', // Replace with the correct path to your heart image
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
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
                          const Duration(milliseconds: 900),
                      viewportFraction: 0.8,
                    ),
                    itemCount: favorites.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      IceCream iceCream = favorites[itemIndex];
                      return Container(
                        width: MediaQuery.of(context).size.width *
                            0.85, // Adjust width to 85% of screen
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.1), // Shadow color
                              spreadRadius: 2, // Shadow Expanse
                              blurRadius: 8, // Shadow Blur
                              offset:
                                  const Offset(0, 4), // Shadow offset (x, y)
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image of ice
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  iceCream.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Name of ice cream
                            Text(
                              iceCream.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            // Ice cream prices
                            Text(
                              '${iceCream.price}€',
                              style: const TextStyle(
                                color: Colors.black38,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Delete button at the bottom
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: iconColor, // Button color
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    FavoriteIceCreamsService.removeFavorite(
                                        iceCream);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
