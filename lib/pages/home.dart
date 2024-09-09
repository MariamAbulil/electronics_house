// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mariana/pages/smartwatch.dart';
import 'package:mariana/pages/start.dart';
import 'package:mariana/shared/BottomBar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/item.dart';
import '../provider/cart.dart';
import '../shared/appbar.dart';
import 'about.dart';
import 'checkout.dart';
import 'details.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final carttt = Provider.of<Cart>(context);

    //final _auth=FirebaseAuth.instance;

    //late User signedInUser;
      //  void getCurrentUser(){
      //final user=_auth.currentUser;
     // if (user != null){
      //  signedInUser = user;
      //  print(signedInUser.email);
      //}
   // }
    return Scaffold(
        body:
        Padding(
          padding: const EdgeInsets.only(top: 22),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 33),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                   Navigator.push(
                      context,
                     MaterialPageRoute(
                        builder: (context) => Details(product: items[index]),
                   ),
                    );
                  },
                  child: GridTile(
                    child: Stack(children: [
                      Positioned(
                        top: -3,
                        bottom: -9,
                        right: 0,
                        left: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(items[index].imgPath)),
                      ),
                    ]),
                    footer: GridTileBar(

                      trailing:
                      ElevatedButton(
                        onPressed: (){ carttt.add(items[index]);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" The addition ${items[index].name} successfully")
                            ,action:SnackBarAction(label: 'undo', onPressed: (){
                              carttt.delete(carttt.selectedProducts[index]);
                              setState(){
                                carttt.delete(carttt.selectedProducts[index]);
                              }})));
                        },
                        child:Icon(Icons.add,color: Colors.pink[250],) ,
                      ),

                      leading: Text("\$${items[index].price}",style: TextStyle(
                        backgroundColor: Colors.brown[500],color: Colors.white,
                      ),),

                      title: Text(
                        " ",
                      ),
                    ),
                  ),
                );
              }),
        ),

      drawer: Drawer(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img1.jpg"),
                          fit: BoxFit.contain),
                    ),
                    currentAccountPicture: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage("assets/female.jpg")),
                    accountEmail: Text("marianabolos@gmail.com",
                      style: TextStyle(backgroundColor: Colors.brown[500]),),
                    accountName: Text("mariana bolos",
                        style: TextStyle(backgroundColor: Colors.brown[500],
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                  ListTile(
                      title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white),),
                      leading: Icon(Icons.home,color: Colors.brown[500]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("Smart Watch",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      leading: Icon(Icons.watch,color: Colors.brown[500],),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => smartwatch(),
                          ),
                        );

                      }),
                  ListTile(
                      title: Text("My products",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      leading: Icon(Icons.add_shopping_cart,color: Colors.brown[500]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOut(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("About",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      leading: Icon(Icons.help_center,color: Colors.brown[500]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => about(),
                          ),
                        );

                      }),
                  ListTile(
                      title: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      leading: Icon(Icons.exit_to_app,color: Colors.brown[500],),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Start(),
                          ),
                        );
                      }),

                ],
              ),
               Container(
                 margin: EdgeInsets.only(bottom: 12),
                 child: Text("Developed by Maryana & Mariam & Nawras & Munia © 2024",
                     style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                     color: Colors.white)),
               )
            ],
          ),
          backgroundColor: Colors.brown[200],
        ),
        appBar: AppBar(
          actions: [

            ProductsAndPrice()
          ],
          backgroundColor:Colors.brown[400],
          title: Text("Mobile items" ,style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
   bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.brown[200],


    );
  }
}



