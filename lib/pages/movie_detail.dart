import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/model/movie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'http://images.freeimages.com/images/large-preview/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    String data = movie.date;
    final dateTime = DateTime.parse(data);
    final dateFormat = DateFormat('MMM d').format(dateTime);
    final dateFormatYear = DateFormat(' yyyy ').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 30.0),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(path),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          dateFormat + "," + dateFormatYear,
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 1,
                          height: 16,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          EvaIcons.star,
                          color: Colors.orange,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          movie.voteAverage.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Overview',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      movie.overview,
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
