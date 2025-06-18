import 'package:get/get.dart';
import 'package:raneamproject/core/class/statusrequest.dart';
import 'package:raneamproject/core/fun/get_sensorVal.dart';
import 'package:raneamproject/core/fun/handleData.dart';
import 'package:raneamproject/model/serviceModel.dart';
import 'package:raneamproject/screen/light/lighData.dart';

import '../../core/service/service.dart';
abstract class LightController extends GetxController{
  StatusRequest statusRequest = StatusRequest.loading  ;
  LightData lightData = LightData();
  ServiceModel? serviceModel ;
  String? ownerName ,gassSensor ,flameSensor ,lED_living_Sensor,lED_garden_right_Sensor,led_pool_sensor,
      lED_kitchen_Sensor,lED_Balcony_Sensor ,lED_garden_left_Sensor,doorStatue,securityStatue ;
  ///////////
  sendChange()            ;
}
class LightControllerImp extends LightController{
  @override
  void onInit()async {
    var response = await lightData.getSensorValue() ;
    statusRequest = handlingData(response) ;
    if(statusRequest==StatusRequest.success){
      serviceModel            = ServiceModel.fromJson(response)                     ;
      ownerName               = serviceModel?.service?.ownerName                    ;
      gassSensor              = serviceModel?.service?.gassSensor.toString()        ;
      flameSensor             = serviceModel?.service?.flameSensor.toString()       ;
      lED_living_Sensor       = serviceModel?.service?.lEDLivingSensor              ;
      lED_kitchen_Sensor      = serviceModel?.service?.lEDKitchenSensor             ;
      lED_Balcony_Sensor      = serviceModel?.service?.lEDBalconySensor             ;
      lED_garden_left_Sensor  = serviceModel?.service?.lEDGardenLeftSensor          ;
      lED_garden_right_Sensor = serviceModel?.service?.lEDGardenRightLivingSensor   ;
      doorStatue              = serviceModel?.service?.doorStatue                   ;
      securityStatue          = serviceModel?.service?.securityStatue               ;
      led_pool_sensor         = serviceModel?.service?.lEDPoolLivingSensor ;
    }
    update() ;
    super.onInit();
  }

  @override
  sendChange()async {
    statusRequest = StatusRequest.loading ;
    update()                              ;
    var response = await lightData.changeState(
        ownerName: ownerName??'', gassSensor: gassSensor,
        flameSensor: flameSensor, lED_living_Sensor: lED_living_Sensor,
        lED_kitchen_Sensor: lED_kitchen_Sensor, lED_Balcony_Sensor: lED_Balcony_Sensor,
        lED_garden_left_Sensor: lED_garden_left_Sensor, doorStatue: doorStatue,
        securityStatue: securityStatue,led_right: lED_garden_right_Sensor??'',pool: led_pool_sensor);
    statusRequest = handlingData(response) ;
    if(statusRequest==StatusRequest.success){
      onInit() ;
    }
    update() ;
  }

}