import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_18/models/product_model.dart';
import 'package:flutter_application_18/screan/cart_screan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScrean extends StatefulWidget {
  HomeScrean({super.key});


  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  Color _favIconColor = Colors.grey;
   List<ProductModel> products = [
    ProductModel(
      name: "Shose",
      category: "type shose",
      price: 200.5,
    ),
    ProductModel(
      name: "Bages",
      category: "thpe bages",
      price: 600.5,
    ),
    ProductModel(
      name: "Watch",
      category: "type watch",
      price: 100.5,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("products"),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => CartScrean(products: products,),)
            );
          }, icon: const Icon(Icons.trolley))
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            trailing: IconButton(
              onPressed: () async {
                SharedPreferences prefs = 
                await SharedPreferences.getInstance();

                String data = jsonEncode(products[index].toMap());
                prefs.setString(products[index].name!, data);

              },
              icon:  
              // IconButton(
              //   icon: Icon(Icons.favorite),
              //         color: _favIconColor,
              //         tooltip: 'Add to favorite',
              //         onPressed: () {
              //           setState(() {
              //             if(_favIconColor == Colors.grey){
              //               _favIconColor = Colors.red;
              //             }else{
              //           _favIconColor = Colors.grey;
              //       }
              //  });
              //         }
                
                
              //   // onPressed: , icon: Icon(Icons.favorite)
              //   ),
               Icon(Icons.trolley),
            ),
            title: Text(products[index].name!),
            subtitle: Text(products[index].category!),
            leading: Text(products[index].price.toString()),

          ),
          
        );
        
      },
      itemCount: products.length,
      ),
      
    );
  }
}