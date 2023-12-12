import 'dart:developer';

import 'package:bnoud/core/model/failure_model.dart';
import 'package:bnoud/repositories/home_repo.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependencies/dependencies.dart';
import '../../../core/enum/submission_status.dart';
import '../models/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    // log('HomeCubit');
    init();
  }

  Future<void> init() async {
    log('HomeCubit init');
    await getHomeMovieList();
  }

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();

  List<MovieModel> _movieList = [];

  List<MovieModel> get movieList => _movieList;

  Future<void> getHomeMovieList() async {
    final newState0 = state.copyWithGetMovieList(loadingMovieList: true);
    emit(newState0);
    try {
      Either<FailureModel, dynamic> response = await homeRepository.getHomeData();

      response.fold(
        (left) {
          // showAlertDialog(
          //   textList: left.errors,
          //   press: () => SmartDialog.dismiss(),
          // );
        },
        (right) async {
          _movieList.clear();
          List<dynamic> dynamicList = right['results'];
          for (var element in dynamicList) {
            _movieList.add(MovieModel.fromJson(element));
          }
          log('_movieList.length::::${_movieList.length}');
        },
      );
    } catch (error) {
      log('error ${error}');
    } finally {
      final newState = state.copyWithGetMovieList(loadingMovieList: false);
      emit(newState);
    }
  }
}
