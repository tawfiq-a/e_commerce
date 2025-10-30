import 'package:e_commerce/view/screens/settings/termsOfServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("About Us"),
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
                Headline(lebel: '1. Introduction',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '2. Mission Statement',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '3. Corav Values',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '4. Our Team',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,),
                Headline(lebel: '5. Contact Information',),
                SizedBox(height: 10),
                body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
                SizedBox(height: 10,)
              ],

            ),
          ),


        ));
  }
}