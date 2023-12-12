import 'package:either_dart/either.dart';

import '../core/helper/constants.dart';
import '../core/helper/dio_helper.dart';
import '../core/model/failure_model.dart';

class HomeRepository {
  String photoViewUrl = '';

  /// Get Home
  Future<Either<FailureModel, dynamic>> getHomeData() async {
    final response = await DioHelper.get(
      url: AppConstants.movieEndPoint,
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  void setPhotoViewUrl({required String url}) {
    photoViewUrl = url;
  }
}
