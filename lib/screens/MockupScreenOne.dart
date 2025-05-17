// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_card_small.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({super.key});

  @override
  State<MockupScreenOne> createState() => _MockupScreenOneState();
}

class _MockupScreenOneState extends State<MockupScreenOne> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Movie> _movies;
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _movies = Movie.getMockMoviesForHomeScreen();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar with search
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF032541),
              child: Row(
                children: [
                  // TMDB Logo
                  Text(
                    'TMDB',
                    style: TextStyle(
                      color: Colors.cyan[300],
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Search box
                  Expanded(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Find your movies...',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Sort & Filters
                  Text(
                    'Sort | Filters',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            
            // Header
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF032541),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Discover & Enjoy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Your Favourite Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  
                  // Tab Bar
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 3.0,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    unselectedLabelColor: Colors.white70,
                    tabs: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: _tabController.index == 0 ? Colors.cyan : null,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text('Popular'),
                      ),
                      const Tab(text: 'Upcoming'),
                      const Tab(text: 'Now Playing'),
                    ],
                    onTap: (index) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            
            // Movie List
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Popular Movies
                  ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: _movies[index]);
                    },
                  ),
                  
                  // Upcoming Movies
                  ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: _movies[_movies.length - index - 1]);
                    },
                  ),
                  
                  // Now Playing Movies
                  ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: _movies[index % 2 == 0 ? index : _movies.length - index - 1]);
                    },
                  ),
                ],
              ),
            ),
            
            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, color: Colors.blue),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.explore, color: Colors.grey[400]),
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.bookmark, color: Colors.grey[400]),
                      Text(
                        'Watchlist',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, color: Colors.grey[400]),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// ignore_for_file: file_names

// import 'package:flutter/material.dart';

// // void main() => runApp(const MyApp());

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Home Screen',
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: const HomeScreen(),
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home'),
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: [
// //             const DrawerHeader(
// //               decoration: BoxDecoration(color: Colors.blue),
// //               child: Text(
// //                 'Navigation Menu',
// //                 style: TextStyle(color: Colors.white, fontSize: 24),
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.home),
// //               title: const Text('Home'),
// //               onTap: () => Navigator.pop(context),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.settings),
// //               title: const Text('Settings'),
// //               onTap: () {},
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.logout),
// //               title: const Text('Logout'),
// //               onTap: () {},
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: const Center(
// //         child: Text(
// //           'Welcome to the Home Screen!',
// //           style: TextStyle(fontSize: 24),
// //         ),
// //       ),
// //     );
// //   }
// // }


// // ignore_for_file: depend_on_referenced_packages, file_names, use_key_in_widget_constructors, constant_identifier_names, non_constant_identifier_names, library_private_types_in_public_api, use_super_parameters

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MovieApp());
// }

// class MovieApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MovieFlix',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         brightness: Brightness.dark,
//       ),
//       themeMode: ThemeMode.system,
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// // API key for the movie database (TMDB)
// // Note: In a real application, this should be stored securely
// const String API_KEY = 'YOUR_API_KEY';
// const String BASE_URL = 'https://api.themoviedb.org/3';
// const String IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/w500';

// // Sample movies data for demonstration
// final List<Map<String, dynamic>> SAMPLE_MOVIES = [
//   {
//     'id': 1,
//     'title': 'The Shawshank Redemption',
//     'poster_path': null,
//     'overview': 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
//     'vote_average': 8.7,
//     'release_date': '1994-09-23',
//   },
//   {
//     'id': 2,
//     'title': 'The Godfather',
//     'poster_path': null,
//     'overview': 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
//     'vote_average': 8.7,
//     'release_date': '1972-03-14',
//   },
//   {
//     'id': 3,
//     'title': 'The Dark Knight',
//     'poster_path': null,
//     'overview': 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
//     'vote_average': 8.5,
//     'release_date': '2008-07-16',
//   },
//   {
//     'id': 4,
//     'title': 'Pulp Fiction',
//     'poster_path': null,
//     'overview': 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
//     'vote_average': 8.5,
//     'release_date': '1994-10-14',
//   },
//   {
//     'id': 5,
//     'title': 'Inception',
//     'poster_path': null,
//     'overview': 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
//     'vote_average': 8.3,
//     'release_date': '2010-07-16',
//   },
//   {
//     'id': 6,
//     'title': 'Fight Club',
//     'poster_path': null,
//     'overview': 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.',
//     'vote_average': 8.3,
//     'release_date': '1999-10-15',
//   },
// ];

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<dynamic> movies = [];
//   bool isLoading = true;
//   String errorMessage = '';
//   String searchQuery = '';
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }

//   Future<void> fetchMovies() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//     });

//     try {
//       // Use sample data if API_KEY is not provided
//       if (API_KEY == 'YOUR_API_KEY') {
//         await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
//         setState(() {
//           movies = SAMPLE_MOVIES;
//           isLoading = false;
//         });
//         return;
//       }

//       // Fetch from actual API
//       final String endpoint = searchQuery.isEmpty
//           ? '$BASE_URL/movie/popular?api_key=$API_KEY'
//           : '$BASE_URL/search/movie?api_key=$API_KEY&query=${Uri.encodeComponent(searchQuery)}';

//       final response = await http.get(Uri.parse(endpoint));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           movies = data['results'];
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to fetch movies: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//         movies = SAMPLE_MOVIES;
//         isLoading = false;
//       });
//     }
//   }

//   void _performSearch() {
//     setState(() {
//       searchQuery = searchController.text;
//     });
//     fetchMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'MovieFlix',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         elevation: 2,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: MovieSearchDelegate(
//                   onSearch: (query) {
//                     setState(() {
//                       searchQuery = query;
//                       searchController.text = query;
//                     });
//                     fetchMovies();
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search movies...',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     searchController.clear();
//                     setState(() {
//                       searchQuery = '';
//                     });
//                     fetchMovies();
//                   },
//                 ),
//               ),
//               onSubmitted: (_) => _performSearch(),
//             ),
//           ),
          
//           // Title section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 searchQuery.isEmpty ? 'Popular Movies' : 'Search Results for "$searchQuery"',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
          
//           // Main content
//           Expanded(
//             child: _buildBody(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBody() {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (errorMessage.isNotEmpty) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.red.shade100,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.red.shade300),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   'Error: $errorMessage',
//                   style: TextStyle(color: Colors.red.shade800),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Showing sample movies instead.',
//                   style: TextStyle(color: Colors.red.shade800),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(child: _buildMovieGrid()),
//         ],
//       );
//     }

//     if (movies.isEmpty) {
//       return const Center(
//         child: Text(
//           'No movies found. Try a different search.',
//           style: TextStyle(fontSize: 16),
//         ),
//       );
//     }

//     return _buildMovieGrid();
//   }

//   Widget _buildMovieGrid() {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
//         childAspectRatio: 0.7,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         final movie = movies[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MovieDetailPage(movie: movie),
//               ),
//             );
//           },
//           child: MovieCard(movie: movie),
//         );
//       },
//     );
//   }
// }

// class MovieCard extends StatelessWidget {
//   final dynamic movie;

//   const MovieCard({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                 image: DecorationImage(
//                   image: movie['poster_path'] != null
//                       ? NetworkImage('$IMAGE_BASE_URL${movie['poster_path']}')
//                       : AssetImage('assets/movie_placeholder.png') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     movie['title'],
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         movie['release_date'] != null && movie['release_date'].toString().isNotEmpty
//                             ? movie['release_date'].toString().substring(0, 4)
//                             : 'N/A',
//                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.star,
//                             size: 14,
//                             color: Colors.amber,
//                           ),
//                           SizedBox(width: 2),
//                           Text(
//                             movie['vote_average'] != null
//                                 ? movie['vote_average'].toStringAsFixed(1)
//                                 : 'N/A',
//                             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MovieDetailPage extends StatelessWidget {
//   final dynamic movie;

//   const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movie Details'),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Hero poster image
//             Container(
//               height: 300,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: movie['poster_path'] != null
//                       ? NetworkImage('$IMAGE_BASE_URL${movie['poster_path']}')
//                       : AssetImage('assets/movie_placeholder.png') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
            
//             // Movie title and basic info
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     movie['title'],
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
                  
//                   // Info chips
//                   Row(
//                     children: [
//                       Chip(
//                         label: Text(
//                           movie['release_date'] != null && movie['release_date'].toString().isNotEmpty
//                               ? movie['release_date'].toString().substring(0, 4)
//                               : 'N/A',
//                         ),
//                         backgroundColor: Colors.blue.shade100,
//                       ),
//                       SizedBox(width: 8),
//                       Chip(
//                         label: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.star, size: 16, color: Colors.amber),
//                             SizedBox(width: 4),
//                             Text(
//                               movie['vote_average'] != null
//                                   ? movie['vote_average'].toStringAsFixed(1)
//                                   : 'N/A',
//                             ),
//                           ],
//                         ),
//                         backgroundColor: Colors.amber.shade100,
//                       ),
//                     ],
//                   ),
                  
//                   SizedBox(height: 16),
                  
//                   // Overview section
//                   Text(
//                     'Overview',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     movie['overview'] ?? 'No overview available.',
//                     style: TextStyle(
//                       fontSize: 16,
//                       height: 1.5,
//                     ),
//                   ),
                  
//                   SizedBox(height: 24),
                  
//                   // Additional information section
//                   Text(
//                     'Additional Information',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   _buildInfoRow('Original Title', movie['original_title'] ?? movie['title']),
//                   _buildInfoRow('Popularity', movie['popularity']?.toString() ?? 'N/A'),
//                   _buildInfoRow('Vote Count', movie['vote_count']?.toString() ?? 'N/A'),
//                   _buildInfoRow('Original Language', 
//                       movie['original_language']?.toString().toUpperCase() ?? 'N/A'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 140,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MovieSearchDelegate extends SearchDelegate<String> {
//   final Function(String) onSearch;

//   MovieSearchDelegate({required this.onSearch});

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     onSearch(query);
//     return Container(); // The actual results will be shown on the main page
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListView(
//       children: [
//         if (query.isNotEmpty)
//           ListTile(
//             leading: Icon(Icons.search),
//             title: Text('Search for "$query"'),
//             onTap: () {
//               onSearch(query);
//               close(context, query);
//             },
//           ),
//         ListTile(
//           leading: Icon(Icons.movie),
//           title: Text('Popular movies'),
//           onTap: () {
//             onSearch('');
//             close(context, '');
//           },
//         ),
//         if (query.isNotEmpty) ...[
//           ListTile(
//             leading: Icon(Icons.movie_filter),
//             title: Text('Action movies with "$query"'),
//             onTap: () {
//               onSearch('$query action');
//               close(context, '$query action');
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.movie_filter),
//             title: Text('Comedy movies with "$query"'),
//             onTap: () {
//               onSearch('$query comedy');
//               close(context, '$query comedy');
//             },
//           ),
//         ],
//       ],
//     );
//   }
// }