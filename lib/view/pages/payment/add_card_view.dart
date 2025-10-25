

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/addCardController.dart';
import '../../base/custom_button.dart';


class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {

    final AddCardController controller = Get.put(AddCardController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Add New Card',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PaymentMethodSelector(controller: controller),

                  const SizedBox(height: 30),

                  // --- Card Owner Input ---
                  const Text(
                    'Card Owner',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _CustomTextField(
                    hintText: 'Mrh Raju',
                    keyboardType: TextInputType.name,
                    onChanged: controller.cardOwner, // Link to RxString
                  ),

                  const SizedBox(height: 20),

                  // --- Card Number Input ---
                  const Text(
                    'Card Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _CustomTextField(
                    hintText: '5254 7634 8734 7690',
                    keyboardType: TextInputType.number,
                    onChanged: controller.cardNumber,
                  ),

                  const SizedBox(height: 20),

                  // --- EXP and CVV Inputs (Side-by-side) ---
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'EXP',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            _CustomTextField(
                              hintText: '24/24',
                              keyboardType: TextInputType.datetime,
                              onChanged: controller.expDate,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CVV',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            _CustomTextField(
                              hintText: '7763',
                              keyboardType: TextInputType.number,
                              onChanged: controller.cvv,
                              isObscured: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // --- Add Card Button (Fixed at the bottom) ---
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: CustomButton(
                lebel: 'Add Card',
                onPressed: controller.addCard,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------
// --- Helper Widgets ---
// ----------------------------------------------------------------------


class _PaymentMethodSelector extends StatelessWidget {
  final AddCardController controller;

  const _PaymentMethodSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _MethodChip(
          icon: Icons.credit_card,
          label: 'Card',
          value: 'card',
          controller: controller,
          color: const Color(0xFFE89386),
        ),
        const SizedBox(width: 10),
        _MethodChip(
          icon: Icons.paypal,
          label: 'PayPal',
          value: 'paypal',
          controller: controller,
        ),
        const SizedBox(width: 10),
        _MethodChip(
          icon: Icons.account_balance,
          label: 'Bank',
          value: 'bank',
          controller: controller,
        ),
      ],
    );
  }
}


class _MethodChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final AddCardController controller;
  final Color color;

  const _MethodChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.controller,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      final isSelected = controller.selectedMethod.value == value;
      return GestureDetector(
        onTap: () => controller.selectMethod(value),
        child: Container(
          width: 90, // Fixed width for alignment
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : const Color(0xFFF5F5F8),
            borderRadius: BorderRadius.circular(10),
            border: isSelected
                ? Border.all(color: color, width: 2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? color : Colors.grey.shade600,
                size: 24,
              ),
              if (!isSelected)
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}


class _CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscured;
  final Function(String) onChanged;

  const _CustomTextField({
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: isObscured,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
        onChanged: onChanged,
      ),
    );
  }
}