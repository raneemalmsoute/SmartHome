

// SensorState getSensorFromString(String? val){
//   return val=='off'?SensorState.off:SensorState.on ;
// }
// String getStringFromSensor(SensorState? sensorState){
//   return sensorState==SensorState.off?'off':'on' ;
// }
// bool convertStringToBool(String? val){
//   return val == 'off' ? false:true ;
// }
String getStringFromBool(bool? sensorState){
  return sensorState==false?'off':'on' ;
}
String reversSensorValue(String? currentVal){
  if(currentVal=='off'){
    return 'on' ;
  }
  return 'off' ;
}
