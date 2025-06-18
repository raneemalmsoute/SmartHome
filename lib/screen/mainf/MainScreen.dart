import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raneamproject/core/class/handlingdataview.dart';
import 'package:raneamproject/core/constant/constants.dart';
import 'package:raneamproject/screen/mainf/mainScreenController.dart';
import 'package:lottie/lottie.dart' ;
final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
class MainScreen extends GetView<MainControllerImp> {
   static String id = '/MainScreen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainControllerImp()) ;
    return  GetBuilder<MainControllerImp>(
      builder: (controller) {
        return Container(
          alignment: Alignment.center ,
          child: SafeArea(
            child: Scaffold(
              // key: drawerKey,
              drawer:   Drawer(
                backgroundColor: Colors.white ,
                child: Container(
                  width: double.maxFinite,height: double.maxFinite ,color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Center(child: Lottie.asset('assets/images/smartHome.json',height: Get.height/3.5))       ,
                      const SizedBox(height: 20,),
                      ListTile(title: const Text('Logout'),trailing: const Icon(Icons.logout),onTap: controller.logout,),
                    ],
                  ),
                ),
              ),
              appBar: AppBar(title: const Text('Smart Home'),centerTitle: true,),
              body: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: controller.pages[controller.selectPage]),
                    Container(
                      height: 80,
                      decoration:  BoxDecoration(
                        color: Colors.white ,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff70707026).withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: Offset(0,-4), // changes position of shadow
                          ),
                        ],
                          //color:Color(0xffA8A8A8)
                          //color: Color(0xffC4BAA6),
                         //border: Border(top: BorderSide(color:Color(0xffA8A8A8)))
                      ),
                      child: Row(
                        children: [
                          ...List.generate(controller.pages.length,
                                  (index) => Expanded(
                                child: InkWell(
                                  onTap: (){controller.choosePage(index);},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const SizedBox(height: 6,),

                                      Icon(controller.icons[index],
                                        color: controller.selectPage==index
                                            ?kOrangeColor
                                        :kDarkGreyColor,
                                      ),
                                      AnimatedDefaultTextStyle(
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: controller.selectPage!=index?const Color(0xFFC4BAA6)
                                              : kOrangeColor,),
                                        duration: const Duration(seconds: 1),
                                        child: Text(controller.titles[index],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
              ,
            ),
          ),
        );
      }
    ) ;
  }
}