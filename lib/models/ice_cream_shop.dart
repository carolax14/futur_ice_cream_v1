import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';

class IceCreamShop extends ChangeNotifier {
  // List of ice creams available for sale
  final List<IceCream> _shop = [
    // Cornet category
    IceCream(
        name: 'Vanilla',
        price: '2.5',
        imagePath: "lib/images/corne_vanilla.png",
        category: 'Cornet'),
    IceCream(
        name: 'Chocolate',
        price: '3',
        imagePath: "lib/images/corne_chocolate.png",
        category: 'Cornet'),
    IceCream(
        name: 'Strawberry',
        price: '3',
        imagePath: "lib/images/corne_strawberry.png",
        category: 'Cornet'),
    IceCream(
        name: 'Caramel',
        price: '2.5',
        imagePath: "lib/images/corne_caramel.png",
        category: 'Cornet'),
    IceCream(
        name: 'Rasberry',
        price: '3.5',
        imagePath: "lib/images/corne_rasberry.png",
        category: 'Cornet'),

    // Candy category
    IceCream(
        name: 'Candy White',
        price: '3',
        imagePath: "lib/images/mag_white.png",
        category: 'Candy'),
    IceCream(
        name: 'Candy Rasberry',
        price: '3',
        imagePath: "lib/images/mag_rasberry.png",
        category: 'Candy'),
    IceCream(
        name: 'Candy Pecan',
        price: '3',
        imagePath: "lib/images/mag_pecan.png",
        category: 'Candy'),

    // Scoop category
    IceCream(
        name: 'B&J Chocolate',
        price: '3',
        imagePath: "lib/images/bj_chocolate.png",
        category: 'Scoop'),
    IceCream(
        name: 'B&J Pistachio',
        price: '3',
        imagePath: "lib/images/bj_pistachio.png",
        category: 'Scoop'),
    IceCream(
        name: 'B&J Chuncky',
        price: '3',
        imagePath: "lib/images/bj_chuncky.png",
        category: 'Scoop'),
    IceCream(
        name: 'B&J Cookie Dough',
        price: '3',
        imagePath: "lib/images/bj_cookie.png",
        category: 'Scoop'),

    // Milkshake category
    IceCream(
        name: 'Milkshake Caramel',
        price: '3',
        imagePath: "lib/images/milk_caramel.png",
        category: 'Milkshake'),
    IceCream(
        name: 'Milkshake Choco',
        price: '3',
        imagePath: "lib/images/milk_chocolate.png",
        category: 'Milkshake'),
    IceCream(
        name: 'Milkshake Oreo',
        price: '3',
        imagePath: "lib/images/milk_oreo.png",
        category: 'Milkshake'),
    IceCream(
        name: 'Milkshake Berry',
        price: '3',
        imagePath: "lib/images/milk_strawberry.png",
        category: 'Milkshake'),
  ];

  // List of ice creams in the user's cart
  final List<IceCream> _userCart = [];

  // Get the list of all ice creams available in the shop
  List<IceCream> get iceCreams => _shop;

  // Get the list of ice creams in the user's cart
  List<IceCream> get userCart => _userCart;

  /// Adds an ice cream to the user's cart.
  ///
  /// This function adds the specified ice cream to the user's cart and notifies listeners
  /// that the cart has been updated.
  ///
  /// @param iceCream The ice cream to be added to the cart.
  /// @param quantity The quantity of the ice cream to be added.
  void addItemToCart(IceCream iceCream, int quantity) {
    _userCart.add(iceCream); // Add the ice cream to the cart
    notifyListeners(); // Notify listeners that the cart has changed
  }

  /// Removes an ice cream from the user's cart.
  ///
  /// This function removes the specified ice cream from the user's cart and notifies listeners
  /// that the cart has been updated.
  ///
  /// @param iceCream The ice cream to be removed from the cart.
  void removeItemFromCart(IceCream iceCream) {
    _userCart.remove(iceCream); // Remove the ice cream from the cart
    notifyListeners(); // Notify listeners that the cart has changed
  }

  /// Filters the list of ice creams by category.
  ///
  /// This function returns a list of ice creams that match the specified category.
  ///
  /// @param category The category by which to filter the ice creams.
  /// @return A list of ice creams that belong to the specified category.
  List<IceCream> getIceCreamsByCategory(String category) {
    return _shop
        .where((iceCream) => iceCream.category == category)
        .toList(); // Return a list of ice creams matching the category
  }
}
