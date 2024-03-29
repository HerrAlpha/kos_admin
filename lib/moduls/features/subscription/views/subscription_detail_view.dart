import 'dart:async';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_admin/component/buttons.dart';
import 'package:kos_admin/component/layout.dart';
import 'package:kos_admin/config/themes/app_theme.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:kos_admin/moduls/features/invoice_image/controllers/invoice_image_controller.dart';
import 'package:kos_admin/moduls/features/subscription/controllers/subscription_acception_controller.dart';
import 'package:kos_admin/moduls/features/subscription/controllers/subscription_controller.dart';

class SubscriptionDetailView extends StatelessWidget {
  SubscriptionDetailView({Key? key}) : super(key: key);

  final SubscriptionController subscriptionController =
      Get.put(SubscriptionController());
  final SubscriptionAcceptionController subscriptionAcceptionController =
      Get.put(SubscriptionAcceptionController());
  final InvoiceImageController invoiceImageController =
      Get.put(InvoiceImageController());

  @override
  Widget build(BuildContext context) {
    return PageLayout.withBackButtonNoAppBarColor(
      title: 'Detail Subscription',
      body: Center(
        child: Obx(
          () => DataTable2(
            columns: [
              DataColumn2(
                size: ColumnSize.M,
                label: Text('Start Date',
                    style: AppTheme.mainTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0)),
              ),
              DataColumn2(
                size: ColumnSize.M,
                label: Text('End Date',
                    style: AppTheme.mainTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0)),
              ),
              DataColumn2(
                size: ColumnSize.M,
                label: Text('Status',
                    style: AppTheme.mainTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0)),
              ),
              DataColumn2(
                size: ColumnSize.M,
                label: Text('Price',
                    style: AppTheme.mainTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0)),
              ),
              DataColumn2(
                size: ColumnSize.M,
                label: Text('Invoice',
                    style: AppTheme.mainTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0)),
              ),
              DataColumn2(
                size: ColumnSize.M,
                label: Text('Acception',
                    style: AppTheme.mainTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14.0)),
              ),
            ],
            rows: subscriptionController.subscriptionList
                .map(
                  (e) => DataRow(cells: [
                    DataCell(Text(e.startDate,
                        style: AppTheme.mainTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 12.0))),
                    DataCell(Text(e.endDate,
                        style: AppTheme.mainTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 12.0))),
                    DataCell(Text(e.status,
                        style: AppTheme.mainTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 12.0))),
                    DataCell(Text(e.grandTotal,
                        style: AppTheme.mainTheme.textTheme.bodyMedium!
                            .copyWith(fontSize: 12.0))),
                    DataCell(Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ButtonComponent(
                          onTap: () async {
                            await invoiceImage(e.idSubscription);
                          },
                          text: 'See Invoice',
                          color: Colours.greenPrimary),
                    )),
                    DataCell(
                        acception(e.status, idSubscription: e.idSubscription)),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget acception(String subscriptionStatus, {String? idSubscription}) {
    const String paid = 'paid';
    const String rejected = 'rejected';
    if (subscriptionStatus == 'pending') {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            IconButton(
                tooltip: 'Accept',
                onPressed: () {
                  subscriptionAcceptionController.acceptSubscription(
                      idSubscription!, paid);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colours.greenPrimary,
                )),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                tooltip: 'Reject',
                onPressed: () {
                  subscriptionAcceptionController.acceptSubscription(
                      idSubscription!, rejected);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colours.danger,
                )),
          ],
        ),
      );
    }

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: subscriptionStatus == paid
            ? const Icon(Icons.check, color: Colours.greenPrimary, size: 20.0)
            : const Icon(Icons.clear, color: Colours.danger, size: 20.0));
  }

  Future<void> invoiceImage(String idSubscription) async {
    await invoiceImageController.getInvoiceImage(idSubscription);
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invoice Image'),
          content: SizedBox(
            height: 300,
            width: 300,
            child: Image.memory(
              invoiceImageController.invoiceImage.value,
              fit: BoxFit.cover,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
