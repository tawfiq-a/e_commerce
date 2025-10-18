import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String lebel;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.lebel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            minimumSize: Size(double.infinity, 70)),
        child:Text(lebel,style: TextStyle(fontSize: 25,color: Colors.white),)

    );
  }
}