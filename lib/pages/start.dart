import 'package:flutter/material.dart';
import 'package:mariana/auth/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Color(0xFFB28366),
        splash:
        CircleAvatar(radius: 100,
          backgroundImage: AssetImage("assets/welcome.jpg") ,), nextScreen: Second());
  }
}

class Second extends StatelessWidget {
  const Second({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 325,
              height: 324,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Logo.png"),),),),
            SizedBox(height: 36,),
            Text("Buy Your Favorite Electronics",style: TextStyle(fontSize: 24,color: Colors.white,),),
            Padding(
              padding: const EdgeInsets.only(top: 9,bottom: 129),
              child: Text("Innovate your lifestyle with \n top-notch electronics,\n exclusively at Etectronics Store.",
                style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Login()));
              },
              child: Container(
                width: 315,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.brown[500],
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Center(child: Text("Get Started",
                  style: TextStyle(fontSize: 16,color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.brown[200],
    );
  }

}
