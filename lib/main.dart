import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:get/get.dart';
void main(){
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(
        primaryColor: CustomColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.splashScreen,
      // routes: screens,
      getPages: pages,
    );
  }
}
