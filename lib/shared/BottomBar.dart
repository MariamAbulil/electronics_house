import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../pages/checkout.dart';
import '../pages/home.dart';
import '../pages/smartwatch.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 65,
      backgroundColor: Colors.brown,
      color: Colors.white,
      animationDuration: Duration(milliseconds: 300), // Set animation duration
      animationCurve: Curves.easeInOut, // Set animation curve
      buttonBackgroundColor: Colors.white,
      items: [
        Icon(Icons.home, color: Colors.brown[500], size: 32),
        Icon(Icons.watch, color: Colors.brown[500], size: 32),
        Icon(Icons.shopping_cart, color: Colors.brown[500], size: 32),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => smartwatch()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOut()),
            );
            break;
        }
      },
    );
  }
}
