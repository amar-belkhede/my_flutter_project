import 'package:dio/dio.dart';
import 'package:network_service/model/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'moviedb_api_endpoint.g.dart';

// baseUrl: "https://api.themoviedb.org/3"
@RestApi()
abstract class MoviedbApiEndpoint {
  factory MoviedbApiEndpoint(Dio dio) = _MoviedbApiEndpoint;

  @GET("/discover/movie")
  Future<MovieResponse> getDiscoverMovie({
    @Query("language") String language = "en-US",
    @Query("include_adult") bool includeAdult = false,
    @Query("page") int page = 1,
  });

  @GET("/discover/tv")
  Future<MovieResponse> getDiscoverTv({
    @Query("language") String language = "en-US",
    @Query("include_adult") bool includeAdult = false,
    @Query("page") int page = 1,
  });
}
