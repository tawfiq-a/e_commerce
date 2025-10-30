import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderConfirm extends StatelessWidget {
  const OrderConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 45),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white70,
                child: IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back)),
              ),
              Column(
                children: [
                  SizedBox(height: 60),
          
                  Stack(
                    children: [
                      Image(
                        image: AssetImage('assets/images/order_confirmMask.png'),
                      ),
                      Positioned(
                        top: 51,
                        left: 45,
                        child: Image(
                          image: AssetImage('assets/images/confirmSuccess.png'),
                        ),
                      ),
                      Positioned(
                        top: 323,
                        left: 100,
                        child: Text(
                          'Order Confirmed',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
          
                      Positioned(
                        top: 470,
                        left:35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 60),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed('/order_view');
                          },
                          child: Text(
                            "Go to Orders",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
          
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 60),
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/main_view');
                      },
                      child: Text(
                        "Continue Shopping",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
          
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
