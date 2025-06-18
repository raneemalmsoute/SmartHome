import 'package:flutter/material.dart'       ;
class CustomButton extends StatelessWidget {
  final void Function() onPress          ;
  final Color color                      ;
  final double width                     ;
  final double height                    ;
  final String title                     ;
  const CustomButton({Key? key,
    required this.onPress ,
    required this.color   ,
    required this.width   ,
    required this.height  ,
    required this.title  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress  ,
        child: Container(
      decoration: BoxDecoration(
          color: color ,
          borderRadius: BorderRadius.circular(18)
      ),
      height: height      ,
      width : width       ,
      child: Center(child: Text(title,
        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
    ));
  }
}

class CustomButtonLessRadius extends StatelessWidget {
  final void Function() onPress          ;
  final Color color                      ;
  final double width                     ;
  final double height                    ;
  final String title                     ;
  const CustomButtonLessRadius({Key? key,
    required this.onPress ,
    required this.color   ,
    required this.width   ,
    required this.height  ,
    required this.title  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress  ,
        child: Container(
          decoration: BoxDecoration(
              color: color ,
              borderRadius: BorderRadius.circular(7)
          ),
          height: height      ,
          width : width       ,
          child: Center(child: Text(title,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ));
  }
}
