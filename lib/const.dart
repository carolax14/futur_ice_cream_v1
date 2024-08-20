import 'package:flutter/material.dart';

// background color for entire app

const LinearGradient myGradient = LinearGradient(
  colors: [
    Color(0xff8bdeda),
    Color(0xff43add0),
    Color(0xff998ee0),
    Color(0xffe17dc2),
    Color(0xffef9393)
  ],
  stops: [0, 0.25, 0.5, 0.75, 1],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

var backgroundColor = Colors.grey[300];
var button = Colors.brown[600];
var carte = Colors.grey[200];
var iconActive = Colors.grey[700];
var iconNonActive = Colors.grey[400];
var price = Colors.brown[400];

var primaryColor = Color(0xff7aa1d2); // Accent Principal
var accentColor = const Color(0xFF92FE9D); // Second Accent
var bodyText1 = const Color(0xFF2E2E2E); // Texte Principal
var bodyText2 = const Color(0xFF757575); // Texte Secondaire
var buttonColor = const Color(0xffcc95c0);
var highlightColor = Color(0xffdbd4b4); // Éléments Interactifs
var secondaryHeaderColor = const Color(0xFF8A00D4);// Détails Futuristes

