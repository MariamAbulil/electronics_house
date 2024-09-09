import 'package:flutter/material.dart';
import 'package:mariana/auth/login.dart';
import 'package:mariana/pages/start.dart';
import 'package:mariana/pages/watchdetails.dart';
import 'package:mariana/shared/BottomBar.dart';
import 'package:provider/provider.dart';
import '../model/item.dart';
import '../provider/cart.dart';
import '../shared/appbar.dart';
import 'about.dart';
import 'checkout.dart';
import 'home.dart';

class smartwatch extends StatelessWidget {
  const smartwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        builder: (context) => watchdetails(product: itemswatch[index]),
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
                            child: Image.asset(itemswatch[index].imgPath,
                              )),
                      ),
                    ]),
                    footer: GridTileBar(
                      trailing:
                      ElevatedButton(
                        onPressed: (){ carttt.add(itemswatch[index]);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" The addition ${itemswatch[index].name} successfully")
                            ,action:SnackBarAction(label: 'undo', onPressed: (){
                              carttt.delete(carttt.selectedProducts[index]);
                              setState(){
                                carttt.delete(carttt.selectedProducts[index]);
                              }})));
                        },
                        child:Icon(Icons.add,color: Colors.pink[250],) ,
                      ),

                      leading: Text("\$${itemswatch[index].price}",style: TextStyle(
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
                    decoration: const BoxDecoration(
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
                      style: TextStyle(backgroundColor: Colors.brown[500]),),
                  ),
                  ListTile(
                      title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white)),
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
                      title: Text("Mobile Items",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white)),
                      leading: Icon(Icons.mobile_friendly,color: Colors.brown[500],),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
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
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold
                    ,color: Colors.white)),
              ),
            ],
          ),
          backgroundColor: Colors.brown[200],
        ),
        appBar: AppBar(
          actions: [

            ProductsAndPrice()
          ],
          backgroundColor:Colors.brown[400],
          title: Text("Smart Watch",
            style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      bottomNavigationBar: BottomBar(),
      backgroundColor: Colors.brown[200],
    );
  }
}



