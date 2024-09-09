import 'package:flutter/material.dart';

class Customlogoauth extends StatelessWidget {
  const Customlogoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.brown[200],
            borderRadius: BorderRadius.circular(70)
        ),
        child: Image.asset("assets/login.png",
          height: 60,),),
    );
  }
}
