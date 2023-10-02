import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_18/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScrean extends StatefulWidget {
  CartScrean({super.key, required this.products});

  List<ProductModel> products;

  @override
  State<CartScrean> createState() => _CartScreanState();
}

class _CartScreanState extends State<CartScrean> {
  @override
  void initState() {
    _getData();
    super.initState();
  }
  List<ProductModel> cartproducts = [];
  _getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var element in widget.products) {
      if(prefs.containsKey(element.name!)){
        cartproducts.add(element);

      }
     
      
    }
     setState(() { });

    // String data =  prefs.getString("Shoes")?? "";
    // Map<String,dynamic> map = jsonDecode(data);
    // print(map);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("cart"),
        
      ),
   body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
           trailing: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(cartproducts[index].name!);
              cartproducts.remove(cartproducts[index]);
              setState(() { });

            },
            child: Text("Remove")),
            title: Text(cartproducts[index].name!),
            subtitle: Text(cartproducts[index].category!),
            leading: Text(cartproducts[index].price.toString()),

          ),
          
        );
        
      },
      itemCount: cartproducts.length,
      ),
      
    );
  }
}