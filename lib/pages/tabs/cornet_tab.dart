import 'package:futur_ice_cream_v1/components/ice_cream_tile.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';
import 'package:futur_ice_cream_v1/models/ice_cream_shop.dart';
import 'package:futur_ice_cream_v1/pages/ice_cream_order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CornetTab extends StatefulWidget {
  const CornetTab({super.key});

  @override
  State<CornetTab> createState() => _CornetTabState();
}

class _CornetTabState extends State<CornetTab> {
  // coffee page
  void goToIceCreamPage(IceCream iceCream) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IceCreamOrderPage(
          iceCream: iceCream,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IceCreamShop>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // heading
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 15),
            child: Text(
              'Popular',
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 20, fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 2),

          // list of coffee
          Expanded(
            child: GridView.builder(
              itemCount: value.iceCreams.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                // get individual IceCream
                IceCream eachIceCream = value.iceCreams[index];
                // return the tile for this IceCream
                return IceCreamTile(
                  iceCream: eachIceCream,
                  onPressed: () => goToIceCreamPage(eachIceCream),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
