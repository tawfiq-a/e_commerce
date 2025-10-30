
import 'package:e_commerce/view/screens/settings/termsOfServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Privacy Policy "),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back,color: Colors.black,))
        ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headline(lebel: '1. Information We Collect',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '2. How We Use Your Data',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '3. Data Sharing',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '4. Data Security',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '5. Your Rights',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,)
              ],

            ),
          ),


        ));
  }
}