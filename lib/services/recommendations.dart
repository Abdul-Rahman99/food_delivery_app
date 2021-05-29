import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class Food {
  int price;
  String name;
  String tags;
  String links;

  Food.fromMap(Map<String, dynamic> data) {
    price = data['price'];
    name = data['name'];
    tags = data['tags'];
    links = data['links'];
  }
}

Future<void> getFoods(FoodNotifier foodNotifier) async {
  List<Food> _foodList = [];

  var users = FirebaseFirestore.instance.collection('food');
  users.get().then((value) => {
        value.docs.forEach((element) {
          Food food = Food.fromMap(element.data());
          _foodList.add(food);
        })
      });

  foodNotifier.foodList = _foodList;
}

class FoodNotifier with ChangeNotifier {
  List<Food> _foodList = [];
  Food _currentFood;
  UnmodifiableListView<Food> get foodList => UnmodifiableListView(_foodList);
  Food get currentFood => _currentFood;

  set foodList(List<Food> foodList) {
    _foodList = foodList;
    notifyListeners();
  }

  set currentFood(Food food) {
    _currentFood = food;
    notifyListeners();
  }
}

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  FoodNotifier foodNotifier;
  @override
  void initState() {
    foodNotifier = Provider.of<FoodNotifier>(context, listen: false);

    super.initState();
    getFoods(foodNotifier);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
      ),
      body: FutureBuilder(
        //future: foodNotifier.foodList,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          print(snapshot.data);
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(
                  foodNotifier.foodList[index].links,
                  width: 120,
                  fit: BoxFit.fitWidth,
                ),
                title: Text(foodNotifier.foodList[index].name),
                subtitle: Text(foodNotifier.foodList[index].tags),
              );
            },
            itemCount: foodNotifier.foodList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black,
              );
            },
          );
        },
      ),
    );
    // body: ListView.separated(
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       leading: Image.network(
    //         foodNotifier.foodList[index].links,
    //         width: 120,
    //         fit: BoxFit.fitWidth,
    //       ),
    //       title: Text(foodNotifier.foodList[index].name),
    //       subtitle: Text(foodNotifier.foodList[index].tags),
    //     );
    //   },
    //   itemCount: foodNotifier.foodList.length,
    //   separatorBuilder: (BuildContext context, int index) {
    //     return Divider(
    //       color: Colors.black,
    //     );
    //   },
  }
}
