import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../shared/appbar.dart';
import 'home.dart';

class CheckOut extends StatelessWidget {
  //const CheckOut({Key? key}) : super(key: key);
  List<Map<String, dynamic>> mycolors = [
    {'color': Colors.black, 'name': 'Black'},
    {'color': Color.fromARGB(255, 159, 76, 76), 'name': 'Reddish'},
    {'color': Color.fromARGB(234, 198, 125, 224), 'name': 'Lavender'},
    {'color': Color.fromARGB(234, 227, 225, 143), 'name': 'Gold'},
    {'color': Colors.grey, 'name': 'Grey'},
    {'color': Colors.white, 'name': 'White'},
  ];
  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Checkout Screen", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [ProductsAndPrice()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: carttt.selectedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(carttt.selectedProducts[index].name),
                      subtitle: Text(
                        "${carttt.selectedProducts[index].price} - ${carttt.selectedProducts[index].location} - \n Color: ${getColorName(carttt.selectedProducts[index].selectedColor)}",
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(carttt.selectedProducts[index].imgPath),
                        backgroundColor: carttt.selectedProducts[index].selectedColor,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          carttt.delete(carttt.selectedProducts[index]);
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text("Are You Sure  ?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          carttt.deleteall();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>AnimatedSplashScreen(splashIconSize: 200,
                                  splashTransition: SplashTransition.fadeTransition,
                                  backgroundColor: Color(0xFFB28366),
                                  splash:
                                  CircleAvatar(radius: 100,
                                    backgroundImage: AssetImage("assets/order.jpg") ,), nextScreen: Home()),
                            ),
                          );
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.brown[700]),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            child: Text(
              "Pay \$${carttt.price}",
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.brown[200],
    );
  }

  String getColorName(Color? color) {
    if (color == null) {
      return "N/A";
    }

    for (var colorMap in mycolors) {
      if (colorMap['color'] == color) {
        return colorMap['name'];
      }
    }

    return "Unknown";
  }
}
