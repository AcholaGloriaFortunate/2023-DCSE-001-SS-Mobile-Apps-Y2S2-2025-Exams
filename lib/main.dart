import 'package:flutter/material.dart';
import 'screens/MockupScreenOne.dart';
import 'screens/MockupScreenTwo.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF032541),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MockupScreenOne(),
        '/movie_details': (context) => const MockupScreenTwo(),
      },
    );
  }
}







// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
        
        
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
     
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
        
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
//         title: Text(widget.title),
//       ),
//       body: Center(
        
//         child: Column(
          
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


// // ignore_for_file: camel_case_types, unused_element

// // import 'package:flutter/material.dart';


// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp.router(
// //       //uterConfig: _router,
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primaryColor: const Color(0xFF40C4FF),
// //         scaffoldBackgroundColor: Colors.black,
// //         textTheme: const TextTheme(
// //           bodyLarge: TextStyle(color: Colors.white),
// //           bodyMedium: TextStyle(color: Colors.white),
// //         ),
// //         elevatedButtonTheme: ElevatedButtonThemeData(
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: const Color(0xFF40C4FF),
// //             foregroundColor: Colors.black,
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _router {
// // }

// // // final GoRouter _router = GoRouter(
// // //   initialLocation: '/',
// // //   redirect: (context, state) async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
// // //     final bool hasCompletedOnboarding = prefs.getBool('hasCompletedOnboarding') ?? false;

// // //     // Allow splash screen to handle first launch navigation
// // //     if (state.uri.toString() == '/splash' || state.uri.toString() == '/') {
// // //       if (isLoggedIn) {
// // //         return '/home';
// // //       } else if (hasCompletedOnboarding) {
// // //         return '/signup';
// // //       }
// // //     }
// // //     return null; // Let the route proceed normally
// // //   },
// // //   routes: [
    
// // //   ],
// // // );