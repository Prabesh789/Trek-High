import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.buttonHeigh,
    this.buttonWidget,
    this.isLoading = false,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);
  final double? buttonHeigh;
  final double? buttonWidget;
  final VoidCallback onPressed;
  final String buttonText;
  final bool isLoading;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.isLoading ? null : widget.onPressed,
      child: Container(
        height: widget.buttonHeigh ?? 55,
        width: widget.buttonWidget ?? size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isLoading
              ? Colors.blueGrey[100]
              : Colors.indigoAccent[100],
        ),
        child: widget.isLoading
            ? Row(
                children: [
                  const SizedBox(),
                  const Spacer(),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).scaffoldBackgroundColor,
                      ),
                      strokeWidth: 2,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(),
                ],
              )
            : Center(
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
