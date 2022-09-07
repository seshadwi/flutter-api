import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/pages/movie_detail.dart';
import 'package:flutter_api/service/http_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int movieCount;
  List movies;
  HttpService service;

  // String result = "";

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      movieCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String imgPath = 'https://image.tmdb.org/t/p/w500/';

    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.movieCount == null) ? 0 : this.movieCount,
        itemBuilder: (context, int position) {
          String data = movies[position].date;
          final dateTime = DateTime.parse(data);
          final dateFormat = DateFormat('MMM d').format(dateTime);
          final dateFormatYear = DateFormat(' yyyy ').format(dateTime);
          return InkWell(
            onTap: () {
              MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]));
              Navigator.push(context, route);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 128,
                    height: 188,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 20.0)
                        ],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                            imgPath + movies[position].posterPath),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 202,
                    height: 188,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          movies[position].title,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          dateFormat + "," + dateFormatYear,
                          style: GoogleFonts.inter(),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // Text(movies[position].vote.toString()),
                            // SizedBox(width: 5),
                            // Text('Votes'),
                            Icon(
                              EvaIcons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(movies[position].voteAverage.toString()),
                            SizedBox(width: 5),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Overview',
                          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          movies[position].overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          // return Card(
          //   color: Colors.white,
          //   elevation: 2.0,
          //   child: InkWell(
          //     onTap: () {
          //       MaterialPageRoute route = MaterialPageRoute(
          //           builder: (_) => MovieDetail(movies[position]));
          //       Navigator.push(context, route);
          //     },
          //     child: Container(
          //       width: 100,
          //       height: 160,
          //       color: Colors.lightBlue,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //     ),
          //     // child: Row(
          //     //   mainAxisAlignment: MainAxisAlignment.start,
          //     //   children: [
          //     //     SizedBox(width: 5),
          //     //     Container(
          //     //       width: 100,
          //     //       height: 155,
          //     //       child: Image.network(imgPath + movies[position].posterPath),
          //     //     ),
          //     //     SizedBox(width: 10),
          //     //     Column(
          //     //       mainAxisAlignment: MainAxisAlignment.start,
          //     //       crossAxisAlignment: CrossAxisAlignment.start,
          //     //       children: [
          //     //         Text(movies[position].title),
          //     //         Text('Rating = ' +
          //     //             movies[position].voteAverage.toString()),
          //     //       ],
          //     //     ),
          //     //   ],
          //     // ),
          //   ),
          //   // child: ListTile(
          //   //   title: Text(movies[position].title),
          //   //   subtitle: Text(
          //   //     'Rating = ' + movies[position].voteAverage.toString(),
          //   //   ),
          //   //   onTap: () {
          //   //     MaterialPageRoute route = MaterialPageRoute(
          //   //         builder: (_) => MovieDetail(movies[position]));
          //   //     Navigator.push(context, route);
          //   //   },
          //   // ),
          // );
        },
      ),
    );
    // service.getPopularMovies().then((value) => {
    //       setState(() {
    //         result = value;
    //       })
    //     });
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Popular Movies"),
    //   ),
    //   body: Container(
    //     child: Text(result),
    //   ),
    // );
  }
}
