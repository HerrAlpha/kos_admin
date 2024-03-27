import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/subscription/repositories/subscription_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/subscriptions/subscriptions_request.dart';
import 'package:kos_admin/moduls/models/subscriptions/subscriptions_response.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class SubscriptionController extends GetxController {
  // there's parameter by idOccupy because it will place in new page

  @override
  void onInit() {
    super.onInit();
    listSubscription();
  }

  RxList<SubscriptionData> subscriptionList = <SubscriptionData>[].obs;

  void listSubscription() async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    String? idOccupy;
    idOccupy = await LocalDBServices.getUUID();

    SubscriptionsRequestModel subscriptionsRequest =
        SubscriptionsRequestModel(idUser: idUser, idOccupy: idOccupy!);

    print(subscriptionsRequest.toJson());

    try {
      var value = await SubscriptionRepository.getSubscriptionList(
          subscriptionsRequest.toJson());

      if (value!.statusCode == '200') {
        Get.snackbar('Success', 'Success');
        subscriptionList.assignAll(value.data);
      } else {
        Get.snackbar('Failed', value.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
