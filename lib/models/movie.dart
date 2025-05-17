class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String? backdropPath;
  final String releaseDate;
  final String overview;
  final List<String> genres;
  final String runtime;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    required this.overview,
    required this.genres,
    required this.runtime,
    required this.rating,
  });

  // Mock data for the first screen
  static List<Movie> getMockMoviesForHomeScreen() {
    return [
      Movie(
        id: 1,
        title: 'To All the Boys: P.S. I Still Love You',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2019 • 1h 40m',
        overview: 'Lara Jean and Peter have just taken their romance from pretend to officially official when another recipient of one of her old love letters enters the picture.',
        genres: ['Romance', 'Drama'],
        runtime: '1h 40m',
        rating: 7.2,
      ),
      Movie(
        id: 2,
        title: 'Baby Driver',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2019 • 1h 53m',
        overview: 'After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.',
        genres: ['Action', 'Crime', 'Drama'],
        runtime: '1h 53m',
        rating: 7.6,
      ),
      Movie(
        id: 3,
        title: 'John Wick',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2019 • 1h 41m',
        //overview: 'John Wick is on the run after killing a member of the international assassin\'s guild, and with a $14 million price tag on his head, he is the target of hit men and women everywhere.',
        genres: ['Action', 'Crime', 'Thriller'],
        runtime: '1h 41m',
        rating: 7.5, overview: '',
      ),
      Movie(
        id: 4,
        title: 'Exit',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2019 • 1h 20m',
        overview: 'A rock climbing instructor must save his sister and other people stranded in a skyscraper during a disaster.',
        genres: ['Action', 'Adventure'],
        runtime: '1h 20m',
        rating: 6.8,
      ),
    ];
  }

  // Mock data for the second screen
  static List<Movie> getMockTrendingMovies() {
    return [
      Movie(
        id: 5,
        title: 'Birds of Prey',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2020 • 1h 49m',
        overview: 'After splitting with the Joker, Harley Quinn joins superheroes Black Canary, Huntress and Renee Montoya to save a young girl from an evil crime lord.',
        genres: ['Action', 'Crime', 'Comedy', 'Drama'],
        runtime: '1h 49m',
        rating: 7.2,
      ),
      Movie(
        id: 6,
        title: 'Red Sparrow',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2018 • 2h 20m',
        overview: 'Ballerina Dominika Egorova is recruited to \'Sparrow School,\' a Russian intelligence service where she is forced to use her body as a weapon.',
        genres: ['Mystery', 'Thriller'],
        runtime: '2h 20m',
        rating: 6.6,
      ),
      Movie(
        id: 7,
        title: 'Jumanji: The Next Level',
        posterPath: 'https://via.placeholder.com/150x225',
        backdropPath: 'https://via.placeholder.com/400x200',
        releaseDate: '2019 • 2h 03m',
        overview: 'In Jumanji: The Next Level, the gang is back but the game has changed. As they return to rescue one of their own, the players will have to brave parts unknown from arid deserts to snowy mountains, to escape the world\'s most dangerous game.',
        genres: ['Action', 'Adventure', 'Comedy', 'Fantasy'],
        runtime: '2h 03m',
        rating: 7.0,
      ),
    ];
  }

  static List<Movie> getNowPlayingMovies() {
    return [
      Movie(
        id: 8,
        title: 'To All the Boys: P.S. I Still Love You',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2019 • 1h 40m',
        overview: 'Lara Jean and Peter have just taken their romance from pretend to officially official when another recipient of one of her old love letters enters the picture.',
        genres: ['Romance', 'Drama'],
        runtime: '1h 40m',
        rating: 7.2,
      ),
      Movie(
        id: 9,
        title: 'Ford v Ferrari',
        posterPath: 'https://via.placeholder.com/150x225',
        releaseDate: '2019 • 2h 32m',
        overview: 'American car designer Carroll Shelby and driver Ken Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order to defeat Ferrari at the 24 Hours of Le Mans in 1966.',
        genres: ['Drama', 'Action'],
        runtime: '2h 32m',
        rating: 8.1,
      ),
    ];
  }
}









// // To parse this JSON data, do
// //
// //     final genreResponse = genreResponseFromJson(jsonString);

// import 'dart:convert';

// GenreResponse genreResponseFromJson(String str) => GenreResponse.fromJson(json.decode(str));

// String genreResponseToJson(GenreResponse data) => json.encode(data.toJson());

// class GenreResponse {
//     final List<Genre> genres;

//     GenreResponse({
//         required this.genres,
//     });

//     factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
//         genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
//     };
// }

// class Genre {
//     final int id;
//     final String name;

//     Genre({
//         required this.id,
//         required this.name,
//     });

//     factory Genre.fromJson(Map<String, dynamic> json) => Genre(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };

//     // Utility method to get genre name by ID
//     static String getGenreName(int id) {
//         switch (id) {
//             case 28: return "popular";
//             case 12: return "Upcoming";
//             case 16: return "Now Playing";
//             default: return "Unknown";
//         }
//     }
// }
