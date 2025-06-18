import '../../core/class/crud.dart';
import '../../serverLink.dart';

class HumidityData{
  Crud crud ;
  HumidityData(this.crud) ;
  getSensorValue()async{
    var response = await crud.getData(ServerLink.getSingleService);
    return response.fold((l) => l, (r) => r) ;
  }
}