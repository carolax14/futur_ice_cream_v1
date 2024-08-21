import 'package:flutter/material.dart';

// background color for entire app

const LinearGradient myGradient = LinearGradient(
  colors: [Color(0xff77a1d3), Color(0xff79cbca), Color(0xffe684ae)],
  stops: [0, 0.5, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

Color titleColor = const Color(0xff5e5bb6); // Une version plus foncée du violet
Color subtitleColor = const Color(0xff357b9e); // Un bleu doux
Color iconColor = const Color(0xffc166a1); // Un rose vif mais un peu atténué
Color secondaryButtonColor = const Color(0xffd77a7a); // Un corail atténué
Color buttonTextColor =
    Colors.white.withOpacity(0.9); // Un blanc-gris très léger
Color borderColor = const Color(0xffd1dbe5); // Un gris clair pour les bordures

// Colors
var primaryColor = const Color(
    0xff998ee0); // Utiliser la couleur principale pour les actions de navigation
var hintColor = const Color(0xffe17dc2);

// Text Theme
var displayLarge =
    const TextStyle(color: Color(0xff5e5bb6), fontWeight: FontWeight.bold);
var titleMedium = const TextStyle(color: Color(0xff357b9e));
var bodyLarge = const TextStyle(color: Color(0xff357b9e));
var labelLarge = TextStyle(color: Colors.white.withOpacity(0.9));

// Button Theme
var buttonColor = const Color(0xffe684ae); // Couleur des boutons principaux
var textTheme = ButtonTextTheme.primary;

var cardColor = const Color(0xfff0f4f8);
var dividerColor = const Color(0xffd1dbe5);

var backgroundColor = Colors.grey[300];
var carte = Colors.grey[200];
// Second Accent
var bodyText1 = const Color(0xFF2E2E2E); // Texte Principal
var bodyText2 = const Color(0xFF757575); // Texte Secondaire

var highlightColor = const Color(0xffef9393); // Éléments Interactifs
