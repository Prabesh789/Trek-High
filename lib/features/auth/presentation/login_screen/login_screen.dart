import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';
import 'package:trek_high/features/auth/application/auth_controller.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/login_request/login_request.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/new_signup_request/new_signup_request.dart';

final loginController =
    StateNotifierProvider.autoDispose<AuthController, BaseState>(
        authController);

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late NewSignupRequest newSignupRequest;
  bool obscureText = true;
  late bool isAdmin = false;
  final _formKey = GlobalKey<FormState>();
  void _togglevisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userEmailController = useTextEditingController();
    final _userNameFocusNode = useFocusNode();
    final _passwordController = useTextEditingController();
    final _passwordFocusNode = useFocusNode();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(onTap: () {
          Navigator.of(context).pop();
        }),
        leadingWidth: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Trek High',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: HookBuilder(
        builder: (context) {
          final state = useProvider(loginController);

          return Form(
            key: _formKey,
            child: CustomBodyWidget(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight - 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 100),
                          Text(
                            tr('well_come'),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(height: 40),
                          CustomTextfield(
                            textEditingController: _userEmailController,
                            focusNode: _userNameFocusNode,
                            labelText: tr('user_email'),
                            prefixIcon: Icon(
                              Icons.people,
                              color: Theme.of(context).iconTheme.color,
                              size: 18,
                            ),
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email Invalid';
                              } else if (!value.contains('@')) {
                                return 'Email Invalid';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            obscureText: obscureText,
                            textEditingController: _passwordController,
                            focusNode: _passwordFocusNode,
                            labelText: tr('password'),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).iconTheme.color,
                              size: 18,
                            ),
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password Invalid';
                              } else {
                                return null;
                              }
                            },
                            sufixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 18, right: 15),
                              child: InkWell(
                                onTap: _togglevisibility,
                                child: Text(
                                  obscureText ? 'show' : 'hide',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.width / 4),
                          ProviderListener(
                            provider: loginController,
                            onChange: (context, state) async {
                              if (state is BaseError) {
                                await Fluttertoast.showToast(
                                  msg: state.failure.errorMessage,
                                  backgroundColor: Colors.white,
                                  textColor: Theme.of(context)
                                      .dialogTheme
                                      .backgroundColor,
                                );
                              }
                              if (state is BaseSuccess) {
                                // await FirebaseFirestore.instance
                                //     .collection('users')
                                //     .doc(userId.state)
                                //     .get()
                                //     .then((ds) {
                                //   if (mounted) {
                                //     setState(() {
                                //       newSignupRequest = NewSignupRequest(
                                //         fullName: ds['fullName'].toString(),
                                //         address: ds['address'].toString(),
                                //         admin: ds['admin'] as bool,
                                //         contact: ds['contact'].toString(),
                                //         email: ds['email'].toString(),
                                //         password: ds['password'].toString(),
                                //         platform: ds['platform'] as int,
                                //         deviceId: ds['platform'].toString(),
                                //       );
                                //     });
                                //   }
                                // });
                                isAdmin
                                    ? await context.router
                                        .replace(const AdminDashboardRoute())
                                    : await context.router
                                        .replace(const BottomNavigationRoute());
                              }
                            },
                            child: CustomButton(
                              isLoading: state is BaseLoading,
                              buttonText: tr('login'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final data = {
                                    'email': _userEmailController.text.trim(),
                                    'password': _passwordController.text.trim(),
                                    'platform': Platform.isAndroid ? 1 : 2,
                                    'latitude': 0.0,
                                    'longitude': 0.0
                                  };
                                  final value = LoginRequest.fromJson(data);
                                  context
                                      .read(loginController.notifier)
                                      .loginUser(
                                        loginRequest: value,
                                      );
                                  if (_userEmailController.text.trim() ==
                                          'admin@gmail.com' &&
                                      _passwordController.text.trim() ==
                                          'admin@123') {
                                    setState(() {
                                      isAdmin = true;
                                    });
                                  } else {}
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  context.router.push(const SignupRoute());
                                },
                                child: Text(
                                  tr('new_sign_up'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Card(
                            elevation: 0,
                            color: Theme.of(context).cardColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: SwitchListTile(
                              onChanged: (bool newValue) {
                                context.setLocale(
                                  newValue
                                      ? const Locale('ne', 'NP')
                                      : const Locale('en'),
                                );
                              },
                              value: context.locale == const Locale('ne', 'NP'),
                              title: Text(
                                tr('language_switch_title'),
                                style: GoogleFonts.ptSerif(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
