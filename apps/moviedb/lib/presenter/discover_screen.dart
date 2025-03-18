import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:moviedb/repository/movie_repository.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    final movieRepository = getIt<MovieRepository>();
    return FutureBuilder(
      future: movieRepository.getDiscoverMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.movies?.length,
            itemBuilder: (context, index) {
              final movie = snapshot.data?.movies?[index];
              return ListTile(
                title: Text(movie?.title ?? ""),
                subtitle: Text(movie?.overview ?? ""),
                trailing: InkWell(
                    onTap: () => movieRepository.saveMovie(movie!),
                    child: Icon(Icons.bookmark_border_rounded)),
              );
            },
          );
        }
      },
    );
  }
}