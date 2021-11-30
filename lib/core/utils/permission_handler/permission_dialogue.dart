import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  PermissionDialog({
    required this.context,
    required this.permissionFor,
    this.disabled = false,
  }) {
    openDialog();
  } //
  //
  final String permissionFor;
  final BuildContext context;
  final bool disabled;

  Future openDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final message = permissionFor == 'storage'
        ? 'Trek-High App needs permission to access your device storage. Please go to Settings > Privacy > Storage, and enable.'
        : permissionFor == 'location'
            ? 'Your location is currently disabled, To find the nearest offers and businesses around you, we need your current location. Set it from here or provide location service from setting.'
            : permissionFor == 'Camera'
                ? 'Trek-High App needs permission to access your camera to click a photo. Please go to Settings > Privacy > Camera, and enable.'
                : 'Trek-High App needs permission to access your photo library to select a photo. Please go to Settings > Privacy > Photos, and enable.';

    return SimpleDialog(
      contentPadding: const EdgeInsets.only(bottom: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: Text(
                  'Permission Required',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Not Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 34,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Flexible(
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                          onTap: () async {
                            await openAppSettings();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Open Settings',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
