import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final Rx<Gradient> gradient = const LinearGradient(
    colors: [Colors.red, Colors.green],
  ).obs;

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateGradient();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void updateGradient() {
    gradient.value = LinearGradient(
      colors: [
        Color(Random().nextInt(0xffffffff)),
        Color(Random().nextInt(0xffffffff)),
        // Color(Random().nextInt(0xffffffff))
      ],
    );
  }
}
