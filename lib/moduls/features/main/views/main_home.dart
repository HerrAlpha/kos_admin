import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kos_admin/component/buttons.dart';
import 'package:kos_admin/component/side_menu.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:kos_admin/moduls/features/logout/controllers/logout_controller.dart';
import 'package:kos_admin/moduls/features/room/views/ui/room_view.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  final LogoutController logoutController = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    const List<String> headTitle = [
      'Room',
      'Occupant',
      'Subscription',
      'Setting',
    ];
    const List<IconData> headIcon = [
      Icons.dashboard,
      Icons.person,
      Icons.money,
      Icons.settings,
    ];
    const List<Color> headColor = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    List<Widget> pages = [
      RoomView(),
      const Text('Occupant'),
      const Text('Subscription'),
      Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: SizedBox(
          width: 0.1.sw,
          height: 0.1.sh,
          child: ButtonComponent(
              onTap: () {
                logoutController.logout();
              },
              text: 'Logout',
              color: Colours.danger),
        ),
      ),
    ];
    return SideMenuBar(
        headTitle: headTitle,
        headIcon: headIcon,
        headColor: headColor,
        pages: pages);
  }
}
