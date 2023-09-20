//import 'dart:convert';
//import 'dart:math';

import 'package:add_product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key, required this.products});

  List <ProductModel> products ;


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

@override
  void initState() {
   
    _getData();
    super.initState();
  }

  List<ProductModel> cartProducts = [];
   _getData() async {
   
   SharedPreferences prefs = await SharedPreferences.getInstance();

   for (var element in widget.products) {
    if( prefs.containsKey(element.name!)){
      cartProducts.add(element);
    
    }
   }
  setState(() {
    
  });

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 230, 179, 241),

      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 115, 30, 123),
        title: Text("Cart",style: TextStyle(fontWeight: FontWeight.bold),) ,
        
      ),

      body: ListView.builder
      (
        itemCount:cartProducts.length ,
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.only(top: 7,left: 16,right: 16),
          child: Card(
           color: Color.fromARGB(255, 234, 191, 243),
          child:  ListTile(
            
                  leading: CircleAvatar(backgroundImage: AssetImage(cartProducts[index].image!),),
                title: Text(cartProducts[index].name!,style: TextStyle(color: Color.fromARGB(255, 63, 40, 58),fontWeight: FontWeight.bold),), 
                subtitle:Text(cartProducts[index].price!.toString(),style: TextStyle(color: Color.fromARGB(255, 63, 40, 58),),),

                  
                  trailing: InkWell(
                    onTap: () async {
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove(cartProducts[index].name!);
                      cartProducts.remove(cartProducts[index]);
                    },

                    child: Text("Remove from cart",style: TextStyle(color: Color.fromARGB(255, 115, 30, 123)),),
                  ),
                  ),
                ),
          
        );
      }
      


      ),

    );
  }
  
   
}