import 'package:flutter/material.dart'   ;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:raneamproject/core/class/handlingdataview.dart';
import 'package:raneamproject/core/constant/constants.dart';
import 'package:raneamproject/core/widget/customButton.dart';
import 'package:raneamproject/core/widget/customTextFormField.dart';
import 'package:raneamproject/screen/Login/logInController.dart';
import 'package:lottie/lottie.dart';
class LoginScreen extends GetView<LoginControllerImp> {
  static String id ='/LoginScreen'       ;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp())   ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest        ,
                widget: Container(
              margin:const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: controller.globalKey  ,
                child: ListView(
                  children: [
                    Center(child: SizedBox(width:Get.width/2 ,child:const Divider(thickness: 2,)))  ,
                    const SizedBox(height: 32)                          ,
                    Center(child: Lottie.asset('assets/images/smartHome.json',height: Get.height/3.5))       ,
                    const SizedBox(height: 16,),
                    const Text('email') ,
                    const SizedBox(height: 8,)   ,
                    CustomTextFormField(hint: 'Example@mail.com',textEditingController: controller.emailCon,isPassword: false, type: 'email'),
                    const SizedBox(height: 16,),
                    const Text('password'),
                    const SizedBox(height: 8,)        ,
                    CustomTextFormField(hint: 'Enter your password',isShow: controller.isShow,
                        hidePassword: controller.obscurePassword,
                        textEditingController: controller.passwordCon,isPassword: true,type: 'password'),
                    const SizedBox(height: 32,),
                    CustomButton(onPress: controller.login,
                        color: kOrangeColor, width: 200, height: 50, title: 'Login'),
                  ],
                ),
              ),
            ));
          }
        ),
      ),
    );
  }
}
