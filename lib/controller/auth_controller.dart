

import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isRememberMe = false.obs;

  onRememberMeChanged(value) {
    isRememberMe = value;
    update();
  }

  /// <================  Otp Verification Screen ======>

  RxInt secondsRemaining = 30.obs; // initial timer seconds
  RxBool enableResend = false.obs;
  Timer? timer;

  dispostTimer(){
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
}




// import 'dart:async';
//
// import 'package:get/get.dart';
//
//
// class AuthController extends GetxController{
//
//   RxBool isRememberMe=false.obs;
//
//   onRememberMeChanged(bool value){
//     isRememberMe.value=value;
//   }
// }
//
//
//
//
//
//
//
//
// /// <================  Otp Verification Screen ======>
//
// RxInt secondsRemaining = 30.obs; // initial timer seconds
// RxBool enableResend = false.obs;
// Timer? timer;
//
// dispostTimer() async {
//   timer?.cancel();
//   secondsRemaining.value = 30;
//   enableResend.value = false;
// }
//
//
// Future<void> startTimer() async {
//   timer?.cancel(); // stop previous timer if any
//   secondsRemaining.value = 30;
//   enableResend.value = false;
//   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//     if (secondsRemaining > 0) {
//       secondsRemaining.value--;
//     } else {
//       enableResend.value = true;
//       timer.cancel();
//     }
//   });
// }
//
