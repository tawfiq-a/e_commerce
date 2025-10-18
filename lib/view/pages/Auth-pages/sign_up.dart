
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../base/custom_button.dart';
import '../../base/custom_textfromfeild.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final  TextEditingController _emailCtrl=TextEditingController();
  final TextEditingController _userNameCtrl=TextEditingController();
  final TextEditingController _passCtrl=TextEditingController();
  final AuthController _authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:  IconButton(
          onPressed: (){
            Get.offAllNamed("/login_screen");
            },
          iconSize: 30 ,
          icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 60),
              Center(
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 140),
              CustomTextFromField(
                controller: _userNameCtrl,
                hintText: "Enter your User Name",
                labelText: "User Name",

              ),
              SizedBox(height: 10,),
              CustomTextFromField(
                controller: _emailCtrl,
                hintText: "Enter your Email",
                labelText: "Email",
              ),
              SizedBox(height: 30),
              CustomTextFromField(
                controller: _passCtrl,
                obscureText: true,
                hintText: "Enter your password",
                labelText: " Password",
              ),
              SizedBox(height: 40),
              Row(
                  children: [
                    Text("Remember me",style: TextStyle(fontSize: 15),),

                    Spacer(),
                    Obx(()=> Switch(
                      value: _authController.isRememberMe.value,
                      onChanged: _authController.onRememberMeChanged,
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.white,),
                    ),

                  ]
              ),
              SizedBox(height: 80,),

              SizedBox(height: 40,),
              CustomButton(lebel: "Sign Up",onPressed: (){Get.offAllNamed("/login_screen");},)



            ],
          ),
        ),
      ),
    );
  }
}

