import 'package:raneamproject/core/class/crud.dart';
import 'package:raneamproject/serverLink.dart';

class LightData{
  Crud crud =Crud()           ;
  LightData() ;
  getSensorValue()async{
    var response = await crud.getData(ServerLink.getSingleService);
    return response.fold((l) => l, (r) => r) ;
  }
  changeState(
     {
    required String ownerName ,required gassSensor ,required flameSensor ,required lED_living_Sensor,
       required lED_kitchen_Sensor,required lED_Balcony_Sensor ,required lED_garden_left_Sensor,
       required doorStatue,required securityStatue ,required pool ,required led_right
}
      )async{
    var response = await crud.patchData(ServerLink.getSingleService,
        {
          "ownerName":ownerName,
          "gassSensor":gassSensor,
          "flameSensor":flameSensor,
          "LED_living_Sensor":lED_living_Sensor,
          "LED_kitchen_Sensor":lED_kitchen_Sensor,
          "LED_Balcony_Sensor":lED_Balcony_Sensor,
          "LED_garden_left_Sensor":lED_garden_left_Sensor,
          "DoorStatue":doorStatue,
          "securityStatue":securityStatue,
          "LED_pool_livingSensor":pool ,
          "LED_garden_right_livingSensor":led_right ,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}