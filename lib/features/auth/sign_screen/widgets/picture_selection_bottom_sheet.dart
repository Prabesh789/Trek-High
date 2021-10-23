import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trek_high/core/widgets/custom_close_button.dart';

class PictureSelectionBottomSheet {
  static void pictureSelectionBottomSheet({
    required BuildContext context,
    required VoidCallback onCamera,
    required VoidCallback onGallery,
  }) {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PictureSelectionSheet(
          onCamera: onCamera,
          onGallery: onGallery,
        );
      },
    );
  }
}

class PictureSelectionSheet extends StatefulHookWidget {
  const PictureSelectionSheet({
    Key? key,
    required this.onCamera,
    required this.onGallery,
  }) : super(key: key);

  final VoidCallback onCamera;
  final VoidCallback onGallery;

  @override
  State<PictureSelectionSheet> createState() => _PictureSelectionSheetState();
}

class _PictureSelectionSheetState extends State<PictureSelectionSheet> {
  late File imageFile;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: size.height / 2.1,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(20, 0),
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(0.4),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 25),
                Row(
                  children: [
                    const SizedBox(width: 23),
                    CustomCloseButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    Text(
                      'Choose image',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 90),
                  ],
                ),
                SizedBox(height: size.width / 8),
                InkWell(
                  onTap: widget.onCamera,
                  child: Text(
                    'Open Camera',
                    style: Theme.of(context).textTheme.headline6?.copyWith(),
                  ),
                ),
                const SizedBox(height: 30),
                Divider(
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: widget.onGallery,
                  child: Text(
                    'Select from Gallery',
                    style: Theme.of(context).textTheme.headline6?.copyWith(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
