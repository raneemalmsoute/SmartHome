class ServiceModel {
  MyService? service;

  ServiceModel({this.service});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    service =
    json['service'] != null ? new MyService.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class MyService {
  String? sId;
  String? ownerName;
  int? gassSensor;
  int? flameSensor;
  int? iRKSensor;
  int? iRDSensor;
  int? pIRSensor;
  String? lEDLivingSensor;
  String? lEDKitchenSensor;
  String? lEDBalconySensor;
  String? lEDGardenLeftSensor;
  String? lEDGardenRightLivingSensor;
  String? lEDPoolLivingSensor;
  String? doorStatue;
  String? securityStatue;
  int? iV;
  double? humidity;
  double? temperature;
  MyService(
      {this.sId,
        this.ownerName,
        this.gassSensor,
        this.flameSensor,
        this.iRKSensor,
        this.iRDSensor,
        this.pIRSensor,
        this.lEDLivingSensor,
        this.lEDKitchenSensor,
        this.lEDBalconySensor,
        this.lEDGardenLeftSensor,
        this.lEDGardenRightLivingSensor,
        this.lEDPoolLivingSensor,
        this.doorStatue,
        this.securityStatue,
        this.iV ,
        this.humidity ,
        this.temperature
      });

  MyService.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ownerName = json['ownerName'];
    gassSensor = json['gassSensor'];
    flameSensor = json['flameSensor'];
    iRKSensor = json['IR_K_Sensor'];
    iRDSensor = json['IR_D_Sensor'];
    pIRSensor = json['PIRSensor'];
    lEDLivingSensor = json['LED_living_Sensor'];
    lEDKitchenSensor = json['LED_kitchen_Sensor'];
    lEDBalconySensor = json['LED_Balcony_Sensor'];
    lEDGardenLeftSensor = json['LED_garden_left_Sensor'];
    lEDGardenRightLivingSensor = json['LED_garden_right_livingSensor'];
    lEDPoolLivingSensor = json['LED_pool_livingSensor'];
    doorStatue = json['DoorStatue'];
    securityStatue = json['securityStatue'];
    iV = json['__v'];
    temperature = json['temperature'];
    humidity    = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ownerName'] = this.ownerName;
    data['gassSensor'] = this.gassSensor;
    data['flameSensor'] = this.flameSensor;
    data['IR_K_Sensor'] = this.iRKSensor;
    data['IR_D_Sensor'] = this.iRDSensor;
    data['PIRSensor'] = this.pIRSensor;
    data['LED_living_Sensor'] = this.lEDLivingSensor;
    data['LED_kitchen_Sensor'] = this.lEDKitchenSensor;
    data['LED_Balcony_Sensor'] = this.lEDBalconySensor;
    data['LED_garden_left_Sensor'] = this.lEDGardenLeftSensor;
    data['LED_garden_right_livingSensor'] = this.lEDGardenRightLivingSensor;
    data['LED_pool_livingSensor'] = this.lEDPoolLivingSensor;
    data['DoorStatue'] = this.doorStatue;
    data['securityStatue'] = this.securityStatue;
    data['__v'] = this.iV;
    data['temperature'] =this.temperature ;
    data['humidity']=this.humidity ;
    return data;
  }
}
