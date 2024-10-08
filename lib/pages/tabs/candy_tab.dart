import 'package:futur_ice_cream_v1/components/ice_cream_tile.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';
import 'package:futur_ice_cream_v1/models/ice_cream_shop.dart';
import 'package:futur_ice_cream_v1/pages/ice_cream_order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CandyTab extends StatefulWidget {
  const CandyTab({super.key});

  @override
  State<CandyTab> createState() => _CandyTabState();
}

class _CandyTabState extends State<CandyTab> {
  // Function to navigate to the IceCreamOrderPage when a user selects an ice cream
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
      builder: (context, value, child) {
        // Filtrer les glaces par catégorie "Candy"
        List<IceCream> candyIceCreams = value.getIceCreamsByCategory('Candy');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 15),
              child: Text(
                'Popular Candys',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              child: GridView.builder(
                itemCount: candyIceCreams.length,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                ),
                itemBuilder: (context, index) {
                  IceCream eachIceCream = candyIceCreams[index];
                  return IceCreamTile(
                    iceCream: eachIceCream,
                    onPressed: () => goToIceCreamPage(eachIceCream),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
