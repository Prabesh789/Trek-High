import 'package:flutter/material.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Trek High'),
        actions: const [
          CustomNotification(),
        ],
      ),
    );
  }
}
