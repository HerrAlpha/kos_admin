import 'package:dio/dio.dart';
import 'package:kos_admin/constant/core/api_const.dart';
import 'package:kos_admin/moduls/models/subscription_acceptions/subscription_acceptions_response.dart';
import 'package:kos_admin/shared/services/api_service.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class SubscriptionAcceptionRepository {
  static final Dio _dio = ApiServices.dioCall();
  static Future<SubscriptionAcceptionsResponseModel?> sendSubscriptionStatus(
      Map<String, dynamic> request) async {
    try {
      String url = ApiConst.subscriptionAcception;
      String? token;
      token = await LocalDBServices.getToken();
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await _dio.post(
        url,
        data: request,
        options: Options(
          headers: headers,
        ),
      );
      return SubscriptionAcceptionsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
