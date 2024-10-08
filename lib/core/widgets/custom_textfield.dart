import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    this.prefixIcon,
    this.sufixIcon,
    this.hintText,
    this.labelText,
    this.onEditingComplete,
    this.validator,
    this.obscureText = false,
    this.maxLine,
    this.enabled = true,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String? hintText;
  final String? labelText;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLine;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: maxLine ?? 1,
      obscureText: obscureText,
      validator: validator,
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.black,
      controller: textEditingController,
      focusNode: focusNode,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.all(10),
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.ptSerif(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
            color: Colors.grey,
          ),
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.ptSerif(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).focusColor,
          ),
        ),
      ),
    );
  }
}
