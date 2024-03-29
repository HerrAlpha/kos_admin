import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:kos_admin/constant/core/api_const.dart';
import 'package:kos_admin/shared/services/api_service.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class ResidentImageRepository {
  static final Dio _dio = ApiServices.dioCall();

  static Future<List<int>> getInvoiceImage(Map<String, dynamic> request) async {
    Uint8List createImagePlaceholder(int width, int height,
        {int color = 0xFFcccccc}) {
      // Input validation for width and height
      if (width <= 0 || height <= 0) {
        throw ArgumentError('Width and height must be positive integers.');
      }

      // Create a Uint8List with the appropriate size for RGBA pixels
      final int pixelCount = width * height * 4;
      final Uint8List imageData = Uint8List(pixelCount);

      // Fill the image data with the placeholder color (RGBA format)
      for (int i = 0; i < pixelCount; i += 4) {
        imageData[i] = (color >> 24) & 0xff; // Red
        imageData[i + 1] = (color >> 16) & 0xff; // Green
        imageData[i + 2] = (color >> 8) & 0xff; // Blue
        imageData[i + 3] = 0xff; // Alpha (fully opaque)
      }

      return imageData;
    }

    try {
      String url = ApiConst.imageResident;
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
      List<int> result = createImagePlaceholder(100, 100).toList();
      return result;
    }
  }
}
