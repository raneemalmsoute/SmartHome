import 'package:get/get.dart';
import 'package:raneamproject/screen/Login/LoginScreen.dart';
abstract class SplashController extends GetxController{
  goToNextScreen();
}
class SplashControllerImp extends SplashController{
  @override
  void onInit()async {
    await goToNextScreen() ;
    super.onInit()   ;
  }
  @override
  goToNextScreen() {
    Future.delayed(const Duration(seconds: 3,),() {
      Get.offNamed('/f') ;
    },);
  }

}