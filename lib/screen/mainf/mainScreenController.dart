import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raneamproject/screen/Login/LoginScreen.dart';
import 'package:raneamproject/screen/Saftey/safteyScreen.dart';
import 'package:raneamproject/screen/humidity/humidityScreen.dart';
import 'package:raneamproject/screen/light/lightScreen.dart';
import '../../core/class/statusrequest.dart';
import '../../core/service/service.dart';
import 'package:firebase_messaging/firebase_messaging.dart' ;
abstract class MainController extends GetxController {

  List titles = ['Safety','Control','  Humidity  \nTemperature'];
  List<Widget> pages = const [ SafetyScreen(), MyControlerScreen(),  HumidityScreen()];
  List<IconData> icons = [Icons.safety_check,Icons.sensors,Icons.heat_pump];
  int selectPage     = 0                              ;
  StatusRequest statusRequest = StatusRequest.success ;
  MyServices myServices = Get.find()                  ;

  //=============methode============
  choosePage(int index);
  logout()      ;

}

class MainControllerImp extends MainController {
  @override
  choosePage(int index) {
    selectPage = index;
    update();
  }

  @override
  logout() {
    myServices.sharedPreferences.clear()                               ;
    FirebaseMessaging.instance.unsubscribeFromTopic('raneem')          ;
    Get.offAllNamed(LoginScreen.id)                                    ;

  }

}
