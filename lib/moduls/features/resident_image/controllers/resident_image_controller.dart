import 'dart:async';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/resident_image/repositories/resident_image_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/resident_images/resident_images_request.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class ResidentImageController extends GetxController {
  Rx<Uint8List> residentImage = Uint8List(0).obs;

  FutureOr<Uint8List?> getResidentImage(
      String idResident, String typePhoto) async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    ResidentImagesRequestModel residentImagesRequest =
        ResidentImagesRequestModel(
            idUser: idUser,
            idResident: idResident,
            typePhoto: typePhoto,
            permission: 'private');

    print(residentImagesRequest.toJson());

    try {
      List<int> value = await ResidentImageRepository.getInvoiceImage(
          residentImagesRequest.toJson());
      // print(value);
      // Assuming InvoiceImageRepository.getInvoiceImage() returns Uint8List

      Uint8List result = Uint8List.fromList(value);
      residentImage.value = result;
      return result;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      Uint8List result = createImagePlaceholder(100, 100);
      return result; // Return null in case of error
    }
  }

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
}
