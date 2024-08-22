import 'package:futur_ice_cream_v1/components/ice_cream_tile.dart';
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
        // Filtrer les glaces par catégorie "Cornet"
        List<IceCream> cornetIceCreams = value.getIceCreamsByCategory('Cornet');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 15),
              child: Text(
                'Popular Cornets',
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
                itemCount: cornetIceCreams.length,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                ),
                itemBuilder: (context, index) {
                  IceCream eachIceCream = cornetIceCreams[index];
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
