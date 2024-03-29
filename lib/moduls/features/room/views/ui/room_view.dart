import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_admin/component/buttons.dart';
import 'package:kos_admin/config/themes/app_theme.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:kos_admin/moduls/features/resident_image/controllers/resident_image_controller.dart';
import 'package:kos_admin/moduls/features/room/controllers/room_controller.dart';
import 'package:kos_admin/moduls/models/rooms/rooms_response.dart';

class RoomView extends StatelessWidget {
  RoomView({super.key});

  final RoomController roomController = Get.put(RoomController());
  final ResidentImageController residentImageController =
      Get.put(ResidentImageController());
  final List<String> floor = ['all', '1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                label: Row(
                  children: [
                    Text(
                      'Floor',
                      style: AppTheme.mainTheme.textTheme.headlineMedium!
                          .copyWith(fontSize: 14.0),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Pilih Lantai',
                            content: Column(
                              children: floor
                                  .map(
                                    (e) => ListTile(
                                      title: Text(e),
                                      onTap: () {
                                        roomController.roomFloor.value = e;
                                        roomController.listRoom();
                                        Get.back();
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                        child: const Icon(Icons.arrow_drop_down, size: 16.0))
                  ],
                ),
              ),
              DataColumn2(
                size: ColumnSize.M,
                label: Text(
                  'Status',
                  style: AppTheme.mainTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 14.0),
                ),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Text(
                  'Option +',
                  style: AppTheme.mainTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 14.0),
                ),
              ),
              DataColumn2(
                size: ColumnSize.L,
                label: Text(
                  'Type',
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
                size: ColumnSize.S,
                label: Text(
                  'Residents',
                  style: AppTheme.mainTheme.textTheme.headlineMedium!
                      .copyWith(fontSize: 14.0),
                ),
              ),
            ],
            rows: roomController.roomsList
                .map(
                  (room) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          room.roomNumber,
                          style: AppTheme.mainTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 12.0),
                        ),
                      ),
                      DataCell(
                        Text(
                          room.roomFloor,
                          style: AppTheme.mainTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 12.0),
                        ),
                      ),
                      DataCell(
                        Text(
                          room.roomStatus,
                          style: AppTheme.mainTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 12.0),
                        ),
                      ),
                      DataCell(
                        Text(
                          room.isDoubleBed,
                          style: AppTheme.mainTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 12.0),
                        ),
                      ),
                      DataCell(
                        Text(
                          room.roomType,
                          style: AppTheme.mainTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 12.0),
                        ),
                      ),
                      DataCell(
                        Text(
                          room.checkIn,
                          style: AppTheme.mainTheme.textTheme.bodyMedium!
                              .copyWith(fontSize: 12.0),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ButtonComponent(
                            onTap: () {
                              _showResidentsDialog(context, room.residents);
                            },
                            text: 'Lihat',
                            color: Colours.greenPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _showResidentsDialog(BuildContext context, List<Resident> residents) {
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
                    subtitle: SingleChildScrollView(
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
                          )
                        ],
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
