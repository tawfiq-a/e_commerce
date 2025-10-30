import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_button.dart';



class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CreditCard(
                    ownerName: 'Mrh Raju',
                    cardType: 'Visa Classic',
                    cardNumberSuffix: '7690',
                    balance: '\$3,763.87',
                    gradientColors: [Color(0xFFFFB74D), Color(0xFFFF7043)],
                  ),
                  SizedBox(width: 20),
                  _CreditCard(
                    ownerName: 'Mrh Raju',
                    cardType: 'Visa Standard',
                    cardNumberSuffix: '3456',
                    balance: '\$3,763.87',
                    gradientColors: [Color(0xFF9575CD), Color(0xFF673AB7)],
                  ),
                  SizedBox(width: 20),

                ],
              ),
            ),

            const SizedBox(height: 30),


            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF9386E8), width: 1.5),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Get.toNamed('/add_card_view');
                },
                icon: const Icon(Icons.add, color: Color(0xFF9386E8)),
                label: const Text(
                  'Add new card',
                  style: TextStyle(
                    color: Color(0xFF9386E8),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),


            const Text(
              'Card Owner',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const _CustomTextField(
              hintText: 'Mrh Raju',
              keyboardType: TextInputType.name,
            ),

            const SizedBox(height: 20),

            const Text(
              'Card Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const _CustomTextField(
              hintText: '5254 7634 8734 7690',
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),


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
                      const _CustomTextField(
                        hintText: '24/24',
                        keyboardType: TextInputType.datetime,
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
                      const _CustomTextField(
                        hintText: '7763',
                        keyboardType: TextInputType.number,
                        isObscured: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Save card info',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                const _SaveCardToggle(),
              ],
            ),

            const SizedBox(height: 50),


            SizedBox(
              width: double.infinity,
              height: 55,
              child: CustomButton(
                lebel: 'Save Card',
                onPressed: () {})
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// --- Helper Widgets ---
// ----------------------------------------------------------------------

// Custom Credit Card Widget
class _CreditCard extends StatelessWidget {
  final String ownerName;
  final String cardType;
  final String cardNumberSuffix;
  final String balance;
  final List<Color> gradientColors;

  const _CreditCard({
    required this.ownerName,
    required this.cardType,
    required this.cardNumberSuffix,
    required this.balance,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // Gradient background matching the image
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            ownerName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),

          Text(
            cardType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const Spacer(),

          Row(
            children: [
              Text(
                '5254 **** **** ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                cardNumberSuffix,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              const Spacer(),
              const Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Balance
          Text(
            balance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom TextField Widget
class _CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscured;

  const _CustomTextField({
    required this.hintText,
    required this.keyboardType,
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
      ),
    );
  }
}


class _SaveCardToggle extends StatefulWidget {
  const _SaveCardToggle();

  @override
  State<_SaveCardToggle> createState() => __SaveCardToggleState();
}

class __SaveCardToggleState extends State<_SaveCardToggle> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      activeColor: Colors.white,
      activeTrackColor: Colors.lightGreenAccent,

    );
  }
}