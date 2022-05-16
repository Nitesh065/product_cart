import 'package:flutter/material.dart';
import 'package:product_cart/screens/product_screen.dart';
import '../modal/cart_modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Order>(
      create: (context) => Order(),
      child: Consumer<Order>(
        builder: (context,order,child){
          return  MaterialApp(
          home: HomePage(),
          );
        }
      ),
    );
  }
}

