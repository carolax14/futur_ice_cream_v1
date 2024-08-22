import 'package:flutter/material.dart';

// Background gradient for the entire app
const LinearGradient myGradient = LinearGradient(
  colors: [Color(0xff77a1d3), Color(0xff79cbca), Color(0xffe684ae)],
  stops: [0, 0.5, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

Color titleColor = const Color(0xff5e5bb6); // A darker version of purple
Color subtitleColor = const Color(0xff357b9e); // A soft blue
Color iconColor = const Color(0xffc166a1); // A bright but slightly muted pink
Color secondaryButtonColor = const Color(0xffd77a7a); // A muted coral
Color buttonTextColor =
    Colors.white.withOpacity(0.9); // A very light white-grey
Color borderColor = const Color(0xffd1dbe5); // A light grey for borders

// Colors
var primaryColor =
    const Color(0xff998ee0); // Use the primary color for navigation actions
var hintColor = const Color(0xffe17dc2);

// Text Theme
var displayLarge =
    const TextStyle(color: Color(0xff5e5bb6), fontWeight: FontWeight.bold);
var titleMedium = const TextStyle(color: Color(0xff357b9e));
var bodyLarge = const TextStyle(color: Color(0xff357b9e));
var labelLarge = TextStyle(color: Colors.white.withOpacity(0.9));

// Button Theme
var buttonColor = const Color(0xffe684ae); // Main button color
var textTheme = ButtonTextTheme.primary;

var cardColor = const Color(0xfff0f4f8);
var dividerColor = const Color(0xffd1dbe5);

var backgroundColor = Colors.grey[300];
var carte = Colors.grey[200];
// Secondary Accent
var bodyText1 = const Color(0xFF2E2E2E); // Main Text


