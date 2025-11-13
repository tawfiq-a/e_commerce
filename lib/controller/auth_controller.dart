import 'dart:async';
import 'dart:convert';

import 'package:e_commerce/Data/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/services/api_checker.dart';
import '../Data/services/api_constant.dart';
import '../Data/utils/api_constants.dart';
import '../helpers/prefs_helpers.dart';
import '../routes/routes.dart';

class AuthController extends GetxController {
  RxBool isRememberMe = false.obs;
  var isLoading = false.obs;

  onRememberMeChanged(value) {
    isRememberMe = value;
    update();
  }

  /// <================  Otp Verification Screen ======>

  RxInt secondsRemaining = 30.obs; // initial timer seconds
  RxBool enableResend = false.obs;
  Timer? timer;

  dispostTimer() {
    timer?.cancel();
    secondsRemaining.value = 30;
    enableResend.value = false;
  }

  void startTimer() {
    timer?.cancel(); // stop previous timer if any
    secondsRemaining.value = 30;
    enableResend.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
        timer.cancel();
      }
    });
  }

  //============== Login Screeen=====================

  login(String userName, password) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.login,
      jsonEncode({"username": userName, "password": password}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      Get.offAllNamed(Routes.mainView);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  //============== Sign Up Screeen=====================

  signUp(String firstName, email, userName, password) async {
    isLoading(true);

    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.signup,
      jsonEncode({
        "first_name": firstName,
        "email": email,
        "username": userName,
        "password": password,
      }),
      headers: headers,
    );
    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      Get.toNamed(Routes.mainView);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  //==============Forget Pass Screeen=====================
  forget_pass(String username) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.forgetpassword,
      jsonEncode({"username": username}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.snackbar(
        "Success",
        "Password reset link sent to your email.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
      );
      Get.toNamed(Routes.varifyCode, arguments: username);
      // Get.toNamed(Routes.varify_code);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  //============== OTp Screeen=====================

  verify_code(String otp,userName) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.otp(userName),
      jsonEncode({"otp": otp}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.toNamed(Routes.newPass, arguments: response.body['access']);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);

  }
}
