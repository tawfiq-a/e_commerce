import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/address_controller.dart';
import '../../base/custom_button.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressFormController controller = Get.put(AddressFormController());
    const Color purpleColor = Color(0xFF9C27B0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Country and City Row ---
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Country', controller.country.value)),
                        const SizedBox(width: 15),
                        Expanded(child: _buildTextField('City', controller.city.value)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // --- Phone Number ---
                    _buildTextField('Phone Number', controller.phoneNumber.value),
                    const SizedBox(height: 20),

                    // --- Address Details ---
                    _buildTextField('Address', controller.addressDetails.value),
                    const SizedBox(height: 25),

                    // --- Save as Primary Switch ---
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Save as primary address',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Switch(
                          value: controller.isPrimary.value,
                          onChanged: (val) {
                            controller.isPrimary.value = val;
                          }, activeColor: Colors.white,
                          activeTrackColor: Colors.lightGreenAccent,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey,


                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),

            // --- Save Address Button ---
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomButton(
                lebel: "Save Address",
                onPressed: controller.saveAddress,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField Builder
  Widget _buildTextField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ),
      ],
    );
  }
}