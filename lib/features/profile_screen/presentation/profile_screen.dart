import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/auth/application/auth_controller.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';
import 'package:trek_high/features/profile_screen/presentation/widgets/your_story_widget.dart';

class ProfileScreen extends StatefulHookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String userId = auth.currentUser!.uid;
  late bool isUpdate = false;
  late bool isEnabled = false;

  @override
  void initState() {
    auth.authStateChanges().listen(
      (User? user) async {
        if (user != null) {
          setState(() {
            userId = user.uid;
          });
        }
      },
    );
    super.initState();
  }

  final _fullNamecontroller = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _contactController = TextEditingController();
  final _aboutMeController = TextEditingController();

  //Method to Update email in database
  void updateEmail() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .update({'email': _emailController.text.trim()});
  }

  //Method to Update country in database
  void updateCountry() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .update({'country': _countryController.text.trim()});
  }

  //Method to Update contact number in database
  void updateContactNumber() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .update({'contact': _contactController.text.trim()});
  }

  //Method to Update about me in database
  void updateAboutMe() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .update({'aboutYou': _aboutMeController.text.trim()});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('profile'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        actions: const [CustomNotification()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBodyWidget(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: size.width / 1.3,
                    decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.black.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        StreamBuilder<Object>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(userId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircleAvatar(
                                radius: 65,
                                child: Center(
                                  child: CustomShimmer(),
                                ),
                              );
                            } else if (snapshot.data != null) {
                              final userData =
                                  snapshot.data! as DocumentSnapshot;
                              _fullNamecontroller.text =
                                  '${userData['fullName']}';
                              _emailController.text = '${userData['email']}';
                              _countryController.text =
                                  '${userData['address']}';
                              _contactController.text =
                                  '${userData['contact']}';
                              _aboutMeController.text =
                                  '${userData['aboutYou']}';
                              return Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        color: Colors.blue[100],
                                        height: 100,
                                      ),
                                      Center(
                                        child: CircleAvatar(
                                          radius: 65,
                                          child: CachedNetworkImage(
                                            imageUrl: '${userData['image']}',
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                      Colors.black
                                                          .withOpacity(.1),
                                                      BlendMode.darken,
                                                    ),
                                                    image: imageProvider,
                                                  ),
                                                ),
                                              );
                                            },
                                            errorWidget: (context, error, url) {
                                              return const SizedBox();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  profileDetails(
                                    context: context,
                                    title: 'Full Name: ',
                                    textEditingController: _fullNamecontroller,
                                  ),
                                  profileDetails(
                                    context: context,
                                    title: 'Email: ',
                                    textEditingController: _emailController,
                                  ),
                                  profileDetails(
                                    context: context,
                                    title: 'Country: ',
                                    textEditingController: _countryController,
                                  ),
                                  profileDetails(
                                    context: context,
                                    title: 'Contact: +977 ',
                                    textEditingController: _contactController,
                                  ),
                                  const SizedBox(height: 10),
                                  ExpansionTile(
                                    collapsedIconColor: Colors.grey,
                                    iconColor: Colors.grey,
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    expandedAlignment: Alignment.centerLeft,
                                    title: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Text(
                                        'About me',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                    childrenPadding: const EdgeInsets.only(
                                      left: 14,
                                      right: 16,
                                      bottom: 10,
                                    ),
                                    children: [
                                      Text(
                                        '${userData['aboutYou']}',
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     const Spacer(),
                                  //     InkWell(
                                  //       onTap: () {
                                  //         setState(() {
                                  //           isEnabled = true;
                                  //         });
                                  //       },
                                  //       child: Text(
                                  //         'Update',
                                  //         style: Theme.of(context)
                                  //             .textTheme
                                  //             .bodyText1
                                  //             ?.copyWith(
                                  //               fontSize: 10,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // if (isEnabled == true) ...[
                                  //   CustomButton(
                                  //     buttonText: 'Profile update',
                                  //     onPressed: () async {
                                  //       // updateFullname();
                                  //       // updateEmail();
                                  //       // updateCountry();
                                  //       // updateContactNumber();
                                  //       // updateAboutMe();
                                  //     },
                                  //   )
                                  // ] else
                                  //   ...[]
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Text('Your shared stories'),
            const SizedBox(height: 10),
            HookBuilder(builder: (context) {
              final userId = useProvider(userIdProvider);
              return YourStoryWidget(
                useId: userId.state,
              );
            }),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Padding profileDetails({
    required BuildContext context,
    // required DocumentSnapshot<Object?> userData,
    String? title,
    int? maxLines,
    InputBorder? border,
    TextEditingController? textEditingController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        enabled: isEnabled,
        maxLines: maxLines,
        style: Theme.of(context).textTheme.bodyText2,
        controller: textEditingController,
        decoration: InputDecoration(
          prefix: Text(title!),
          prefixStyle: Theme.of(context).textTheme.bodyText2,
          border: border,
          focusColor: Colors.transparent,
        ),
        onSubmitted: (value) {},
      ),
    );
  }

  //Method to Update full name in database
  void updateFullname() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .update({'fullName': _fullNamecontroller.text.trim()});
  }
}
