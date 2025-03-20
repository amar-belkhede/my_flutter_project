import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:moviedb/repository/movie_repository.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final movieRepository = getIt<MovieRepository>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieRepository.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final movie = snapshot.data?[index];
              return ListTile(
                title: Text(movie?.title ?? ""),
                subtitle: Text(movie?.overview ?? ""),
                trailing: InkWell(
                    onTap: () => movieRepository.deleteMovie(movie!),
                    child: Icon(Icons.bookmark)),
              );
            },
          );
        }
      },
    );
  }
}
