import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:test_mvvmproviders/view/user/repo/api_status.dart';
import '../../../utils/constants.dart';
import '../model/user_model.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USERS_LIST));
      if (SUCCESS == response.statusCode) {
        return Success(
            code: SUCCESS, response: userModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
