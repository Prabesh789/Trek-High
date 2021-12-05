import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.buttonColor,
    this.buttonIconColor,
    required this.onTap,
  }) : super(key: key);
  final Color? buttonColor;
  final Color? buttonIconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          splashColor: Colors.indigoAccent[100],
          onTap: onTap,
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: Colors.indigoAccent[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
