import "package:flutter/material.dart";
import "package:futur_ice_cream_v1/components/my_tab.dart";
import "package:futur_ice_cream_v1/const.dart";
import "package:futur_ice_cream_v1/pages/intro_page.dart";
import "package:futur_ice_cream_v1/pages/tabs/candy_tab.dart";
import "package:futur_ice_cream_v1/pages/tabs/cornet_tab.dart";
import "package:futur_ice_cream_v1/pages/tabs/milkshake_tab.dart";
import "package:futur_ice_cream_v1/pages/tabs/scoop_tab.dart";

/*

SHOP PAGE

User can browse the ice creams that are for sale

*/

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // List of tabs for the different categories of ice cream
  List<Widget> myTabs = const [
    MyTab(
      iconPath: 'lib/icons/cornet.png', // Cornet icon
    ),
    MyTab(
      iconPath: 'lib/icons/milkshake.png', // Milkshake icon
    ),
    MyTab(
      iconPath: 'lib/icons/scoop.png', // Scoop icon
    ),
    MyTab(
      iconPath: 'lib/icons/candy.png', // Candy icon
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length, // Number of tabs
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false, // Remove the back button
            title: const Center(
              child: Text(
                'Explore Our Flavors', // Title of the page
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app_outlined, color: buttonTextColor),
                onPressed: () {
                  // Navigate to the intro page or perform another action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                  );
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize:
                  const Size.fromHeight(140.0), // Adjust height if necessary
              child: Column(
                children: [
                  const SizedBox(
                      height: 15.0), // Space between title and search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            'Search flavors...', // Placeholder text in the search bar
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: carte, // Background color of the search bar
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 30.0), // Space between search bar and TabBar
                  TabBar(
                    tabs: myTabs, // Display the tabs
                    unselectedLabelColor:
                        Colors.white, // Color of the unselected tabs
                    indicatorSize:
                        TabBarIndicatorSize.label, // Size of the indicator
                    indicator: BoxDecoration(
                      shape: BoxShape.circle, // Shape of the indicator
                      color:
                          primaryColor, // Color of the selected tab indicator
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: const Expanded(
            child: TabBarView(
              children: [
                // Each tab corresponds to a page for each category of ice cream
                CornetTab(), // Page for Cornet
                MilkshakeTab(), // Page for Milkshake
                ScoopTab(), // Page for Scoop
                CandyTab(), // Page for Candy
              ],
            ),
          ),
        ),
      ),
    );
  }
}
