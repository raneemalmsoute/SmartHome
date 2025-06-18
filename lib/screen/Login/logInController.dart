import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:raneamproject/core/class/statusrequest.dart' ;
import 'package:raneamproject/core/service/service.dart'     ;
import 'package:raneamproject/screen/Login/loginData.dart'   ;
import 'package:fluttertoast/fluttertoast.dart'              ;
import 'package:raneamproject/screen/mainf/MainScreen.dart'  ;
import '../../core/fun/handleData.dart'                      ;
import 'package:firebase_messaging/firebase_messaging.dart'  ;
abstract class LoginController extends GetxController{
  late TextEditingController emailCon ,passwordCon                              ;
  late GlobalKey<FormState> globalKey                                           ;
  StatusRequest statusRequest = StatusRequest.success                           ;
  LoginData loginData = LoginData()                                             ;
  bool isShow = false                                                           ;
  obscurePassword()                                                             ;
  login()                                                   ;
  MyServices myServices = Get.find()    ;
}
class LoginControllerImp extends LoginController{
  @override
  void onInit() {
    emailCon    = TextEditingController()         ;
    passwordCon = TextEditingController()         ;
    globalKey   = GlobalKey<FormState>()          ;
    super.onInit()                                ;
  }
  @override
  void dispose() {
     emailCon.dispose()        ;
     passwordCon.dispose()     ;
    super.dispose()            ;
  }



  @override
  obscurePassword() {
    isShow = !isShow             ;
    update()                     ;
  }

  @override
  login()async {
    if(!globalKey.currentState!.validate()){
      return Fluttertoast.showToast(msg: 'Please input valid value');

    }
    statusRequest =StatusRequest.loading ;
    update()                             ;
    var response = await loginData.login(emailCon.text, passwordCon.text);
    statusRequest = handlingData(response)                      ;
    if(statusRequest==StatusRequest.success){
      myServices.sharedPreferences.setString('name', response['user']['name']);
      myServices.sharedPreferences.setString('token', response['token']);
      await FirebaseMessaging.instance.subscribeToTopic('raneem')            ;
      Get.offAll(()=>const MainScreen());
    }
    statusRequest = StatusRequest.success ;
    update() ;
    }

}