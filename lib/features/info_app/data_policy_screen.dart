import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';

class DataPolicyScreen extends StatefulWidget {
  const DataPolicyScreen({Key? key}) : super(key: key);

  @override
  _DataPolicyScreenState createState() => _DataPolicyScreenState();
}

class _DataPolicyScreenState extends State<DataPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(onTap: () {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        title: Text(
          tr('Data Privacy'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            DataPloicy(
              size: size,
              img: 'assets/images/data_policy.svg',
              policyTitle: 'Account Protection',
              policyDes:
                  'User account are fully protected. All user have to enter valid email & password, In future app will provide a two ways authentication system.',
            ),
            const SizedBox(height: 15),
            DataPloicy(
              size: size,
              img: 'assets/images/data_safe.svg',
              policyTitle: 'Your Data',
              policyDes:
                  'User data security is our first concern. Data of our user are fully protected under our security. No any third party shared at any cost.',
            ),
            const SizedBox(height: 15),
            DataPloicy(
              size: size,
              img: 'assets/images/user_data.svg',
              policyTitle: 'Your Data',
              policyDes:
                  'User data security is our first concern. Data of our user are fully protected under our security. No any third party shared at any cost.',
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class DataPloicy extends StatelessWidget {
  const DataPloicy({
    Key? key,
    required this.size,
    required this.img,
    required this.policyDes,
    required this.policyTitle,
  }) : super(key: key);

  final Size size;
  final String policyTitle;
  final String img;
  final String policyDes;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width / 1.2,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 10),
              blurRadius: 50,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Center(
              child: SvgPicture.asset(
                img,
                height: 140,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              policyTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                policyDes,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
