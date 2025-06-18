import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:raneamproject/core/notification/notification_method.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {

  late SharedPreferences sharedPreferences;
  Future<void> backgroundNotification(RemoteMessage? message) async{
    if(message!=null){
      NotificationMethod.showNotification( title: message.notification!.title,
          body: message.notification!.body);
    }
  }
  Future<MyServices> init() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(backgroundNotification)        ;
    sharedPreferences = await SharedPreferences.getInstance()            ;
    FirebaseMessaging.onMessage.listen((event) {
      backgroundNotification(event);
    });
    return this;
  }
}
initialServices() async {
  await Get.putAsync(() => MyServices().init());
}