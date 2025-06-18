import 'package:flutter/material.dart';


import '../constant/constants.dart';


class ControlButton extends StatelessWidget {
  final Size size;
  final IconData icon;
  final String title;
  final bool isSelect    ;
  final void Function()? onTap ;
  const ControlButton({Key? key, required this.size, required this.icon, required this.title,
    required this.isSelect, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: size.height ,
            width : size.width ,
            decoration: BoxDecoration(
              color: isSelect ? kOrangeColor : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isSelect
                      ? kOrangeColor.withOpacity(0.5)
                      : Colors.grey.shade200,
                  blurRadius: 30,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              color:
              isSelect ? Colors.white : kDarkGreyColor.withOpacity(0.6),
              size: 45,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title ,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kDarkGreyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
