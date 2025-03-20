import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/app_bloc_observer.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:moviedb/presenter/favorite/favorite_screen.dart';
import 'package:moviedb/repository/movie_repository.dart';
import 'package:moviedb/presenter/discover/discover_screen.dart';

void main() {
  BindingBase.debugZoneErrorsAreFatal = true;

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies();
      Bloc.observer = AppBlocObserver();
      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint('❌ Uncaught Error: $error');
      debugPrint('🔍 Stack Trace: $stack');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DiscoverScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final movieRepository = getIt<MovieRepository>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _widgetOptions[_selectedIndex],
      // body: FutureBuilder(
      //   future: movieRepository.getDiscoverMovie(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Error: ${snapshot.error}'));
      //     } else {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.movies?.length,
      //         itemBuilder: (context, index) {
      //           final movie = snapshot.data?.movies?[index];
      //           return ListTile(
      //             title: Text(movie?.title ?? ""),
      //             subtitle: Text(movie?.overview ?? ""),
      //             trailing: InkWell(
      //                 onTap: () => movieRepository.saveMovie(movie!),
      //                 child: Icon(Icons.bookmark_border_rounded)),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
