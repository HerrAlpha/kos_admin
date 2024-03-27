import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/subscription/controllers/subscription_controller.dart';
import 'package:kos_admin/moduls/features/subscription/repositories/subscription_acception_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/subscription_acceptions/subscription_acceptions_request.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class SubscriptionAcceptionController extends GetxController {
  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());
  void acceptSubscription(
      String idSubscription, String subscriptionStatus) async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    SubscriptionAcceptionsRequestModel subcriptionsAcceptionRequest =
        SubscriptionAcceptionsRequestModel(
      idUser: idUser,
      idSubscription: idSubscription,
      subscriptionStatus: subscriptionStatus,
    );

    print(subcriptionsAcceptionRequest.toJson());

    try {
      var value = await SubscriptionAcceptionRepository.sendSubscriptionStatus(
          subcriptionsAcceptionRequest.toJson());
      print(value!.data);
      if (value!.statusCode == '201') {
        Get.snackbar('Success', 'Success');
        subscriptionController.onInit();
      } else {
        Get.snackbar('Failed', value.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
