import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/custom_button.dart';
import '../../base/custom_textfromfeild.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();



}

class _NewPassState extends State<NewPass> {

  final TextEditingController _passCtrl=TextEditingController();
  final TextEditingController _confirmPassCtrl=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
            child: Column(
              children: [
                SizedBox(height: 60),
                Center(
                  child: Text(
                    " New Password ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 65),

                SizedBox(height: 80),
                CustomTextFromField(
                  controller: _passCtrl ,
                  obscureText: true,
                  hintText: "Enter new password",
                  labelText: "New Password",
                ),
                SizedBox(height: 20,),
                CustomTextFromField(
                  validator: (v){
                    if(_passCtrl.text!=v){
                      return "Password not match";
                    }
                    return null;

                  },

                  controller: _confirmPassCtrl,
                  obscureText: true,
                  hintText: "Confirm new password",
                  labelText: "Confirm Password",
                ),



                SizedBox(height: 180),

                Center(child: Text("Please enter your new password.",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.grey),)),
                SizedBox(height: 25,),

                CustomButton(lebel: "Reset Password",onPressed: (){if (_formKey.currentState!.validate()) {
                  Get.toNamed("/login_screen");
                }},)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
