import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raneamproject/core/bindings/initalBindings.dart';
import 'package:raneamproject/core/constant/constants.dart';
import 'package:raneamproject/core/service/service.dart';
import 'package:raneamproject/screen/Login/LoginScreen.dart';
import 'package:raneamproject/screen/mainf/MainScreen.dart';
import 'package:get/get.dart';
import 'package:raneamproject/splashScreen/splash_screen.dart';
import 'core/myMiddleware/mmiddleware.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kBgColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages:getPages ,
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
List<GetPage<dynamic>>? getPages = [
  GetPage(name: '/f' , page: ()=>const LoginScreen(),middlewares: [MyMiddleWare()]) ,
  GetPage(name: LoginScreen.id , page: ()=>const LoginScreen()) ,
  GetPage(name: MainScreen.id  , page: ()=>const MainScreen())  ,
];

