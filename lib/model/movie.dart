class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;
  String date;
  int vote;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath,
      this.date, this.vote);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
    this.date = parsedJson['release_date'];
    this.vote = parsedJson['vote_count'] * 1;
  }
}
