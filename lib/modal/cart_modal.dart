import 'package:flutter/cupertino.dart';
import 'package:product_cart/modal/product_modal.dart';
import 'package:provider/provider.dart';

class Order extends ChangeNotifier{

  List<ProductData> product = [];

  double totalCartValue = 0;
  String? _qty;
  String? _brand;

  String? get quantity => _qty;
  String?get brand => _brand;

  void addProduct(items){
    int index = product.indexWhere((element) => element.id == items.id);
    print(index);
    product.add(items);
    notifyListeners();
  }

  void updateProduct(item,qty){
    int index = product.indexWhere((element) => element.id == item.id);
    if(index == -1){
      _qty = qty;
    }

    notifyListeners();

  }




}