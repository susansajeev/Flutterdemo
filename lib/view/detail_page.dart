import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/image_constant.dart';
import 'package:flutter_demo/model/moviedata.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailMovie extends StatefulWidget {
  //MovieData movieData;

  //DetailMovie({super.key, required this.movieData});
  const DetailMovie({super.key});


  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {

  double _rating = 2.0;
  bool _isLike = false;



  @override
  Widget build(BuildContext context) {
    var movieDataMap = ModalRoute.of(context)?.settings.arguments as Map<String, MovieData>;
    var movieData  = movieDataMap["movie"] as MovieData;
    return Scaffold(
      appBar: AppBar(title: Text("${movieData.title}"), centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      height: 250,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      "${movieData.images?.first!}",
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

                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => addToWish(),
                      child:
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child:
                              _isLike ? Icon(Icons.heart_broken, color: Colors.red):
                              Icon(Icons.heart_broken, color: Colors.grey)
                        ),

                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    left: 10,
                    child: Text(
                      "${movieData.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Movie Name :",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${movieData.title}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,

                        ),
                      ),
                    ],
                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rate ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      RatingBar(
                        initialRating: _rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true, // Allows 3.5, 4.5, etc.
                        itemCount: 5,
                        itemSize: 18.0, // Adjust star size
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: Colors.amber),
                          half: Icon(Icons.star_half, color: Colors.amber),
                          empty: Icon(Icons.star_border, color: Colors.grey),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                          print("User selected rating: $_rating");
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Wrap(
                children: [
                  Row(
                    spacing: 2,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Label : ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "${movieData.plot}",
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  void addToWish() {
    setState(() {
      _isLike = !_isLike;

    });
  }
}

