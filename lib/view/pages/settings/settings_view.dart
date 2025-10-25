import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("Settings", style: TextStyle(fontSize: 30)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [
              container(
                lebel: "Terms of Service",
                icon2: Icon(Icons.info, size: 20,color: Colors.deepPurpleAccent),
                onPressed: () {
                  Get.toNamed('/terms_of_service');
                },
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 20,),

              ),
              SizedBox(height: 30),
              container(
                lebel: "Privacy Policy",
                icon2: Icon(Icons.privacy_tip, size: 20,color: Colors.deepPurple),
                onPressed: () {
                  Get.toNamed('/privacy_policy');
                },
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
              ),
              SizedBox(height: 30),
              container(
                lebel: "About Us",
                icon2: Icon(Icons.question_mark_rounded, size: 20,color: Colors.deepPurpleAccent),
                onPressed: () {
                  Get.toNamed('/about_us');
                },
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 20,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class container extends StatelessWidget {
  final String lebel;
  final VoidCallback onPressed;
  final Icon icon;
  final Icon icon2;
  const container({
    super.key,
    required this.lebel,
    required this.onPressed,
    required this.icon, required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon2,
              SizedBox(width: 10),
              Text(lebel, style: TextStyle(fontSize: 18)),
              Spacer(),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
