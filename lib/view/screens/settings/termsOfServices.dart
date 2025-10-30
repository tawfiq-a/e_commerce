import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Termsofservices extends StatelessWidget {
  const Termsofservices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Terms of Service"),
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
              Headline(lebel: '2. User Responsibilities',),
              SizedBox(height: 10),
              body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
              SizedBox(height: 10,),
              Headline(lebel: '3. Privacy and Data Collection',),
              SizedBox(height: 10),
              body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
              SizedBox(height: 10,),
              Headline(lebel: '4. User Content',),
              SizedBox(height: 10),
              body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
              SizedBox(height: 10,),
              Headline(lebel: '5. Support and Payment',),
              SizedBox(height: 10),
              body(lebel: "Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.",),
              SizedBox(height: 10,)
            ],

        ),
      ),


      ));
  }
}

class body extends StatelessWidget {
  final String lebel;
  const body({
    super.key, required this.lebel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(lebel,softWrap: true,style: TextStyle(fontSize: 18,));
  }
}

class Headline extends StatelessWidget {
  final String lebel;
  const Headline({
    super.key, required this.lebel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(lebel,softWrap: true,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold));
  }
}
