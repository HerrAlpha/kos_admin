import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoverSBController extends GetxController {}

class ButtonComponent extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color color;

  ButtonComponent({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
  }) : super(key: key);

  final RxBool isHovered = false.obs;

  void onEnter() {
    isHovered.value = true;
  }

  void onExit() {
    isHovered.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
          onEnter: (_) => onEnter(),
          onExit: (_) => onExit(),
          child: Obx(() => Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.withOpacity(
                    isHovered.value ? 0.8 : 1.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ))),
    );
  }
}

class OutlinedButtonComponent extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color color;

  OutlinedButtonComponent({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
  }) : super(key: key);

  final RxBool isHovered = false.obs;

  void onEnter() {
    isHovered.value = true;
  }

  void onExit() {
    isHovered.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (_) => onEnter(),
        onExit: (_) => onExit(),
        child: Obx(() => Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isHovered.value
                    ? color
                    : Colors.transparent, // Transparent background
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isHovered.value ? Colors.white : color,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isHovered.value ? Colors.white : color,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
