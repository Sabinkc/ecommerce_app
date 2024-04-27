import 'package:nepali_utils/nepali_utils.dart';

class Product {
  String id;
  String name;
  String description;
  String image;
  String brand;
  num price;
  List<String> catagories;

  Product(
      {
      required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.brand,
      required this.price,
      required this.catagories});

  factory Product.fromJson(Map<String, dynamic> json) {
   return Product(
    id: json['_id'], 
    name: json['name'], 
    description: json['description'], 
    image: json['image'], 
    brand: json['brand'], 
    price: json['price'], 
    catagories: List.from(json["categories"]).map((e) => e.toString()).toList(),
    );
    //catagories = json['catagories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['brand'] = brand;
    data['price'] = price;
    data['catagories'] = catagories;
    return data;
  }

  String get formatedPrice {
    return "Rs. ${NepaliNumberFormat().format(price)}";
  }
}
