import 'dart:convert';

import 'package:add_product/models/product_model.dart';
import 'package:add_product/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List <ProductModel> products = [
ProductModel(
name: "Nike shoe",
description: "women shoes",
price: 20.4,
image: "assets/shoes.webp"),

ProductModel(
name: "camera",
description: "canon camera",
price: 90.9,
image: "assets/camera.jpg"),

ProductModel(
name: "Pink dress",
description: "women dress",
price: 40.3,
image: "assets/dress.jpg"),

ProductModel(
name: "bag",
description: "women shoes",
price: 20.4,
image: "assets/bag.jpg"),


ProductModel(
name: "dress",
description: "woman dress",
price: 62.9,
image: "assets/dress2.jpg"),

ProductModel(
name: "shoe",
description: "women shoes",
price: 24.5,
image: "assets/shoes2.webp"),

ProductModel(
name: "School bag",
description: "bags",
price: 18.4,
image: "assets/bag2.jpg"),


]; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 218, 173, 197),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 19, 59),
        title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold),) ,
        actions: [
          IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen(products: products,)));
          
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return Card(
              color: Color.fromARGB(255, 166, 123, 156),
              child: ListTile(
                // Text(products[index].name!)
                leading: CircleAvatar(backgroundImage: AssetImage(products[index].image!),),
                title: Text(products[index].name!,style: TextStyle(color: Color.fromARGB(255, 63, 40, 58),fontWeight: FontWeight.bold),), 
                subtitle:Text(products[index].price!.toString(),style: TextStyle(color: Color.fromARGB(255, 63, 40, 58),),),
                trailing: IconButton(
                  onPressed: ()async{
 
                   SharedPreferences prefs = await SharedPreferences.getInstance();
                  String data = jsonEncode(products[index].toMap());
                   prefs.setString(products[index].name!, data);
                  
                  },icon:Icon(Icons.add_shopping_cart)
                ),
              ),
            );
          }
        
        ),
      ),
    );
  }
}