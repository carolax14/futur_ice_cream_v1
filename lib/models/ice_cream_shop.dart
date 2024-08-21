import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/models/ice_cream.dart';

class IceCreamShop extends ChangeNotifier {
  // ice cream for sale list
  final List<IceCream> _shop = [
    /***** Cornet *****/
    IceCream(
        name: 'Vanilla',
        price: '2.5',
        imagePath: "lib/images/corne_vanilla.png",
        category: 'Cornet'), // Définir la catégorie
    IceCream(
        name: 'Chocolate',
        price: '3',
        imagePath: "lib/images/corne_chocolate.png",
        category: 'Cornet'), // Définir la catégorie
    IceCream(
        name: 'Strawberry',
        price: '3',
        imagePath: "lib/images/corne_strawberry.png",
        category: 'Cornet'), // Définir la catégorie
    IceCream(
        name: 'Caramel',
        price: '2.5',
        imagePath: "lib/images/corne_caramel.png",
        category: 'Cornet'), // Définir la catégorie
    IceCream(
        name: 'Rasberry',
        price: '3.5',
        imagePath: "lib/images/corne_rasberry.png",
        category: 'Cornet'),

/***** Candy *****/
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
    // Définir la catégorie

    /***** Scoop *****/
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
    /***** Milkshake *****/
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

  // user cart
  final List<IceCream> _userCart = [];

  // get ice cream list
  List<IceCream> get iceCreams => _shop;

  //get user cart
  List<IceCream> get userCart => _userCart;

  // add ice cream to cart
  void addItemToCart(IceCream iceCream, int quantity) {
    _userCart.add(iceCream);
    notifyListeners();
  }

  // remove ice cream from cart
  void removeItemFromCart(IceCream iceCream) {
    _userCart.remove(iceCream);
    notifyListeners();
  }

  // filter ice creams by category
  List<IceCream> getIceCreamsByCategory(String category) {
    return _shop.where((iceCream) => iceCream.category == category).toList();
  }
}
