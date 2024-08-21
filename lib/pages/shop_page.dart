import "package:flutter/material.dart";
import "package:futur_ice_cream_v1/components/my_tab.dart";
import "package:futur_ice_cream_v1/const.dart";
import "package:futur_ice_cream_v1/pages/intro_page.dart";
import "package:futur_ice_cream_v1/pages/tabs/candy_tab.dart";
import "package:futur_ice_cream_v1/pages/tabs/cornet_tab.dart";
import "package:futur_ice_cream_v1/pages/tabs/milkshake_tab.dart";
import "package:futur_ice_cream_v1/pages/tabs/scoop_tab.dart";
import 'package:google_fonts/google_fonts.dart';

/*

SHOP PAGE

User can browse the ice cream that are for sale

*/

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Widget> myTabs = const [
    // donut tab
    MyTab(
      iconPath: 'lib/icons/cornet.png',
    ),

    // burger tab
    MyTab(
      iconPath: 'lib/icons/milkshake.png',
    ),

    // smoothie tab
    MyTab(
      iconPath: 'lib/icons/scoop.png',
    ),

    // pancake tab
    MyTab(
      iconPath: 'lib/icons/candy.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Center(
              child: Text(
                'Explore Our Flavors',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app_outlined, color: buttonTextColor),
                onPressed: () {
                  // Naviguer vers la page des paramètres ou exécuter une autre action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                  );
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(
                  140.0), // Ajustez la hauteur si nécessaire
              child: Column(
                children: [
                  /*Center(
                    child: Text(
                      'Explore Our Flavors',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: button),
                    ),
                  ),*/
                  const SizedBox(
                      height:
                          15.0), // Espace entre le titre et la barre de recherche
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search flavors...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: carte,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          30.0), // Espace entre la barre de recherche et le TabBar
                  TabBar(
                    tabs: myTabs,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        shape: BoxShape.circle, color: primaryColor),
                  ),
                ],
              ),
            ),
          ),
          body: // tab bar view
              const Expanded(
            child: TabBarView(
              children: [
                // cornet page
                CornetTab(),

                // milkshake page
                MilkshakeTab(),

                // scoop page
                ScoopTab(),

                // candy page
                CandyTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
