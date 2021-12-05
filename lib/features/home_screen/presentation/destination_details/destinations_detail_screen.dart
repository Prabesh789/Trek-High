import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';

class DestinationDetailScreen extends StatefulWidget {
  const DestinationDetailScreen({Key? key}) : super(key: key);

  @override
  _DestinationDetailScreenState createState() =>
      _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(onTap: () {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        title: Text(
          tr('popular_treks'),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
