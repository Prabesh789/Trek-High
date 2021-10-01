import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    this.prefixIcon,
    this.sufixIcon,
    this.hintText,
    this.labelText,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyText2,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
