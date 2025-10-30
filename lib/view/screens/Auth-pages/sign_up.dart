import 'package:flutter/gestures.dart';
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
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _userNameCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 140),
                CustomTextFromField(
                  controller: _nameCtrl,
                  hintText: "Enter your FirstName",
                  labelText: "First Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter first name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextFromField(
                  controller: _emailCtrl,
                  hintText: "Enter your Email",
                  labelText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomTextFromField(
                  controller: _userNameCtrl,
                  hintText: "Enter your User Name",
                  labelText: "User Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter User Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                CustomTextFromField(
                  controller: _passCtrl,
                  obscureText: true,
                  hintText: "Enter your password",
                  labelText: " Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text("Remember me", style: TextStyle(fontSize: 15)),

                    Spacer(),
                    Obx(
                      () => Switch(
                        value: _authController.isRememberMe.value,
                        onChanged: _authController.onRememberMeChanged,
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 80),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    children: [
                      TextSpan(text: " Already have an account? "),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(color: Colors.indigoAccent),
                        recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Get.offAllNamed("/login_screen");
                          },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),
                Obx(
                  ()=> CustomButton(
                    isLoading: _authController.isLoading.value,
                    lebel: "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authController.signUp(
                          _nameCtrl.text.trim(),
                          _emailCtrl.text.trim(),
                          _userNameCtrl.text.trim(),
                          _passCtrl.text.trim(),
                        );
                      }
                      else {
                        ("Not Valid");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
