import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';

class AppPolicyScreen extends StatefulWidget {
  const AppPolicyScreen({Key? key}) : super(key: key);

  @override
  _AppPolicyScreenState createState() => _AppPolicyScreenState();
}

class _AppPolicyScreenState extends State<AppPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [Colors.indigoAccent, Colors.indigoAccent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        leading: CustomBackButton(onTap: () {
          Navigator.of(context).pop();
        }),
        title: Text(
          tr('About App'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              'About Us',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '‘Trek-High’ is a mobile application which is developed to help travel and'
                ' tourism in Nepal through a mobile application platform. This ‘Trek-High’'
                ' application is specially targeted for the trekkers and hikers or any kinds'
                ' of travelers inside Nepal.',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              'Phone Number: +977 986567878/ 01-7687879',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.left,
            ),
            Text(
              'Email: trekhightem456@gmail.com',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.left,
            ),
            Text(
              'Twiter: trek_high@456',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.left,
            ),
            const AppPolicyWidget(
              policyTitle: 'Trek-High objectives',
              policyDes:
                  'a.	To provide user safety measure information, Health related information, backpacking information, online trails information.\n\n'
                  'b.	To provide alert notification of that place to the users.\n\n'
                  'c. To provide travelling stories sharing platforms to users.\n\n'
                  'd. To connect with other trekkers and hikers who are on the same trails. ',
            ),
            const AppPolicyWidget(
              policyTitle: 'Terms and Contitions',
              policyDes:
                  '1. User must give their true information during registeration process.\n\n'
                  '2. User are not allow to post any picture or words that may cause any disrespect, hurt to particular ethnicity, nation and people.\n\n'
                  '3. User are not allow to post other contents without credit. \n\n'
                  '4. User can directly contact or email with a polite and clear message. \n\n'
                  '5. User data analysis is used for futher improvement of this application.\n\n'
                  '6. User can not do appeal for any decision taken by admin.\n\n',
            ),
          ],
        ),
      ),
    );
  }
}

class AppPolicyWidget extends StatelessWidget {
  const AppPolicyWidget({
    Key? key,
    required this.policyDes,
    required this.policyTitle,
  }) : super(key: key);
  final String policyTitle;
  final String policyDes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            policyTitle,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
            policyDes,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Colors.grey,
                ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
