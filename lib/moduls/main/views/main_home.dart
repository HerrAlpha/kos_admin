import 'package:flutter/material.dart';
import 'package:kos_admin/component/side_menu.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> headTitle = [
      'Dashboard',
      'User',
      'Product',
      'Transaction',
      'Setting',
    ];
    const List<IconData> headIcon = [
      Icons.dashboard,
      Icons.person,
      Icons.shopping_bag,
      Icons.credit_card,
      Icons.settings,
    ];
    const List<Color> headColor = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];
    const List<Widget> pages = [
      Text('Dashboard'),
      Text('User'),
      Text('Product'),
      Text('Transaction'),
      Text('Setting'),
    ];
    return SideMenuBar(
        headTitle: headTitle,
        headIcon: headIcon,
        headColor: headColor,
        pages: pages);
  }
}
