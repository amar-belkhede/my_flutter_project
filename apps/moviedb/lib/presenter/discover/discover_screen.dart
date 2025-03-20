import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:moviedb/presenter/discover/bloc/discover_bloc.dart';
import 'package:moviedb/repository/movie_repository.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final DiscoverBloc _discoverBloc = getIt<DiscoverBloc>();

  @override
  void initState() {
    super.initState();

    _discoverBloc.add(GetDiscoverMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _discoverBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DiscoverLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DiscoverMovies) {
          return ListView.builder(
            itemCount: state.movieResponse?.movies?.length,
            itemBuilder: (context, index) {
              final movie = state.movieResponse?.movies?[index];
              return ListTile(
                title: Text(movie?.title ?? ""),
                subtitle: Text(movie?.overview ?? ""),
                trailing: InkWell(
                    onTap: () => _discoverBloc.add(SaveMovieEvent(movie!)),
                    child: const Icon(Icons.bookmark_border_rounded)),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    // final movieRepository = getIt<MovieRepository>();
    // return FutureBuilder(
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
    // );
  }
}
