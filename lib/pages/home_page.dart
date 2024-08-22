import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/pages/cart_page.dart';
import 'package:futur_ice_cream_v1/pages/shop_page.dart';
import 'package:futur_ice_cream_v1/pages/favorite_page.dart';

/*
HOME PAGE

This page acts as the main container for the app, providing a bottom navigation bar
to switch between different pages: Shop, Favorites, and Cart.
*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index to track the selected tab in the bottom navigation bar
  int _selectedIndex = 0;

  // Function to navigate between different pages based on the selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  // List of pages to display based on the selected index
  final List<Widget> _pages = [
    const ShopPage(), // Page to browse available ice creams
    const FavoriteIceCreamsPage(), // Page to view favorite ice creams
    const CartPage(), // Page to view the shopping cart
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        automaticallyImplyLeading: false, // Remove the back button
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex, // Set the currently selected index
        height: 60.0, // Set the height of the navigation bar
        items: <Widget>[
          Icon(Icons.home, size: 30, color: buttonTextColor),
          Icon(Icons.favorite, size: 30, color: buttonTextColor),
          Icon(Icons.shopping_bag, size: 30, color: buttonTextColor),
        ],
        color: Colors.white30,
        buttonBackgroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut, // Animation curve for transitions
        animationDuration:
            const Duration(milliseconds: 600), // Duration of the animation
        onTap: (index) => navigateBottomBar(index), // Handle the tab selection
      ),
      body: _pages[_selectedIndex], // Display the selected page
    );
  }
}
