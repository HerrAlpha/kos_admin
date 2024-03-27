import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_admin/component/buttons.dart';
import 'package:kos_admin/config/themes/app_theme.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:kos_admin/moduls/features/occupy/controllers/occupy_controller.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class SubscriptionView extends StatelessWidget {
  SubscriptionView({super.key});

  final OccupyController occupyController = Get.put(OccupyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  occupyController.onInit();
                },
                icon: Icon(Icons.refresh)),
            const SizedBox(height: 10.0),
            Expanded(
              child: Obx(
                () => DataTable2(
                  // border: TableBorder.all(width: 1.0),
                  columns: [
                    DataColumn2(
                      size: ColumnSize.S,
                      label: Text(
                        'Number',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                    DataColumn2(
                      tooltip: 'The floor of the room',
                      size: ColumnSize.M,
                      label: Text(
                        'Status',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Text(
                        'Order',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Text(
                        'Check In',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Text(
                        'Detail',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                  ],
                  rows: occupyController.occupiesList
                      .map(
                        (occupy) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                occupy.roomNumber,
                                style: AppTheme.mainTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 12.0),
                              ),
                            ),
                            DataCell(
                              Text(
                                occupy.status,
                                style: AppTheme.mainTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 12.0),
                              ),
                            ),
                            DataCell(
                              Text(
                                occupy.orderDate,
                                style: AppTheme.mainTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 12.0),
                              ),
                            ),
                            DataCell(
                              Text(
                                occupy.checkInDate,
                                style: AppTheme.mainTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 12.0),
                              ),
                            ),
                            DataCell(Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ButtonComponent(
                                  onTap: () async {
                                    Get.toNamed('/subscription');
                                    print('idOccupy: ${occupy.idOccupy}');
                                    await LocalDBServices.setUUID(
                                        occupy.idOccupy);
                                  },
                                  text: 'Lihat',
                                  color: Colours.greenPrimary),
                            )),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
