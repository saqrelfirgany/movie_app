import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../model/failure_model.dart';
import 'constants.dart';
import 'helper.dart';

class DioHelper {
  static Dio? dio;

  /// Initialize dio
  static Future init() async {
    /// Get user language code from storage
    // String userLocale = getx.Get.find<LangController>().selectedLang;
    // LocalStorage localStorage = LocalStorage();
    /// Get user auth token
    // userAuthenticationToken = await Helper.getUserTokenInSharedPreferences();
    // AppConstants.language = await localStorage.getLang;
    /// Set headers
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      // "User-Agent": Platform.operatingSystem,
      // "lang": '$userLocale',
      if (Helper.token.isNotEmpty) "Authorization": 'Bearer ${Helper.token}',
    };

    /// Set dio
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        followRedirects: true,
        receiveDataWhenStatusError: true,
        // contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: headers,
        connectTimeout: const Duration(seconds: 60),
        // 60 seconds
        receiveTimeout: const Duration(seconds: 60),
        // 60 seconds
        validateStatus: (status) {
          return status! < 800;
        },
      ),
    );
  }

  ///
  /// GET
  ///
  static Future<Either<FailureModel, dynamic>> get({
    required String url,
    Map<String, dynamic>? parameters,
    int? page = 1,
    int? limit,
    bool logoutUserFlag = true,
    Map<String, dynamic>? headers,
  }) async {
    try {
      log('AppConstants baseUrl : ${AppConstants.baseUrl}');
      log('URL ENDPOINT : $url');
      log('parameters : $parameters');

      var response = await dio!.get(
        url,
        queryParameters: parameters ?? {'api_key': AppConstants.apiKey},
        options: Options(headers: headers),
      );
      dynamic dynamicResponse = await jsonDecode(response.toString());
      log('dynamicResponse$dynamicResponse');
      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          logOutUser(message: dynamicResponse['message']);
        }
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['message']));
      } else {
        return Left(FailureModel(message: dynamicResponse['message']));
      }
    } on DioError catch (e) {
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }

  static void logOutUser({required String message}) {
    // showAlertDialog(
    //   canClose: false,
    //   height: 160,
    //   text: message,
    //   press: () {
    //     Helper.token = '';
    //     Helper.isLoggedIn = false;
    //     Helper.saveUserLogged(false);
    //     Helper.saveUserToken('');
    //     navigatorKey.currentContext!.go(AppRouteName.loginScreenRoute);
    //   },
    // );
  }

  /// POST
  static Future<Either<FailureModel, dynamic>> post({url, parameters, data}) async {
    try {
      final response = await dio!.post(
        url,
        queryParameters: parameters,
        data: data,
      );
      log('AppConstants baseUrl : ${AppConstants.baseUrl}');
      log('URL ENDPOINT : $url');
      log('parameters : $parameters');
      log('data : $data');

      dynamic dynamicResponse = await jsonDecode(response.toString());
      log('dynamicResponse : $dynamicResponse');

      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          logOutUser(message: dynamicResponse['message']);
        }
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['message']));
      } else {
        if (dynamicResponse['errors'] != null) {
          if (dynamicResponse['errors'].isNotEmpty) {
            return Left(
              FailureModel(
                message: dynamicResponse['errors'][0],
                errors: dynamicResponse['errors'],
              ),
            );
          }
          return Left(
            FailureModel(
              message: dynamicResponse['message'],
              statusCode: response.statusCode!,
              errors: dynamicResponse['errors'],
            ),
          );
        } else {
          return Left(
            FailureModel(
              message: 'somethingWentWrong',
              errors: dynamicResponse['errors'],
            ),
          );
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(FailureModel(message: 'Please check your internet connection'));
      }
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }

  /// POST
  static Future<Either<FailureModel, dynamic>> delete({url, parameters, data}) async {
    try {
      final response = await dio!.delete(
        url,
        queryParameters: parameters,
        data: data,
      );
      log('AppConstants baseUrl : ${AppConstants.baseUrl}');
      log('URL ENDPOINT : $url');
      log('parameters : $parameters');
      log('data : $data');

      dynamic dynamicResponse = await jsonDecode(response.toString());
      if (response.statusCode == 200) {
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['messageasd']));
      } else {
        if (dynamicResponse['errors'] != null) {
          if (dynamicResponse['errors'].isNotEmpty) {
            return Left(
              FailureModel(
                message: dynamicResponse['message'],
                errors: dynamicResponse['errors'],
              ),
            );
          }
          return Left(
            FailureModel(
              message: dynamicResponse['message'],
              statusCode: response.statusCode!,
              errors: dynamicResponse['errors'],
            ),
          );
        } else {
          return Left(
            FailureModel(
              message: 'somethingWentWrong',
              errors: dynamicResponse['errors'],
            ),
          );
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(FailureModel(message: 'Please check your internet connection'));
      }
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }

  /// PUT
  static Future<Either<FailureModel, dynamic>> put({url, parameters, data}) async {
    try {
      final response = await dio!.put(
        url,
        queryParameters: parameters,
        data: data,
      );
      log('AppConstants baseUrl : ${AppConstants.baseUrl}');
      log('URL ENDPOINT : $url');
      log('parameters : $parameters');
      log('data : $data');

      dynamic dynamicResponse = await jsonDecode(response.toString());
      log('dynamicResponse$dynamicResponse');
      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          logOutUser(message: dynamicResponse['message']);
        }
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['message']));
      } else {
        return Left(FailureModel(message: dynamicResponse['message']));
      }
    } on DioError catch (e) {
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }
}
