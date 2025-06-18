import 'package:flutter/material.dart';
import 'package:get/get.dart';

validInput({required String? value ,required String type}){
  if(type == 'email'){
    if(!value.toString().replaceAll(' ', '').toString().isEmail){
      return 'please input valid email'        ;
    }else{
      return null ;
    }
  }
  if(type == 'password'){
    if(value.toString().length<5){
      return 'password must bee longer 5'       ;
    }else{
      return null ;
    }
  }

    if(value!.isEmpty){
      return 'please input a value'       ;
    }else{
      return null ;
    }

}