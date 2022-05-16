import 'package:flutter/material.dart';
import '../modal/cart_modal.dart';
import 'package:provider/provider.dart';
class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width =  MediaQuery.of(context).size.width;
    var orderItem = Provider.of<Order>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
      ),
      body: orderItem.product.length == 0
          ? Center(
        child: Text("Cart is Empty"),
      ) : Container(
        padding: EdgeInsets.only(top: 30.0,left: 20.0),
        child: ListView.builder(
          itemCount: orderItem.product.length,
            itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: height*0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(width: 10.0),
                       Container(
                         padding: EdgeInsets.only(right: 20.0),
                         width: width -100,
                         child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(orderItem.product[index].productName!,style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Qty:${orderItem.quantity!}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                                  SizedBox(width: 100.0),
                                  Text("Price:${orderItem.product[index].price}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                                ],
                              ),
                            ),
                            Text("TotalPrice:${orderItem.product[index].price}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),

                          ],
                      ),
                       ),

                  ],
                ),
              ),
              Divider(color: Colors.black,),
            ],
          );
        }),
        ),
    );
  }
}
