import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class NotificationMethod {

  final String _serverToken = 'AAAAHpfLFI8:APA91bHLXkwKsWu-yAmfloLO1SIZsfhk02Jc9CUtz7vKvgFw6-EIwNwHOjKrxtls654TFyZYKyZsuPBYUJlTvDPKj8_XsMxd0P_zBlsvMmdsYFYorPjEAQMb8sZIBRJk_XOT_qUnaEGK';

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // final DarwinInitializationSettings initializationSettings = DarwinInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  static Future showNotification ({int id = 0, String? title, String? body}) async =>
      _flutterLocalNotificationsPlugin.show(id, title, body, const NotificationDetails(
    android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        icon: '@mipmap/ic_launcher',
        importance: Importance.high,
      priority: Priority.max,
      color: Colors.black,
      autoCancel: false ,
    ),

      ) );


  sendAndRetrieveMessageToTopic(String title, String body, String topic) async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await http.post( Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$_serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          "notification" : {
            "body" : body,
            "title" : title,
            "icon": "@mipmap/ic_launcher"
          },
          "content_available": true,
          "priority": "high",
          'to': '/topics/$topic',

        },
      ),
    );

    return ;
  }



}




