import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/image_constant.dart';
import 'package:flutter_demo/model/moviedata.dart';
import 'package:flutter_demo/view/fruits_page.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MovieState();
  }
}

class _MovieState extends State<Movies> {
  // List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  List<MovieData> movies = MovieData(null, null, null, null, null).getMovies();
  bool isEmptyText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Movies list")),
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
              child: RefreshIndicator(
                onRefresh: relodData,
                child: ListView.separated(
                  itemCount: movies.length,
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
                            movies[index].images![0]!,
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
                          movies[index].title!,
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
                        onTap: onTileClick,
                      ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.cyan, height: 2);
                  },
                ),
              ),
            ),
            ElevatedButton(onPressed: onFilterClick, child: Text("Filter by Name"))
          ],
        ),
      ),
    );
  }

  void onDelete(int index) {
    setState(() {
      movies.removeAt(index);
      if (movies.isEmpty) {
        isEmptyText = true;
      } else {
        isEmptyText = false;
      }
    });
  }

  Future<void> relodData() async {
    if (kDebugMode) {
      print("Reloaded");
    }
    setState(() {
      isEmptyText = false;
      movies.removeRange(0, movies.length);
      movies = MovieData(null, null, null, null, null).getMovies();
    });
  }

  void onTileClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FruitsScreen()),
    );
  }

  void onFilterClick() {

   setState(() {
     isEmptyText = false;
     movies =  movies.where((movie)=> movie.title == "The Wolf of Wall Street").toList();
     print("Resp $movies");
   });
  }
}
