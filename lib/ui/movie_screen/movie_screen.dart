import 'package:flutter/material.dart';
import 'package:flutter_api_calls_with_exceptions_handling/core/helpers/api_response.dart';
import 'package:flutter_api_calls_with_exceptions_handling/ui/movie_screen/movie_list.dart';
import 'package:flutter_api_calls_with_exceptions_handling/ui/movie_screen/movie_screen_viewmodel.dart';
import 'package:flutter_api_calls_with_exceptions_handling/ui/widgets/error_response.dart';
import 'package:flutter_api_calls_with_exceptions_handling/ui/widgets/loading.dart';
import 'package:stacked/stacked.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieScreenViewModel>.reactive(
      viewModelBuilder: () => MovieScreenViewModel(),
      onModelReady: (model) => model.fetchMovieList(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Movie Mania',
              style: TextStyle(color: Colors.lightGreen, fontSize: 28)),
          backgroundColor: Colors.black54,
        ),
        backgroundColor: Colors.black54,
        body: RefreshIndicator(
          onRefresh: () => model.fetchMovieList(),
          child: model.movieList.status == Status.LOADING
              ? Loading(loadingMessage: "Loading Popular Movies")
              : model.movieList.status == Status.COMPLETED
                  ? MovieList(movieList: model.movieList.data)
                  : ErrorResponse(
                      errorMessage: model.movieList.message,
                      onRetryPressed: () => model.fetchMovieList(),
                    ),
        ),
      ),
    );
  }
}
