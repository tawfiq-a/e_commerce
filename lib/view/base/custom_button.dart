import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.lebel, this.onPressed, this.isLoading = false});
  final String? lebel;
  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: CustomColors.primaryColor,
            minimumSize: const Size(355, 60),
            maximumSize: Size.infinite,
          ),
          onPressed: onPressed,
          child: Text(lebel!, style: TextStyle(color: Colors.white, fontSize: 20)),
        );
  }
}
