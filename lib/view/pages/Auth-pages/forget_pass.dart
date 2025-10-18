import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';

import '../../base/custom_button.dart';
import '../../base/custom_textfromfeild.dart';


class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final  TextEditingController _emailCtrl=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:  IconButton(
          onPressed: (){
            Get.offAllNamed("/sign_up");
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
                  " Forget Password ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 65),
              Center(child: SvgPicture.asset("assets/images/forget.svg")),
              SizedBox(height: 80),
              CustomTextFromField(
                controller: _emailCtrl,
                hintText: "Enter your email",
                labelText: "Email",
              ),

              SizedBox(height: 160),

              Center(child: Text("Please write your email to receive a \n confirmation code to set a new password.",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.grey),)),
              SizedBox(height: 25,),

              CustomButton(lebel: "Confirm Email",onPressed: (){
                Get.toNamed("/varify_code");

              },)



            ],
          ),
        ),
      ),
    );
  }
}