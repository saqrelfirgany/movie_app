import 'package:bnoud/features/home/home_screen/home_cubit.dart';
import 'package:flutter/material.dart';

import 'home_movie_list_item.dart';

class HomeMovieList extends StatelessWidget {
  const HomeMovieList({Key? key, required this.cubit}) : super(key: key);
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cubit.movieList.length,
      itemBuilder: (context, index) {
        return HomeMovieListItem(
          movieModel: cubit.movieList[index],
          isShowDialog: true,
        );
      },
    );
  }
}
