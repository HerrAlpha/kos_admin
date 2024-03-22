import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuBar extends StatelessWidget {
  final List<String> headTitle;
  final List<IconData> headIcon;
  final List<Color> headColor;
  final List<Widget> pages;
  final Color backgroundColor;

  SideMenuBar({
    Key? key,
    required this.headTitle,
    required this.headIcon,
    required this.headColor,
    required this.pages,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final selectedMenuItem = RxInt(0);
  final hoveredIndex = RxInt(-1); // Using RxInt for hovered index,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Row(
          children: [
            // left for side menu with floating design and rounded corner
            Container(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 250,
                height: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: ListView.builder(
                  itemCount: headTitle.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isHovered = hoveredIndex.value == index;
                      return MouseRegion(
                        onEnter: (_) {
                          hoveredIndex.value = index;
                        },
                        onExit: (_) {
                          hoveredIndex.value = -1;
                        },
                        child: InkWell(
                          onTap: () {
                            selectedMenuItem.value = index;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedMenuItem.value == index
                                  ? headColor[index].withOpacity(0.2)
                                  : isHovered
                                      ? headColor[index].withOpacity(0.1)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    headIcon[index],
                                    color: selectedMenuItem.value == index
                                        ? headColor[index]
                                        : Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  headTitle[index],
                                  style: TextStyle(
                                    color: selectedMenuItem.value == index
                                        ? headColor[index]
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),

            // right side for content
            Expanded(
              child: Obx(
                () {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // app bar

                        Text(
                          headTitle[selectedMenuItem.value],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),

                        // content
                        Expanded(
                          child: pages[selectedMenuItem.value],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
