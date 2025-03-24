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
              child: ListView.separated(
                itemCount: fruitsList.length,
                itemBuilder:
                    (context, index) => ListTile(
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.lime, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        child: Image.network(
                          fruitsList[index].image,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          loadingBuilder: (context, child, loadingProgress) {
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
                      ),
                      title: Text(
                        fruitsList[index].name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => onDelete(index),
                        icon: Image.asset(
                          ImageConstants.delete,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.cyan, height: 2);
                },
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
