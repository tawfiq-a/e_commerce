import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../base/custom_button.dart';
import '../../base/custom_textfromfeild.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final  TextEditingController _emailCtrl=TextEditingController();
 final TextEditingController _passCtrl=TextEditingController();
 final AuthController _authController=Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 60),
              Center(
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Please enter your data to continue",
                textAlign: TextAlign.center,
                style: TextStyle(color: CustomColors.greyColor, fontSize: 17),
              ),
              SizedBox(height: 164),
              CustomTextFromField(
                controller: _emailCtrl,
                hintText: "Enter your email",
                labelText: "Email",

              ),
              SizedBox(height: 10,),
              CustomTextFromField(
                controller: _passCtrl,
                obscureText: true,
                hintText: "Enter your password",
                labelText: "Password"
              ),
              SizedBox(height: 30),
              
              Align(
                alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){Get.offAllNamed("/forget_pass");}, child: Text("Forgot password?",style: TextStyle(color: Colors.red,fontSize: 15 ),
                  )
                  )
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text("Remember me",style: TextStyle(fontSize: 15),),
                   Spacer(),
                  Obx(()=>Switch(
                    value: _authController.isRememberMe.value,
                    onChanged: _authController.onRememberMeChanged,
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.white,
                  )


                  )
                  
                ]
              ),
              SizedBox(height: 80,),

              CustomButton(lebel: "Login",onPressed: (){
                Get.offAllNamed("/main_view");
              },),

              SizedBox(height: 40,),

              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  children: [
                    TextSpan(text: " Don't have an account? "),
                    TextSpan(
                      text: ' Sign Up',
                      style: TextStyle(color: Colors.indigoAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {Get.offAllNamed("/sign_up");},
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}