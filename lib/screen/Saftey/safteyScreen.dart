import 'package:flutter/material.dart';
import 'package:get/get.dart'         ;
import 'package:raneamproject/core/class/handlingdataview.dart';
import 'package:raneamproject/screen/Saftey/safteyController.dart';
class SafetyScreen extends GetView<SafetyControllerImp> {
  const SafetyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SafetyControllerImp());
    return  GetBuilder<SafetyControllerImp>(
      builder: (controller) {
        return Container(
          color: Colors.white,
          alignment:Alignment.center ,
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Image.asset('assets/images/gas.png'),
                ListTile(
                  title:const Text('Gas/Smoke') ,
                  subtitle: Text(DateTime.now().toString().substring(0,16)),
                  trailing:    Text(controller.serviceModel?.service?.gassSensor==1?'idle':'active'
                    ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                const SizedBox(height: 32,),
                ListTile(
                  title:const Text('Flame Sensor') ,
                  subtitle: Text(DateTime.now().toString().substring(0,16)),
                  trailing: Text((controller.serviceModel?.service?.flameSensor??'').toString()
                    ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ],
            ),
          )
        );
      }
    );
  }
}
