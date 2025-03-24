class Fruits {
  String name;
  String image;
  int price;

  Fruits({required this.name, required this.image, required this.price});

  factory Fruits.fromJson(Map<String, dynamic> json) =>
      Fruits(name: json['name'], image: json['image'], price: json['price']);
}

class RootFruit{
  List<Fruits> fruits;

  RootFruit({required this.fruits});
  factory RootFruit.fromJson(Map<String, dynamic> json){

     return RootFruit(
      fruits: (json['fruits'] as List)
          .map((fruit) => Fruits.fromJson(fruit))
          .toList(),
    );

     // return RootFruit(
     //   fruits: (json['fruits'] as List<dynamic>) // 🔥 Explicitly casting as List<dynamic>
     //       .map((item) => Fruits.fromJson(item as Map<String, dynamic>)) // 🔥 Convert each item to Fruit
     //       .toList(),
     // );
  }
}
