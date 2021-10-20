import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';

class SignupScreen extends StatefulHookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: CustomBackButton(onTap: () {
          Navigator.of(context).pop();
        }),
        leadingWidth: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Register',
          style: GoogleFonts.ptSerif(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomBodyWidget(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
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
                ),
                const SizedBox(height: 50),
                CustomTextfield(
                  textEditingController: _fullNameController,
                  focusNode: _fullNameFocusNode,
                  labelText: tr('Full Name'),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User full-name can not be empty!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  textEditingController: _emailController,
                  focusNode: _emailFocusNode,
                  labelText: tr('Email'),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User email can not be empty!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  textEditingController: _phoneNumberController,
                  focusNode: _phoneNumberFocusNode,
                  labelText: tr('Phone number'),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_addressFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User phone number can not be empty!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  textEditingController: _addressController,
                  focusNode: _addressFocusNode,
                  labelText: tr('Address'),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'User address can not be empty!';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  textEditingController: _passwordController,
                  focusNode: _passwordFocusNode,
                  labelText: tr('Password'),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context)
                        .requestFocus(_confirmPasswordFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password can not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomTextfield(
                  textEditingController: _confirmPasswordController,
                  focusNode: _confirmPasswordFocusNode,
                  labelText: tr('Confirm password'),
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.black.withOpacity(0.3),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
