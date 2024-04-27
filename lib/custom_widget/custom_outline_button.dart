
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String tittle;
  final void Function ()? onPressed;
  const CustomOutlineButton({
    super.key,
    required this.tittle,
    this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text( 
              tittle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            ),
          ),
        ),
      ),
    );
  }
}