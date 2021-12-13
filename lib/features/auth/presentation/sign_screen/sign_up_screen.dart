import 'dart:io';
import 'dart:ui';

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
import 'package:trek_high/features/auth/infrastructure/entities/response/country_list_response/country_list_response.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/new_signup_response/new_signup_response.dart';
import 'package:trek_high/features/auth/presentation/sign_screen/widgets/picture_selection_bottom_sheet.dart';

final signupController =
    StateNotifierProvider.autoDispose<AuthController, BaseState>(
        authController);

final countryListController =
    StateNotifierProvider<AuthController, BaseState>(authController);

class SignupScreen extends StatefulHookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _addressController = TextEditingController();
  final _addressFocusNode = FocusNode();
  bool aboutYouself = false;
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
  void initState() {
    context.read(countryListController.notifier).getCountryNameList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _fullNameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _phoneNumberController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _confirmPasswordController = useTextEditingController();
    final _aboutYourSelfController = useTextEditingController();
    final _fullNameFocusNode = useFocusNode();
    final _emailFocusNode = useFocusNode();
    final _phoneNumberFocusNode = useFocusNode();
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
                        Icons.phone,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: InkWell(
                        onTap: () {
                          countryBottomSheet(context: context);
                        },
                        child: CustomTextfield(
                          enabled: false,
                          textEditingController: _addressController,
                          focusNode: _addressFocusNode,
                          labelText: tr('address'),
                          prefixIcon: Icon(
                            Icons.place,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
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
                    ),
                    const SizedBox(height: 15),
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
                        Icons.lock,
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
                    const SizedBox(height: 15),
                    AnimatedCrossFade(
                      firstCurve: Curves.easeInOut,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      crossFadeState: aboutYouself
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: InkWell(
                        onTap: () {
                          setState(() {
                            aboutYouself = true;
                          });
                        },
                        child: Text(
                          tr('About Your-self'),
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      secondChild: CustomTextfield(
                        maxLine: 4,
                        textEditingController: _aboutYourSelfController,
                        focusNode: FocusNode(),
                        hintText: tr('I am ...'),
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode);
                        },
                      ),
                    ),
                    SizedBox(height: size.width / 12),
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
                                  aboutYou:
                                      _aboutYourSelfController.text.trim(),
                                  admin: false,
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

  void countryBottomSheet({
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
        final size = MediaQuery.of(context).size;
        return HookBuilder(
          builder: (context) {
            final countryListState = useProvider(countryListController);
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'Country List',
                      style: GoogleFonts.ptSerif(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          if (countryListState is BaseLoading) ...[
                            Column(
                              children: [
                                SizedBox(
                                  height: size.width / 2.5,
                                ),
                                Text(
                                  'Loading...',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ] else if (countryListState is BaseSuccess) ...[
                            SizedBox(
                              height: size.height / 2.1,
                              child: ListView.separated(
                                itemCount: (countryListState.data
                                        as CountryListResponse)
                                    .data
                                    .length,
                                itemBuilder: (context, item) {
                                  final countryStateData = (countryListState
                                          .data as CountryListResponse)
                                      .data[item];

                                  return InkWell(
                                    onTap: () async {
                                      setState(() {
                                        _addressController.text =
                                            countryStateData.name;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            countryStateData.unicodeFlag
                                                .toString(),
                                            style: GoogleFonts.ptSerif(
                                              textStyle: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          SizedBox(
                                            width: size.width / 1.5,
                                            child: Text(
                                              countryStateData.name.toString(),
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            )
                          ] else if (countryListState is BaseError) ...[
                            Column(
                              children: [
                                SizedBox(
                                  height: size.width / 2.5,
                                ),
                                Text(
                                  'Something went wrong !!!',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ] else
                            ...[],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
