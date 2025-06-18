
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raneamproject/splashScreen/splashController.dart';

class SplashScreen extends GetView<SplashControllerImp> {
  static String id ='/SplashScreen';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashControllerImp());
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity  ,
          height: double.infinity ,
          child: Center(
            child: Image.asset('assets/images/splashScreen.png',),
          ),
        ),
      ),
    );
  }
}
