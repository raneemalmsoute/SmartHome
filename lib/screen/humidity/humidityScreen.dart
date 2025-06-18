import 'package:flutter/material.dart';
import 'package:raneamproject/core/class/handlingdataview.dart';
import 'package:raneamproject/screen/humidity/humidtyController.dart';
import 'package:get/get.dart' ;
class HumidityScreen extends GetView<HumidityControllerImp> {
  const HumidityScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HumidityControllerImp());
    return  GetBuilder<HumidityControllerImp>(
      builder: (controller) {
        return HandlingDataView(statusRequest: controller.statusRequest,
            widget: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset('assets/images/humidity.jpg'),
              ListTile(
                title:const Text('Humidity') ,
                subtitle: Text(DateTime.now().toString().substring(0,16)),
                trailing:   Text('${controller.serviceModel?.service?.humidity??'Unknown'} T',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              const SizedBox(height: 32,),
              ListTile(
                title:const Text('Temperature') ,
                subtitle: Text(DateTime.now().toString().substring(0,16)),
                trailing: Text('${controller.serviceModel?.service?.temperature??'Unknown'} H',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),

            ],
          ),
        ))
        ;
      }
    );
  }
}
