import 'package:e_commerce/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';



import '../../../helpers/time_formatter.dart';
import '../../base/custom_button.dart';

class VarifyCode extends StatefulWidget {
  const VarifyCode({super.key});

  @override
  State<VarifyCode> createState() => _VarifyCodeState();
}

class _VarifyCodeState extends State<VarifyCode> {
   AuthController _authController = Get.put(AuthController());

  // final AuthController  _authController = Get.find<AuthController>();
  final TextEditingController _pinPutController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _authController.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _authController.dispostTimer();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:  IconButton(
          onPressed: (){
            Get.offAllNamed("/forget_pass");
          },
          iconSize: 30 ,
          icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Obx(()=>Column(
                children: [
                  Center(
                    child: Text(
                      " Verification Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 65),
                  Center(child: SvgPicture.asset("assets/images/forget.svg")),
                  SizedBox(height: 80),
        
                  Pinput(
        
                    controller: _pinPutController,
        
                    validator: (v) {
                      if (v!.length < 4) {
                        return "Enter a valid code";
                      }
                      return null;
                    },
        
        
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 77,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white
                      )
                    ),
        
                  ),
        
                  SizedBox(height: 30),
        
                  _authController.enableResend.value
                      ? TextButton(
                    onPressed: () {
                      _authController.startTimer();
                    },
                    child: Text("Resend Code",style: TextStyle(color: Colors.indigoAccent,fontSize: 15 )),
                  )
                  :
        
                  RichText(text: TextSpan(
                    text: formatTime(
                      _authController.secondsRemaining.value,
                    ),
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    children: [
                      TextSpan(text: " resend confirmation code.",style: TextStyle(color: Colors.grey)),
        
                    ]
        
                  )),
        
                  SizedBox(height: 160),
        
                  Center(child: Text("",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.grey),)),
                  SizedBox(height: 25,),
        
                  CustomButton(lebel: "Confirm Code",onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Get.toNamed("/new_pass");
                    }

                  },)
        
        
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
