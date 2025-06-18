import 'dart:convert';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../fun/check_intenet.dart';
import '../service/service.dart';
import 'statusrequest.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class Crud {
  //String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI2NTllODcxMzk2NGFmNzM0MTg0ZDJiMjQiLCJ1c2VybmFtZSI6ImtlbmFuSG9tZSIsImlhdCI6MTcwNzA1ODk2NCwiZXhwIjoxNzA5NjUwOTY0fQ.36TOvVNhR_qvM2QvagBrhhhyrUiwyzCb33BqXBSHxkg';
  MyServices myServices = Get.find()            ;
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map<String ,String> data) async {
    String token = myServices.sharedPreferences.getString('token')??'';
    print(token);
    Map<String, String>? myHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    if (await checkInternet()) {
      var mydata =json.encode(data);
      var response =
          await http.post(Uri.parse(linkurl), body: mydata, headers: myHeaders);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body)      ;
      }
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map responseBody = jsonDecode(response.body);

        return Right(responseBody);
      }else if(response.statusCode >= 400 && response.statusCode < 500){
        print('===============================');
        print(response.body) ;
        Fluttertoast.showToast(msg: response.body);
        await Future.delayed(Duration(seconds: 4));
        return const Left(StatusRequest.serverfailure);
      }
      else {

        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    String token = myServices.sharedPreferences.getString('token')??'';
    print(token);
    Map<String, String>? myHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: myHeaders,);
      if (kDebugMode) {
        print(response.statusCode);
      }
      print('body') ;
      print(response.body);
      if ((response.statusCode >= 200 && response.statusCode < 300)) {
        Map responseBody = jsonDecode(response.body);
        if (kDebugMode) {
          print(responseBody);
        }
        return Right(responseBody);
      }
      else if(response.statusCode >= 400 && response.statusCode < 500){
        Fluttertoast.showToast(msg: response.body);
        return const Left(StatusRequest.serverfailure);
      }
      else {
        return const Left(StatusRequest.serverfailure);
      }

    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
  Future<Either<StatusRequest, Map>> patchData(String linkurl, Map<String ,String> data) async {
    String token = myServices.sharedPreferences.getString('token')??'';
    print(token);
    Map<String, String>? myHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    if (await checkInternet()) {
      var mydata =json.encode(data);
      var response =
      await http.patch(Uri.parse(linkurl), body: mydata, headers: myHeaders);
      if (kDebugMode) {
        print(response.statusCode);
        print(response.body)      ;
      }
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map responseBody = jsonDecode(response.body);

        return Right(responseBody);
      }else if(response.statusCode >= 400 && response.statusCode < 500){
        print('===============================');
        print(response.body) ;
        Fluttertoast.showToast(msg: response.body);
        await Future.delayed(Duration(seconds: 4));
        return const Left(StatusRequest.serverfailure);
      }
      else {

        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}

