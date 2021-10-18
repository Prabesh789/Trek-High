import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.buttonHeigh,
    this.buttonWidget,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);
  final double? buttonHeigh;
  final double? buttonWidget;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: widget.buttonHeigh ?? 52,
        width: widget.buttonWidget ?? size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.indigoAccent[100],
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: GoogleFonts.ptSerif(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
