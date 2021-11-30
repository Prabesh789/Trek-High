import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pedantic/pedantic.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trek_high/core/utils/permission_handler/permission_dialogue.dart';

class PermissionChecker {
  static Future<bool> hasLocationPermission(BuildContext context) async {
    var status = await Permission.location.status;
    final isFirstTime = await _isFirstTimeLocationRequest();
    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.location.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'location',
            context: context,
          );
        } else {
          await Permission.location.request();
          status = await Permission.location.status;
        }
      } else if (Platform.isIOS) {
        await Permission.location.request();
        status = await Permission.location.status;
        if (status.isDenied) {
          PermissionDialog(
            permissionFor: 'location',
            context: context,
          );
        }
      } else {
        PermissionDialog(
          permissionFor: 'location',
          context: context,
        );
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted || status.isLimited) {
      PermissionDialog(
        permissionFor: 'location',
        context: context,
      );
    }

    return status.isGranted;
  }

  static Future<bool> hasStoragePermission(BuildContext context) async {
    var status = Platform.isAndroid
        ? await Permission.storage.status
        : await Permission.photos.status;
    final isFirstTime = await _isFirstTimeStoragePermission();
    if (status.isDenied) {
      Platform.isAndroid
          ? await Permission.storage.request()
          : await Permission.photos.request();

      status = Platform.isAndroid
          ? await Permission.storage.status
          : await Permission.photos.status;
    }

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.storage.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'storage',
            context: context,
          );
        } else {
          await Permission.storage.request();
          status = await Permission.storage.status;
        }
      } else if (Platform.isIOS) {
        await Permission.storage.request();
        status = await Permission.storage.status;
        if (status.isDenied) {
          PermissionDialog(
            permissionFor: 'storage',
            context: context,
          );
        }
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'storage',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }

  static Future<bool> hasCameraPermission(BuildContext context) async {
    var status = await Permission.camera.status;
    final isFirstTime = await _isFirstTimeCameraPermission();

    if (status.isLimited) {
      await Permission.camera.request();
      status = await Permission.camera.status;
    }

    if (status.isDenied) {
      if (Platform.isAndroid) {
        final show = await Permission.camera.shouldShowRequestRationale;

        if (!isFirstTime && !show) {
          PermissionDialog(
            permissionFor: 'camera',
            context: context,
          );
        } else {
          await Permission.camera.request();
          status = await Permission.camera.status;
        }
      } else if (Platform.isIOS) {
        await Permission.camera.request();
        status = await Permission.camera.status;
        if (status.isDenied) {
          PermissionDialog(
            permissionFor: 'camera',
            context: context,
          );
        }
      }
    }

    if (status.isPermanentlyDenied || status.isRestricted) {
      PermissionDialog(
        permissionFor: 'camera',
        context: context,
      );
    }

    return status == PermissionStatus.granted;
  }
}

Future<bool> _isFirstTimeStoragePermission() async {
  const firstTImeStorageRequest = 'firstTImeStorageRequest';
  final box = await Hive.openBox(firstTImeStorageRequest);
  if (box.containsKey(firstTImeStorageRequest)) {
    return false;
  } else {
    unawaited(box.put(firstTImeStorageRequest, true));
    return true;
  }
}

Future<bool> _isFirstTimeLocationRequest() async {
  //
  const firstTimeLocationRequest = 'firstTimeLocationRequest';
  final box = await Hive.openBox(firstTimeLocationRequest);
  if (box.containsKey(firstTimeLocationRequest)) {
    return false;
  } else {
    unawaited(box.put(firstTimeLocationRequest, true));
    return true;
  }
}

Future<bool> _isFirstTimeCameraPermission() async {
  //
  const firstTimeCameraRequest = 'firstTimeCameraRequest';
  final box = await Hive.openBox(firstTimeCameraRequest);
  if (box.containsKey(firstTimeCameraRequest)) {
    return false;
  } else {
    unawaited(box.put(firstTimeCameraRequest, true));
    return true;
  }
}
