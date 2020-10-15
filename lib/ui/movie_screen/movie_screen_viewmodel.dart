import 'package:flutter_api_calls_with_exceptions_handling/core/helpers/api_response.dart';
import 'package:flutter_api_calls_with_exceptions_handling/core/models/movie_response_model.dart';
import 'package:flutter_api_calls_with_exceptions_handling/movie_repository.dart';
import 'package:stacked/stacked.dart';

class MovieScreenViewModel extends BaseViewModel {
  ApiResponse<List<Movie>> _movieList;

  ApiResponse<List<Movie>> get movieList => _movieList;

  final _movieRepository = MovieRepository();

  fetchMovieList() async {
    _movieList = ApiResponse.loading('Fetching Popular Movies');
    notifyListeners();
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      _movieList = ApiResponse.completed(movies);
      notifyListeners();
    } catch (e) {
      _movieList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
