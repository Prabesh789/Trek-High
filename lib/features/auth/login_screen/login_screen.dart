import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/theme/application/theme_controller.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  void _togglevisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userNameController = useTextEditingController();
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
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Form(
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
                        textEditingController: _userNameController,
                        focusNode: _userNameFocusNode,
                        labelText: tr('user_name'),
                        prefixIcon: Icon(
                          Icons.people,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'User Email Can not be empty';
                          } else {
                            return null;
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
                        ),
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'User Email Can not be empty';
                          } else {
                            return null;
                          }
                        },
                        sufixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 15),
                          child: InkWell(
                            onTap: _togglevisibility,
                            child: Text(
                              obscureText ? 'show' : 'hide',
                              style: GoogleFonts.ptSerif(
                                textStyle: const TextStyle(
                                  fontSize: 14,
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
                      CustomButton(
                        buttonText: tr('login'),
                        onPressed: () {
                          context.router.push<void>(const MainDashboardRoute());
                        },
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
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        tr('skip'),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .apply(fontWeightDelta: 2),
                      ),
                      const SizedBox(height: 50),
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
                            context
                                .read(themeController.notifier)
                                .changeTheme(newValue);
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          value:
                              Theme.of(context).brightness == Brightness.dark,
                          title: Text(
                            tr('dark_mode'),
                            style: GoogleFonts.ptSerif(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                              ),
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
      ),
    );
  }
}
