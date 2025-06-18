import 'package:flutter/material.dart'                   ;
import 'package:raneamproject/core/fun/valid_input.dart';


class CustomTextFormField extends StatelessWidget {
  final String hint                                  ;
  final String type                                  ;
  final void Function()? hidePassword                ;
  final TextEditingController  textEditingController ;
  final bool isPassword                              ;
  final bool isShow                                  ;
  const CustomTextFormField({Key? key,
    required this.hint, required this.textEditingController, required this.isPassword,
    required this.type,   this.isShow=true,  this.hidePassword}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr    ,
      child: TextFormField(
        keyboardType:type=='email'?TextInputType.emailAddress:null    ,
        controller: textEditingController ,
        obscureText: !isShow              ,
        validator  : (value) {
          return validInput(value: value ,type: type, )  ;
        }        ,
        textAlign  : TextAlign.left       ,
        decoration : InputDecoration(
          suffixIcon: isPassword?IconButton(onPressed: hidePassword,
              icon: Icon(isShow?Icons.visibility_off:Icons.visibility)):
          IconButton(onPressed: (){
            textEditingController.text = ''   ;
          },icon:Icon(Icons.close))                                                       ,

          hintText: hint                                                                  ,
          fillColor : Colors.black                                                        ,
          focusColor: Colors.grey                                                         ,
            hintStyle: const TextStyle(
              fontSize: 13.0,
              color: Color(0xFFD3D3D3),
            )                                               ,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFE9E9E9),),
            )                                  ,
            focusedBorder:const OutlineInputBorder(
              borderRadius:  BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.black),
            )                                   ,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),

            )                                               ,

        ),
      ),
    );
  }
}
