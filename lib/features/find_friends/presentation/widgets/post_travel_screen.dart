import 'dart:ui';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/core/extensions/date_time_extension.dart';
import 'package:trek_high/core/plugins/date_picker.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';
import 'package:trek_high/features/auth/application/auth_controller.dart';
import 'package:trek_high/features/find_friends/application/post_travel_controller.dart';

final postYourTrekController =
    StateNotifierProvider.autoDispose<PostTrekController, BaseState>(
        postTrekController);

class PostTravelScreen extends StatefulHookWidget {
  const PostTravelScreen({Key? key}) : super(key: key);

  @override
  _PostTravelScreenState createState() => _PostTravelScreenState();
}

class _PostTravelScreenState extends State<PostTravelScreen> {
  late bool _isContact = false;
  late bool _isEmail = false;
  late String dob;
  final _formKey = GlobalKey<FormState>();
  final _destinationController = TextEditingController();
  final _dateController = TextEditingController();
  final _destinationFocusNode = FocusNode();
  final _dateFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          tr('Let\'s Meet Up'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: HookBuilder(builder: (context) {
        final userId = useProvider(userIdProvider);
        final userEmail = useProvider(userEmailProvider);
        final userContact = useProvider(userContactProvider);
        final state = useProvider(postYourTrekController);
        return Form(
          key: _formKey,
          child: CustomBodyWidget(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: size.width,
                      height: size.height / 1.7,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          const Text('You trek:'),
                          const SizedBox(height: 10),
                          CustomTextfield(
                            maxLine: 4,
                            textEditingController: _destinationController,
                            focusNode: _destinationFocusNode,
                            labelText: tr('Trek'),
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return tr('required');
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 15),
                          const Text('Trek Date:'),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              calenderBottomSheet(context: context);
                            },
                            child: CustomTextfield(
                              enabled: false,
                              maxLine: 1,
                              textEditingController: _dateController,
                              focusNode: _dateFocusNode,
                              labelText: 'Month-Day-Year',
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(_dateFocusNode);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return tr('required');
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text('Share my:'),
                          const SizedBox(height: 10),
                          CheckboxListTile(
                            title: const Text('Contact'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _isContact,
                            onChanged: (value) {
                              setState(() {
                                _isContact = value!;
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.green,
                            contentPadding: EdgeInsets.zero,
                          ),
                          CheckboxListTile(
                            title: const Text('Email'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _isEmail,
                            onChanged: (value) {
                              setState(() {
                                _isEmail = value!;
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.green,
                            contentPadding: EdgeInsets.zero,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProviderListener(
                      provider: postYourTrekController,
                      onChange: (context, state) async {
                        if (state is BaseError) {
                          await Fluttertoast.showToast(
                            msg: state.failure.errorMessage,
                            backgroundColor: Colors.white,
                            textColor:
                                Theme.of(context).dialogTheme.backgroundColor,
                          );
                        }
                        if (state is BaseLoading) {}
                        if (state is BaseSuccess) {
                          await context.router.pop();
                        }
                      },
                      child: CustomButton(
                        isLoading: state is BaseLoading,
                        buttonWidget: size.width / 2,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read(postYourTrekController.notifier)
                                .postTrek(
                                  trek: _destinationController.text.trim(),
                                  date: _dateController.text.trim(),
                                  myContact:
                                      _isContact ? userContact.state : '',
                                  userId: userId.state,
                                  myEmail: _isEmail ? userEmail.state : '',
                                );
                          }
                        },
                        buttonText: 'Post',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void calenderBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: CustomDatePickerDialog(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 265)),
            onSelectDate: (value) {
              setState(() {
                dob = value!.dobParse();
                _dateController.text = value.convertToMMDDYYYY();
              });
              context.router.pop();
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dateController.clear();
    _destinationController.clear();
    super.dispose();
  }
}
