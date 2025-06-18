import 'package:get/get.dart' ;
import 'package:raneamproject/screen/Saftey/safteyData.dart';

import '../../core/class/statusrequest.dart';
import '../../core/fun/handleData.dart';
import '../../model/serviceModel.dart';
abstract class SafetyController extends GetxController{
  StatusRequest statusRequest = StatusRequest.loading  ;
  SafetyData safetyData = SafetyData();
  ServiceModel? serviceModel ;
}
class SafetyControllerImp extends SafetyController{
  @override
  void onInit()async {
    var response = await safetyData.getSensorValue() ;
    statusRequest = handlingData(response) ;
    if(statusRequest==StatusRequest.success){
      serviceModel = ServiceModel.fromJson(response) ;
    }
    update() ;
    super.onInit();
  }
}