import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _userNameController = useTextEditingController();
    final _userNameFocusNode = useFocusNode();
    final _passwordController = useTextEditingController();
    final _passwordFocusNode = useFocusNode();
    return Scaffold(
      // appBar: AppBar(
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: const Icon(
      //       Icons.arrow_back_ios,
      //     ),
      //   ),
      // ),
      body: CustomBodyWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 100),
              CustomTextfield(
                textEditingController: _userNameController,
                focusNode: _userNameFocusNode,
                labelText: 'User Name',
                prefixIcon: Icon(
                  Icons.people,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                textEditingController: _passwordController,
                focusNode: _passwordFocusNode,
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 60),
              Text(
                'skip',
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
