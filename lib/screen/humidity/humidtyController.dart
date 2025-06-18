import 'package:get/get.dart'       ;
import 'package:raneamproject/screen/humidity/humidityData.dart';
import '../../core/class/statusrequest.dart';
import '../../core/fun/handleData.dart';
import '../../model/serviceModel.dart';
abstract class HumidityController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading  ;
  HumidityData humidityData = HumidityData(Get.find());
  ServiceModel? serviceModel ;
}
class HumidityControllerImp extends HumidityController{
  @override
  void onInit()async {
    var response = await humidityData.getSensorValue() ;
    statusRequest = handlingData(response) ;
    if(statusRequest==StatusRequest.success){
      serviceModel = ServiceModel.fromJson(response) ;
    }
    update() ;
    super.onInit();
  }
}