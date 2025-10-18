import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jumToNextPage();
    super.initState();
  }

  jumToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed("/login_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Center(child: SvgPicture.asset("assets/images/logo.svg")),
    );
  }
}
