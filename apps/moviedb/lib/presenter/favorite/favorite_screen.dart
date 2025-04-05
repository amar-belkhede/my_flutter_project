import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/di/configure_dependency.dart';
import 'package:moviedb/presenter/favorite/cubit/favorite_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FavoriteCubit _favoriteCubit = getIt<FavoriteCubit>();
  @override
  void initState() {
    super.initState();
    _favoriteCubit.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: _favoriteCubit,
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteError) {
          return Center(child: Text(state.message));
        } else if (state is FavoriteInitial) {
          return const Center(child: Text("No favorite movies found"));
        } else if (state is FavoriteSuccess) {
          return _buildFavoriteMoviesList(state);
        } else {
          return const Center(child: Text("Unknown state"));
        }
      },
    );
  }

  _buildFavoriteMoviesList(FavoriteSuccess state) {
    return ListView.builder(
      itemCount: state.movies.length,
      itemBuilder: (context, index) {
        final movie = state.movies[index];
        return ListTile(
          title: Text(movie.title ?? ""),
          subtitle: Text(movie.overview ?? ""),
          trailing: InkWell(
            onTap: () => _favoriteCubit.removeFromFavorite(movie),
            child: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
