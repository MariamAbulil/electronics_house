import 'package:flutter/material.dart';
import '../model/item.dart';

class Cart with ChangeNotifier {

  List<Item> selectedProducts = [];

  int price = 0;

  add(Item product) {
    selectedProducts.add(product);
    price += product.price.round();
    notifyListeners();
  }
  updateColor(Item product, Color selectedColor) {
    product.selectedColor = selectedColor;
    notifyListeners();
  }
  delete(Item product) {
    selectedProducts.remove(product);
    price -= product.price.round();
    notifyListeners();
  }

  deleteall(){
    selectedProducts=[];
    price =0;
    notifyListeners();
  }
  get itemCount {
    return selectedProducts.length;
  }

}
