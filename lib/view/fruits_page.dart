import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/image_constant.dart';
import '../model/fruits.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FruiteScreenState();
  }
}

class _FruiteScreenState extends State<FruitsScreen> {
  bool isEmptyText = false;
  List<Fruits> fruitsList = [];
  List<Fruits> dummyList = [];

  @override
  void initState() {
    print("Susan 1111111");
    getFruitList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Fruits list")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          spacing: 10,
          children: [
            if (isEmptyText)
              Text(
                "No data Found",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: fruitsList.length,
                itemBuilder:
                    (context, index) => GridTile(
                      child: Column(
                        spacing: 5,
                        children: <Widget>[
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Image.network(
                                fruitsList[index].image,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                                loadingBuilder: (
                                  context,
                                  child,
                                  loadingProgress,
                                ) {
                                  if (loadingProgress == null) {
                                    return child; // Image loaded successfully
                                  }
                                  return const CircularProgressIndicator(); // Show a loader
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                    size: 50,
                                    color: Colors.red,
                                  );
                                },
                              ),
                              Image.asset(
                                ImageConstants.delete,
                                width: 20,
                                height: 20,
                              )
                            ],
                          ),
                          Text(
                            fruitsList[index].name,

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getFruitList() async {
    var url = Uri.parse("http://demo8946992.mockable.io/fruits");
    var response = await http.get(url);
    RootFruit fruits = RootFruit.fromJson(jsonDecode(response.body));

    setState(() {
      //fruitsList = fruits.fruits ;
      fruitsList.addAll(fruits.fruits);
    });
    createDummyList(fruits);
  }

  void onDelete(int index) {}

  void createDummyList(RootFruit fruits) {
    dummyList = List.filled(10, fruits.fruits.last);
    dummyList.fillRange(6, 8, fruits.fruits[2]);
    List.copyRange(dummyList, 0, fruits.fruits);
    print("MyDummy list == $dummyList");
    Set<Fruits> setDummy = dummyList.toSet();
    dummyList = setDummy.toList();
    print("MyDummy list == $dummyList");
    dummyList =
        dummyList
            .map(
              (fruit) => Fruits(
                name: fruit.name.toUpperCase(),
                image: fruit.image,
                price: fruit.price,
              ),
            )
            .toList();

    setState(() {
      //fruitsList = fruits.fruits ;
      fruitsList.addAll(dummyList);
    });
  }
}
