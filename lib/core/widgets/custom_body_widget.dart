import 'package:flutter/material.dart';

class CustomBodyWidget extends StatelessWidget {
  const CustomBodyWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
  }
}
