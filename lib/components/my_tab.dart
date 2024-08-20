import 'package:flutter/material.dart';
import 'package:futur_ice_cream_v1/const.dart';

class MyTab extends StatelessWidget {
  final String iconPath;

  const MyTab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 60,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white24,
          // borderRadius: BorderRadius.circular(12),
          shape: BoxShape.circle,
          /* border: Border.all(
            color: Colors.white,
            width: 1,
          ),*/
        ),
        child: Image.asset(
          iconPath,
          color: Colors.white,
        ),
      ),
    );
  }
}
