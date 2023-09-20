class ProductModel {
 
 String? name;
 String? description;
 double? price;
 String? image;

 ProductModel({this.name,this.description,this.price,this.image});


 Map <String,dynamic> toMap(){
  return {
    "name": name,
    "description": description,
    "price": price,
    "image": image,

  };
 }

}