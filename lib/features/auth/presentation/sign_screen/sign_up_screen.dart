import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/core/extensions/context_extension.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';
import 'package:trek_high/features/auth/application/auth_controller.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/new_signup_response/new_signup_response.dart';
import 'package:trek_high/features/auth/presentation/sign_screen/widgets/picture_selection_bottom_sheet.dart';

final signupController =
    StateNotifierProvider.autoDispose<AuthController, BaseState>(
        authController);

class SignupScreen extends StatefulHookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late File? _imageFile = File('');
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool obscureConfirmText = true;
  void _togglevisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _confirmVogglevisibility() {
    setState(() {
      obscureConfirmText = !obscureConfirmText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _fullNameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _phoneNumberController = useTextEditingController();
    final _addressController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _confirmPasswordController = useTextEditingController();
    final _fullNameFocusNode = useFocusNode();
    final _emailFocusNode = useFocusNode();
    final _phoneNumberFocusNode = useFocusNode();
    final _addressFocusNode = useFocusNode();
    final _passwordFocusNode = useFocusNode();
    final _confirmPasswordFocusNode = useFocusNode();
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
          tr('register'),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: HookBuilder(builder: (context) {
        final signupState = useProvider(signupController);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomBodyWidget(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.indigoAccent.withOpacity(0.3),
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 15),
                                blurRadius: 6,
                                color: Colors.grey.withOpacity(0.07),
                              ),
                            ],
                          ),
                          height: size.height / 6,
                          width: size.width / 2.3,
                          child: _imageFile != null
                              ? CircleAvatar(
                                  backgroundImage: FileImage(
                                    _imageFile!,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              PictureSelectionBottomSheet
                                  .pictureSelectionBottomSheet(
                                      context: context,
                                      onCamera: () {
                                        takePhoto(ImageSource.camera);
                                      },
                                      onGallery: () {
                                        takePhoto(ImageSource.gallery);
                                      });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.indigoAccent.withOpacity(0.3),
                                  width: 3,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    CustomTextfield(
                      textEditingController: _fullNameController,
                      focusNode: _fullNameFocusNode,
                      labelText: tr('full_name'),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_emailFocusNode);
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
                    CustomTextfield(
                      textEditingController: _emailController,
                      focusNode: _emailFocusNode,
                      labelText: tr('email'),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_phoneNumberFocusNode);
                      },
                      validator: (String? value) {
                        final regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value!.isEmpty) {
                          return tr('email_validation');
                        } else if (!regex.hasMatch(value)) {
                          return tr('email_validation1');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextfield(
                      textEditingController: _phoneNumberController,
                      focusNode: _phoneNumberFocusNode,
                      labelText: tr('phone_number'),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_addressFocusNode);
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
                    CustomTextfield(
                      textEditingController: _addressController,
                      focusNode: _addressFocusNode,
                      labelText: tr('address'),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
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
                    CustomTextfield(
                      obscureText: obscureText,
                      textEditingController: _passwordController,
                      focusNode: _passwordFocusNode,
                      labelText: tr('password'),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('required');
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
                    const SizedBox(height: 15),
                    CustomTextfield(
                      obscureText: obscureConfirmText,
                      textEditingController: _confirmPasswordController,
                      focusNode: _confirmPasswordFocusNode,
                      labelText: tr('confirm_password'),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return tr('confirm_password_validation');
                        } else if (_passwordController.text.trim() !=
                            _confirmPasswordController.text.trim()) {
                          return tr('confirm_Password_validation');
                        } else {
                          return null;
                        }
                      },
                      sufixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 15),
                        child: InkWell(
                          onTap: _confirmVogglevisibility,
                          child: Text(
                            obscureConfirmText ? 'show' : 'hide',
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
                    SizedBox(height: size.width / 10),
                    ProviderListener(
                      provider: signupController,
                      onChange: (context, signupState) {
                        if (signupState is BaseError) {
                          Fluttertoast.showToast(
                            msg: signupState.failure.errorMessage,
                            backgroundColor: Colors.white,
                            textColor:
                                Theme.of(context).dialogTheme.backgroundColor,
                          );
                        }
                        if (signupState is BaseLoading) {}

                        if (signupState is BaseSuccess) {
                          _fullNameController.clear();
                          _emailController.clear();
                          _phoneNumberController.clear();
                          _addressController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();

                          final data = signupState.data as SignupResponse;

                          context.router.replaceAll([const LoginRoute()]);
                          context.showStatusBar(
                            message:
                                '${data.message} !\n Dear ${data.firstName}, we have sent an email verification link to ${data.email}, please check inbox before login.',
                            iconWidget: Icon(
                              Ionicons.checkmark_circle_outline,
                              color:
                                  Theme.of(context).dialogTheme.backgroundColor,
                            ),
                          );
                        }
                      },
                      child: CustomButton(
                        isLoading: signupState is BaseLoading,
                        buttonText: tr('sign_up'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read(signupController.notifier).signupUser(
                                  fullName: _fullNameController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  contact: _phoneNumberController.text.trim(),
                                  address: _addressController.text.trim(),
                                  email: _emailController.text.trim(),
                                  image: _imageFile,
                                );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void takePicture(ImageSource camera) {
    Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose profile photo',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //taking a picture from camera or gallery

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
    // ignore: use_build_context_synchronously
    await context.popRoute();
  }
}
