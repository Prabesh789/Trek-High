// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:fonepay_app_v2/core/theme/application/theme_controller.dart';
// import 'package:fonepay_app_v2/core/theme/infrastructure/entities/theme_palatte.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:trek_high/core/theme/application/theme_controller.dart';
// import 'package:trek_high/core/theme/infrastructure/entities/theme_palatte.dart';

// extension ContextExtension on BuildContext {
//   /* get theme palate */
//   AppThemes get theme => read(themeController);
//   /* show popup status bar */
//   Future showStatusBar({
//     required String message,
//     Duration? duration = const Duration(seconds: 1),
//     Function? onPressed,
//     Widget? iconWidget,
//   }) {
//     return Flushbar<void>(
//       icon: iconWidget,
//       animationDuration: duration ?? const Duration(seconds: 2),
//       onTap: (data) => onPressed,
//       // titleText: Text(
//       //   message,
//       //   maxLines: 2,
//       // ),
//       messageColor: ,
//       message: message,
//       margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       borderRadius: BorderRadius.circular(4),
//       shouldIconPulse: false,
//       dismissDirection: FlushbarDismissDirection.HORIZONTAL,
//       duration: duration ?? const Duration(seconds: 1),
//       backgroundColor: theme.background,
//       boxShadows: [
//         BoxShadow(
//           offset: const Offset(0, 10),
//           blurRadius: 50,
//           color: theme.titleText.withOpacity(0.25),
//         )
//       ],
//     ).show(this);
//   }
// }
