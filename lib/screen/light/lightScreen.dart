import 'package:flutter/material.dart' ;
import 'package:get/get.dart';
import 'package:raneamproject/core/class/handlingdataview.dart';
import 'package:raneamproject/core/fun/get_sensorVal.dart';
import 'package:raneamproject/core/widget/controller_button.dart';
import 'lightController.dart';
class MyControlerScreen extends GetView<LightControllerImp> {
  const MyControlerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LightControllerImp());
    return  GetBuilder<LightControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children:  [
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ControlButton(size: Size(Get.width/2-36, 70), icon: Icons.light_mode, title: 'Living room ',
                    isSelect: controller.lED_living_Sensor=='on',
                    onTap: (){
                      controller.lED_living_Sensor = reversSensorValue(controller.lED_living_Sensor);
                      controller.sendChange() ;
                    },
                  ),
                  ControlButton(size: Size(Get.width/2-36, 70), icon: Icons.light_mode, title: 'Kitchen',
                    isSelect: controller.lED_kitchen_Sensor=='on',
                    onTap: (){
                      controller.lED_kitchen_Sensor = reversSensorValue(controller.lED_kitchen_Sensor);
                      controller.sendChange() ;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ControlButton(size: Size(Get.width/2-36, 70), icon: Icons.light_mode, title: 'Garden Left',
                    isSelect: controller.lED_garden_left_Sensor=='on',
                    onTap: (){
                      controller.lED_garden_left_Sensor = reversSensorValue(controller.lED_garden_left_Sensor);
                      controller.sendChange() ;
                    },
                  ),
                  ControlButton(size: Size(Get.width/2-36, 70), icon: Icons.light_mode, title: 'Garden Right',
                    isSelect: controller.lED_garden_right_Sensor=='on',
                    onTap: (){
                      controller.lED_garden_right_Sensor = reversSensorValue(controller.lED_garden_right_Sensor);
                      controller.sendChange() ;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ControlButton(size: Size(Get.width/2-36, 70), icon: Icons.light_mode,
                    title: 'Balcony',onTap: (){
                      controller.lED_Balcony_Sensor = reversSensorValue(controller.lED_Balcony_Sensor);
                      controller.sendChange() ;
                    },
                    isSelect: controller.lED_Balcony_Sensor=='on',),
                  ControlButton(size: Size(Get.width/2-36, 70), icon: Icons.light_mode, title: 'Pool',
                    isSelect: controller.led_pool_sensor=='on',
                    onTap: (){
                      controller.led_pool_sensor = reversSensorValue(controller.led_pool_sensor);
                      controller.sendChange() ;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [
                  ControlButton(size: Size(Get.width/2-36, 70),
                    isSelect: controller.doorStatue=='on',
                    onTap: (){
                      controller.doorStatue = reversSensorValue(controller.doorStatue);
                      controller.sendChange() ;
                    },
                    icon: Icons.sensor_door_rounded, title: 'Door',),
                  ControlButton(size: Size(Get.width/2-36, 70),
                    isSelect: controller.securityStatue=='on',
                    onTap: (){
                      controller.securityStatue = reversSensorValue(controller.securityStatue);
                      controller.sendChange() ;
                    },
                    icon: Icons.alarm, title: 'Alarm',),
                ],
              ),

            ],
          ) ,
        );
      }
    );
  }
}


