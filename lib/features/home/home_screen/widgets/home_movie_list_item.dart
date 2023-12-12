import 'package:bnoud/core/constatnts/app_route_names.dart';
import 'package:bnoud/core/utils/size_utils.dart';
import 'package:bnoud/repositories/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../main.dart';
import '../../models/movie_model.dart';

class HomeMovieListItem extends StatelessWidget {
  HomeMovieListItem({
    super.key,
    required this.movieModel,
    this.isShowDialog = false,
  });

  final MovieModel movieModel;
  final bool isShowDialog;
  final HomeRepository homeRepository = serviceLocator<HomeRepository>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.h),
      ),
      margin: EdgeInsetsDirectional.only(
        start: 20.h,
        end: 20.h,
        bottom: 10.v,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (!isShowDialog) SmartDialog.dismiss();
              homeRepository.setPhotoViewUrl(
                url: AppConstants.imageEndPoint + movieModel.posterPath,
              );
              navigatorKey.currentContext!.push(AppRouteName.photoViewScreenRoute);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.h),
              child: Container(
                height: 130.v,
                width: 120.h,
                child: CustomImageView(
                  imagePath: AppConstants.imageEndPoint + movieModel.posterPath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isShowDialog) return;
                SmartDialog.show(
                  builder: (context) {
                    return HomeMovieListItem(
                      movieModel: movieModel,
                      isShowDialog: false,
                    );
                  },
                );
              },
              child: Container(
                height: 130.v,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.h),
                ),
                padding: EdgeInsetsDirectional.only(
                  start: 10.h,
                  top: 10.v,
                  end: 20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${movieModel.title}'),
                    Row(
                      children: [
                        Text('Popularity: '),
                        Text('${movieModel.popularity}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Vote Average: '),
                        Text('${movieModel.voteAverage}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
