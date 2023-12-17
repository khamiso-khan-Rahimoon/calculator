import 'package:calculator/constrantrs.dart';
import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyButtons({
    required this.onPress,
    super.key,
    required this.title,
    this.color = ButtonsColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                title,
                style: headingtext,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
