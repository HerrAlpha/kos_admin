import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_admin/component/buttons.dart';
import 'package:kos_admin/config/themes/app_theme.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:kos_admin/moduls/features/occupy/controllers/occupy_acception_controller.dart';
import 'package:kos_admin/moduls/features/occupy/controllers/occupy_controller.dart';
import 'package:kos_admin/moduls/features/resident_image/controllers/resident_image_controller.dart';
import 'package:kos_admin/moduls/models/occupies/occupies_response.dart';

class OccupyView extends StatelessWidget {
  OccupyView({super.key});
  final OccupyController occupyController = Get.put(OccupyController());
  final OccupyAcceptionController occupyAcceptionController =
      Get.put(OccupyAcceptionController());
  final ResidentImageController residentImageController =
      Get.put(ResidentImageController());

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
                icon: const Icon(Icons.refresh)),
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
                        'Check Out',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Text(
                        'Residents',
                        style: AppTheme.mainTheme.textTheme.headlineMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Text(
                        'Acception',
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
                            DataCell(
                              Text(
                                occupy.checkOutDate,
                                style: AppTheme.mainTheme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 12.0),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ButtonComponent(
                                  onTap: () {
                                    _showResidentsDialog(
                                        context, occupy.residents);
                                  },
                                  text: 'Lihat',
                                  color: Colours.greenPrimary,
                                ),
                              ),
                            ),
                            DataCell(acception(occupy.status,
                                idOccupy: occupy.idOccupy)),
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

  Widget acception(String occupyStatus, {String? idOccupy}) {
    const String occupied = 'occupied';
    const String rejected = 'rejected';
    const String checkout = 'checkout';
    if (occupyStatus == 'pending') {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            IconButton(
                tooltip: 'Accept',
                onPressed: () {
                  occupyAcceptionController.acceptOccupy(idOccupy!, occupied);
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
                  occupyAcceptionController.acceptOccupy(idOccupy!, rejected);
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
      child: ButtonComponent(
        onTap: () {
          occupyAcceptionController.acceptOccupy(idOccupy!, checkout);
        },
        text: 'Check out',
        color: Colours.danger,
      ),
    );
  }

  void _showResidentsDialog(
      BuildContext context, List<ResidentOccupant> residents) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Daftar Penghuni Kamar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: residents
                .map(
                  (resident) => ListTile(
                    title: Text(
                      'Name: ${resident.fullName}',
                      style: AppTheme.mainTheme.textTheme.bodyMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                    subtitle: Scrollbar(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number: ${resident.phoneNumber}',
                              style: AppTheme.mainTheme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14.0),
                            ),
                            Text(
                              'Address: ${resident.address}',
                              style: AppTheme.mainTheme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14.0),
                            ),
                            Text(
                              'NIK: ${resident.nik}',
                              style: AppTheme.mainTheme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14.0),
                            ),
                            Row(children: [
                              FutureBuilder<Widget>(
                                future: residentImage(
                                    resident.id, 'user'), // your Future<Widget>
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator(); // or some other widget while waiting
                                  } else {
                                    if (snapshot.hasError)
                                      return Text('null');
                                    else
                                      return snapshot
                                          .data!; // Widget of the completed Future
                                  }
                                },
                              ),
                              const SizedBox(width: 10),
                              FutureBuilder<Widget>(
                                future: residentImage(
                                    resident.id, 'ktm'), // your Future<Widget>
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator(); // or some other widget while waiting
                                  } else {
                                    if (snapshot.hasError)
                                      return Text('null');
                                    else
                                      return snapshot
                                          .data!; // Widget of the completed Future
                                  }
                                },
                              ),
                              const SizedBox(width: 10),
                              FutureBuilder<Widget>(
                                future: residentImage(
                                    resident.id, 'nik'), // your Future<Widget>
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator(); // or some other widget while waiting
                                  } else {
                                    if (snapshot.hasError)
                                      return Text('null');
                                    else
                                      return snapshot
                                          .data!; // Widget of the completed Future
                                  }
                                },
                              )
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  Future<Widget> residentImage(String idResident, String typePhoto) async {
    await residentImageController.getResidentImage(idResident, typePhoto);
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.memory(
        residentImageController.residentImage.value,
        fit: BoxFit.cover,
      ),
    );
  }
}
