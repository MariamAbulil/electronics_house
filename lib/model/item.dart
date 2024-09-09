import 'dart:ui';

class Item {
  String imgPath;
  double price;
  String location;
  String name;
  Color? selectedColor;
  Item({required this.imgPath, required this.name, required this.price, this.location = "Main branch"});
}

final List<Item> items = [
Item(name: "Iphone 11", price:250, imgPath: "assets/iphone11.jpeg"),
Item(name: "Iphone 12", price: 300, imgPath: "assets/iphone12.jpeg"),
Item(name: "Iphone 13", price: 350, imgPath: "assets/iphone13.jpeg"),
Item(name: "Iphone 14", price: 400, imgPath: "assets/iphone14.jpeg"),
Item(name: "Samsung Galaxy S21", price: 450, imgPath: "assets/gs21.jpeg"),
Item(name: "Samsung Galaxy zip flip 5",price: 500, imgPath: "assets/gzflip3.jpeg"),
  Item(name: "Iphone15",price: 600, imgPath: "assets/iphone15.jpeg"),
  Item(name: "Iphon 11 Pro Max", price:300, imgPath: "assets/iphone11.jpeg"),
];


final List<Item> itemswatch = [

  Item(name: "Apple Watch SE", price:200, imgPath: "assets/AppleWatchSE.jpeg"),
  Item(name: "Apple Watch Ultra", price: 350, imgPath: "assets/AppleWatchUltra.jpeg"),
  Item(name: "Dirrelo Smart Watch Android", price: 350, imgPath: "assets/DirreloSmartWatchAndroid.jpeg"),
  Item(name: "RERE ASW1 Watch", price: 400, imgPath: "assets/REREASW1.jpeg"),
  Item(name: "SKG Smart Watch", price: 450, imgPath: "assets/SKGSmartWatch.jpeg"),
  Item(name: "Kids Smart Watch",price: 500, imgPath: "assets/KidsSmartWatch.jpeg"),
  Item(name: "Kid Smart Watch",price: 550, imgPath: "assets/AppleWatchUltra.jpeg"),
  Item(name: "Apple Watch SE", price:250, imgPath: "assets/AppleWatchSE.jpeg"),

];

