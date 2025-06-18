import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:raneamproject/screen/Login/LoginScreen.dart';

import '../../screen/mainf/MainScreen.dart';
import '../service/service.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1             ;

  @override
  RouteSettings? redirect(String? route) {
    MyServices myServices = Get.find();
    String? loginToken = myServices.sharedPreferences.getString('token')  ;
    if (loginToken!=null) {
      return  RouteSettings(name: MainScreen.id);
    }

    return  RouteSettings(name: LoginScreen.id);
  }
}