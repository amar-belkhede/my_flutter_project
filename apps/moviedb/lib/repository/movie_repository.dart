import 'package:injectable/injectable.dart';
import 'package:network_service/api/moviedb_api_endpoint.dart';
import 'package:network_service/model/film_model.dart';

@injectable
class MovieRepository {
  final MoviedbApiEndpoint _moviedbApiEndpoint;

  MovieRepository(this._moviedbApiEndpoint);

  Future<FilmModel> getDiscoverMovie() async {
    return await _moviedbApiEndpoint.getDiscoverMovie();
  }
}
