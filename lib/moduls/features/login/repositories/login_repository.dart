import 'package:dio/dio.dart';
import 'package:kos_admin/constant/core/api_const.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/shared/services/api_service.dart';

class LoginRepository {
  static final Dio _dio = ApiServices.dioCall();
  static Future<LoginsResponseModel> login(
    Map<String, dynamic> body,
  ) async {
    try {
      const String url = ApiConst.login;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return LoginsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
