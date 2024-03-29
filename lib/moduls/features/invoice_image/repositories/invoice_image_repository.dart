import 'package:dio/dio.dart';
import 'package:kos_admin/constant/core/api_const.dart';
import 'package:kos_admin/shared/services/api_service.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class InvoiceImageRepository {
  static final Dio _dio = ApiServices.dioCall();

  static Future<List<int>> getInvoiceImage(Map<String, dynamic> request) async {
    try {
      String url = ApiConst.invoiceImage;
      String? token = await LocalDBServices.getToken();

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await _dio.post<List<int>>(
        url,
        data: request,
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        // Check if response status code is OK
        // convert to Uint8List

        return response.data!;
      } else {
        // Handle non-200 status codes
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to fetch invoice image: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Handle Dio errors
      throw e;
    }
  }
}
