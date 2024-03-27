import 'package:dio/dio.dart';
import 'package:kos_admin/constant/core/api_const.dart';
import 'package:kos_admin/moduls/models/subscriptions/subscriptions_response.dart';
import 'package:kos_admin/shared/services/api_service.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class SubscriptionRepository {
  static final Dio _dio = ApiServices.dioCall();
  static Future<SubscriptionsResponseModel?> getSubscriptionList(
      Map<String, dynamic> request) async {
    try {
      String url = ApiConst.listSubscription;
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
      return SubscriptionsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
