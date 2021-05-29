import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Chickken Shawerma",
    hotel: "Ahmed's House",
    price: 40.00,
    imgUrl:
        "https://assets.cairo360.com/app/uploads/2016/11/article_original_11111_20161117_582dcc4c67636-700x323.jpg",
  ),
  FoodItem(
    id: 2,
    title: " beef Shawerma",
    hotel: "Ahmed's House",
    price: 50.00,
    imgUrl:
        "https://cdn.nutrition.ph/wp-content/uploads/2019/07/Beef-Shawarma-1080x675.jpg",
  ),
  FoodItem(
    id: 3,
    title: " Ful & Ta'meya ",
    hotel: "Amr's House",
    price: 30.00,
    imgUrl:
        "https://assets.cairo360.com/app/uploads/2019/11/%D9%82%D8%AF%D8%B1%D8%A9.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Hawashi",
    hotel: "Salma's House",
    price: 40.00,
    imgUrl:
        "https://howto-cook.net/wp-content/uploads/2020/02/homemade-egyptian-hawawshi-recipe.png",
  ),
  FoodItem(
    id: 5,
    title: "Kushari",
    hotel: "Abdelrahman Healthy Kitchen",
    price: 40.00,
    imgUrl:
        "https://image.shutterstock.com/image-photo/kushari-koushari-egyptian-dish-lentils-260nw-1100204009.jpg",
  ),
  FoodItem(
    id: 6,
    title: "Kabab & Kofta",
    hotel: "Omar's House",
    price: 100.00,
    imgUrl:
        "https://www.moulinex-me.com/medias/?context=bWFzdGVyfHJvb3R8MTQ0NDQxfGltYWdlL2pwZWd8aGJkL2gzMC8xMzA5NzMzOTY4Mjg0Ni5qcGd8OTI5ZWU4OGU0NTM3M2IzMzI0OWFhOGQyMWI4NWI5OWZhMTU0ZjRiY2QyNzgzYzJlODllYzFlYmZlNDQ4NjExNA",
  ),
  FoodItem(
    id: 7,
    title: "Fatta",
    hotel: "Nadia's House",
    price: 80.00,
    imgUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVWct5TgnTCz1eZnacrQ-kYfYLuRiWTOtqowh6AvnY7PtELm7Vz6QTIkgUMIfIA7ffLsM&usqp=CAU",
  ),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
