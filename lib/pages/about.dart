import 'dart:ui';
import 'package:flutter/material.dart';


class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text(
          "About Electro House Store",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/store.jpeg"),
            fit: BoxFit.cover,
          ),

        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "Welcome to Electro House Store, your premier online destination for cutting-edge technology. Explore our diverse selection of the latest smartphones, stylish smartwatches, efficient chargers, and more. At Electro House, we are committed to providing a unique and reliable shopping experience where technology meets high performance. Discover the future of tech with us and enjoy a wide range of high-quality products that cater to all your daily needs.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Contact our support team via email at support@electrohouse.com for assistance anytime",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.email_outlined),
                        Text(
                          "support@electrohouse.com",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
