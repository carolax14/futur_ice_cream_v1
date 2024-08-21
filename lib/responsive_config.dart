import 'package:flutter/material.dart';

class ResponsiveConfig {
  static double getPriceTextSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 12.0; // Small text for mobile
    } else if (width < 1200) {
      return 14.0; // Medium text for tablet
    } else {
      return 16.0; // Larger text for desktop
    }
  }

  static double getImageHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    if (height < 600) {
      return 100.0; // Small image for mobile
    } else if (height < 1200) {
      return 150.0; // Medium image for tablet
    } else {
      return 200.0; // Larger image for desktop
    }
  }

  static double getTextSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 14.0; // Small text for mobile
    } else if (width < 1200) {
      return 16.0; // Medium text for tablet
    } else {
      return 18.0; // Larger text for desktop
    }
  }

  static EdgeInsets getPadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return const EdgeInsets.all(8.0); // Small padding for mobile
    } else if (width < 1200) {
      return const EdgeInsets.all(12.0); // Medium padding for tablet
    } else {
      return const EdgeInsets.all(16.0); // Larger padding for desktop
    }
  }
}
