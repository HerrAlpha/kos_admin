import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class PageLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget floatingActionButton;
  final bool needFloatingActionButton;
  final bool colorAppBar;
  final Color appBarColor;
  final bool needBackButton;
  final bool needAdditionalButton;
  final IconData? additionalButtonIcon;
  final Function? navigateAdditionalButtonTo;
  final Color backgroundColor;
  final EdgeInsets padding;
  final bool needBottomNavbar;
  final Widget bottomNavbar;

  const PageLayout.simpleNoFloatingActionButton({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = false,
        appBarColor = Colors.transparent,
        needBackButton = false,
        needAdditionalButton = false,
        additionalButtonIcon = null,
        navigateAdditionalButtonTo = null;

  const PageLayout.simpleWithFloatingActionButton({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.floatingActionButton,
  })  : needFloatingActionButton = true,
        colorAppBar = false,
        appBarColor = Colors.transparent,
        needBackButton = false,
        needAdditionalButton = false,
        additionalButtonIcon = null,
        navigateAdditionalButtonTo = null;

  // simpleWithColorAppBar no icon
  const PageLayout.simpleWithColorAppBar({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.appBarColor,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = true,
        needBackButton = false,
        needAdditionalButton = false,
        additionalButtonIcon = null,
        navigateAdditionalButtonTo = null;

  // simpleWithColorAppBar with icon with floating action button

  const PageLayout.simpleWithColorAppBarWithFloatingActionButton({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.appBarColor,
    required this.floatingActionButton,
  })  : needFloatingActionButton = true,
        colorAppBar = true,
        needBackButton = false,
        needAdditionalButton = false,
        additionalButtonIcon = null,
        navigateAdditionalButtonTo = null;

  // with back button

  const PageLayout.withBackButton({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.appBarColor,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = true,
        needBackButton = true,
        needAdditionalButton = false,
        additionalButtonIcon = null,
        navigateAdditionalButtonTo = null;

  // with no appbar color

  const PageLayout.withBackButtonNoAppBarColor({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = false,
        appBarColor = Colors.transparent,
        needBackButton = true,
        needAdditionalButton = false,
        additionalButtonIcon = null,
        navigateAdditionalButtonTo = null;

  // with back button and additional button

  const PageLayout.withBackButtonAndAdditionalButton({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.appBarColor,
    required this.additionalButtonIcon,
    required this.navigateAdditionalButtonTo,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = true,
        needBackButton = true,
        needAdditionalButton = true;

  // with no appbar color

  const PageLayout.withBackButtonAndAdditionalButtonNoAppBarColor({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.additionalButtonIcon,
    required this.navigateAdditionalButtonTo,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = false,
        appBarColor = Colors.transparent,
        needBackButton = true,
        needAdditionalButton = true;

  // with no back button

  const PageLayout.withAdditionalButton({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.appBarColor,
    required this.additionalButtonIcon,
    required this.navigateAdditionalButtonTo,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = true,
        needBackButton = false,
        needAdditionalButton = true;

  const PageLayout.withAdditionalButtonNoAppBarColor({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavbar = const Placeholder(),
    this.needBottomNavbar = false,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = Colors.white,
    required this.additionalButtonIcon,
    required this.navigateAdditionalButtonTo,
  })  : needFloatingActionButton = false,
        floatingActionButton = const Placeholder(),
        colorAppBar = false,
        appBarColor = Colors.transparent,
        needBackButton = false,
        needAdditionalButton = true;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: colorAppBar ? appBarColor : Colors.transparent,
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (needBackButton)
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:
                                colorAppBar ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () async {
                              // get navigation pop
                              Get.back();
                              await LocalDBServices.removeUUID();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: colorAppBar ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          color: colorAppBar ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  if (needAdditionalButton)
                    IconButton(
                      onPressed: () {
                        // get navigation pop
                        navigateAdditionalButtonTo!();
                      },
                      icon: Icon(
                        additionalButtonIcon,
                        color: colorAppBar ? Colors.white : Colors.black,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(padding: padding, child: body),
        ),
        bottomNavigationBar: needBottomNavbar
            ? Container(padding: padding, child: bottomNavbar)
            : null,
        floatingActionButton:
            needFloatingActionButton ? floatingActionButton : null,
      ),
    );
  }
}
