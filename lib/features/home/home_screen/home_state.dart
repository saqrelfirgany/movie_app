part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.submissionStatus = SubmissionStatus.idle,
    this.loadingMovieList,
  });

  final bool? loadingMovieList;

  get isLoadingMovieList => loadingMovieList ?? false;

  final SubmissionStatus submissionStatus;

  HomeState copyWith({
    SubmissionStatus? submissionStatus,
  }) {
    return HomeState(
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  HomeState copyWithGetMovieList({
    bool? loadingMovieList,
  }) {
    return HomeState(
      loadingMovieList: loadingMovieList ?? this.loadingMovieList,
    );
  }

  @override
  List<Object?> get props => [
        submissionStatus,
        loadingMovieList,
      ];
}
