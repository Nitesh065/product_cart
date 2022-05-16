import 'package:flutter/material.dart';
import 'package:product_cart/data/json_data.dart';
import 'package:product_cart/modal/cart_modal.dart';
import 'package:product_cart/modal/product_modal.dart';
import 'package:product_cart/screens/order_screen.dart';
import 'package:provider/provider.dart';
import '../modal/product_modal.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductData>? product_modal = [];
  String? qty;
  String? selectedBrand;

  @override
  void initState() {
    _getData();
  }

  void _getData() {
    product_modal = JsonConvert().getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: product_modal == null || product_modal!.isEmpty
          ? CircularProgressIndicator()
          : ListView.separated(
              separatorBuilder: (BuildContext context, index) => SizedBox(height:40.0),
              itemCount: product_modal!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children:[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade700,
                      radius: 30.0,
                    ),
                    title: Text(
                      product_modal![index].productName!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Price:${product_modal![index].price!}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //  Radio(value: product_modal![index].colors!.length, groupValue: _value, onChanged: (newValue){
                          //    setState(() {
                          //      _value = newValue as int;
                          //    });
                          //  },
                          //    ),
                          //   ],
                          // )
                        Consumer<Order>(
                          builder: (context,order,child){
                           return Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.grey,style: BorderStyle.solid,width: 1.0)
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                value: selectedBrand,
                                icon: Padding(padding:EdgeInsets.only(left: 15.0),child: Icon(
                                    Icons.arrow_drop_down)),
                                iconSize: 25.0,
                                underline: SizedBox(),
                                onChanged: (newValue){
                                  print(selectedBrand.toString());
                                  selectedBrand = newValue.toString();
                                  print(newValue);
                                  setState(() {
                                    selectedBrand;
                                  });
                                  print(selectedBrand);
                                },
                                hint: Padding(padding: EdgeInsets.all(10.0),child: Text("Select Brand",style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500 ),),),
                                items: product_modal![index].brands!.map((data){
                                  return DropdownMenuItem(
                                      value: data.id.toString(),
                                      child:Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(data.name!,style: TextStyle(fontSize: 20.0,color: Colors.black),),
                                      )
                                  );
                                }).toList(),
                              ),
                            );
                          }
                        ),
                          SizedBox(height: 10.0),
                          Consumer<Order>(
                            builder: (context,order,child){
                              return  Container(
                                height: 40.0,
                                child: TextField(
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      hintText: "Enter Qty",
                                      hintStyle: TextStyle(fontSize: 15.0),
                                      contentPadding: EdgeInsets.only(top: 10.0,left: 10.0)
                                  ),
                                  onChanged: (value){
                                    qty = value;
                                    order.updateProduct(product_modal![index], qty);
                                  },
                                ),
                              );
                            }

                          )
                        ],
                      ),
                    ),
                  ),
                     SizedBox(height: 10.0),
                      Consumer<Order>(
                        builder: (context,order,child){
                          return Container(
                            margin: EdgeInsets.only(left: 90.0,right: 10.0),
                            height: 30.0,
                            width: 350.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.black,style: BorderStyle.solid,width: 1.0),
                              color: Colors.grey.shade200
                            ),
                            child: MaterialButton(onPressed: (){
                                order.addProduct(product_modal![index]);
                                Navigator.of(context).push(MaterialPageRoute(builder: (contex)=> OrderSummary()));
                            },
                              child: Text("Submit Product"),
                            ),
                          );
                }

                      ),

                  ]) );
              }),
    );
  }
}
