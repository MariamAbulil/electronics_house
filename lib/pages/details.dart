
import 'package:flutter/material.dart';
import 'package:mariana/shared/rating.dart';
import 'package:provider/provider.dart';
import '../model/item.dart';
import '../provider/cart.dart';
import '../shared/BottomBar.dart';
import '../shared/appbar.dart';

class Details extends StatefulWidget {
  Item product;
  Details({required this.product});

  @override
  State<Details> createState() => _DetailsState();
}
List mycolors = <Color>[
   Colors.black,
  Color.fromARGB(255, 159, 76, 76),
  Color.fromARGB(234, 198, 125, 224),
  Color.fromARGB(234, 227, 225, 143),
  Colors.grey,
  Colors.white,
];

int selectedColorIndex = -1;
Color primaryColor = mycolors[0];

class _DetailsState extends State<Details> {
  // const Details({Key? key}) : super(key: key);
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ProductsAndPrice()
        ],
        backgroundColor:Colors.brown[400],
        title: Text("Details screen",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 300,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20*1.5 ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),),
                child: Image.asset(widget.product.imgPath)),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " ${widget.product.name}",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(width: 10),

                Text(
                  "\$ ${widget.product.price}",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Colors",
                  style: TextStyle(fontSize: 20),
                ),
                for (int i = 0; i < mycolors.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedColorIndex = i;
                        primaryColor = mycolors[i];
                      });
                      // Update the selected color for the current product in the cart
                      carttt.updateColor(widget.product, primaryColor);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: mycolors[i],
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                          )
                        ],
                      ),
                      child: selectedColorIndex == i
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "New",
                      style: TextStyle(fontSize: 15),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 129, 129),
                      borderRadius: BorderRadius.circular(4),
                    )),
                SizedBox(
                  width: 5,
                ),
                Rating(),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.edit_location,
                      size: 26,
                      color: Color.fromARGB(168, 3, 65, 27),
                      // color: Color.fromARGB(255, 186, 30, 30),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.product.location,
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Details : ",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //if ()
            Text(
              "A mobile phone, or smartphone, is a portable device essential for communication and daily tasks. It combines calling and texting features with internet access and app functionality, offering convenience in a compact form. With touchscreen interfaces and versatile capabilities, mobile phones are integral to staying connected and accessing information on the go.",
              style: TextStyle(
                fontSize: 18,
              ),
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isShowMore = !isShowMore;
                  });
                },
                child: Text(
                  isShowMore ? "Show more" : "Show less",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
      backgroundColor: Colors.brown[200],
    );
  }
}
