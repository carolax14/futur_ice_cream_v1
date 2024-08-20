import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';
import 'package:futur_ice_cream_v1/models/ice_cream_shop.dart';
import 'package:futur_ice_cream_v1/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create the ChangeNotifierProvider widget, which provides an instance of
    return Container(
      decoration: const BoxDecoration(gradient: myGradient),
      child: ChangeNotifierProvider(
        create: (context) => IceCreamShop(),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // Set Montserrat as primary font
            scaffoldBackgroundColor:
                Colors.transparent, // Overall background color
          ),
          home: const IntroPage(),
        ),
      ),
    );
  }
}
