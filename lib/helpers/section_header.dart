
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onTap;


  const SectionHeader({
    required this.title,
    required this.subTitle,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTap(),
          child: Text(
            subTitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}