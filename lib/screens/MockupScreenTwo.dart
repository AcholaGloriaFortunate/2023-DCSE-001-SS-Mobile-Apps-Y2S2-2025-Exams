import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card_small.dart';

class MockupScreenTwo extends StatelessWidget {
  const MockupScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the featured movie (Jumanji: The Next Level)
    final featuredMovie = Movie.getMockTrendingMovies()
        .firstWhere((movie) => movie.title == 'Jumanji: The Next Level');
    
    // Get the trending movies
    final trendingMovies = Movie.getMockTrendingMovies();
    
    // Get now playing movies
    final nowPlayingMovies = Movie.getNowPlayingMovies();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie header with backdrop
            Stack(
              children: [
                // Backdrop image
                Container(
                  height: 220,
                  width: double.infinity,
                  color: Colors.grey[800], // Placeholder color if image fails
                  child: Image.network(
                    featuredMovie.backdropPath ?? 'https://via.placeholder.com/400x200',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.white, size: 50),
                        ),
                      );
                    },
                  ),
                ),
                
                // Back button
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                // Movie title and genres
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          featuredMovie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          featuredMovie.genres.join(' • '),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // What's Popular section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What\'s Popular',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Horizontal scrolling list of popular movies
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovies.length,
                      itemBuilder: (context, index) {
                        return MovieCardSmall(movie: trendingMovies[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            // Now Playing section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Now Playing',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Horizontal scrolling list of now playing movies
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: nowPlayingMovies.length,
                      itemBuilder: (context, index) {
                        return MovieCardSmall(movie: nowPlayingMovies[index]);
                      },
                    ),
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


// ignore_for_file: use_key_in_widget_constructors, file_names

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Home Screen',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Text(
//                 'Navigation Menu',
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () => Navigator.pop(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text('Settings'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: const Center(
//         child: Text(
//           'Welcome to the Home Screen!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }