import 'dart:io';
import 'dart:ui';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek_high/admin/application/admin_controller.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_body_widget.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';

final adminPannelController =
    StateNotifierProvider.autoDispose<AdminController, BaseState>(
        adminController);

class DestinationScreen extends StatefulHookWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  late File _imageFile = File('');
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _titileController = useTextEditingController();
    final _bodyController = useTextEditingController();
    final _featuresController = useTextEditingController();
    final _rulesController = useTextEditingController();
    final _backPackingController = useTextEditingController();
    final _helpingHandsController = useTextEditingController();
    final _startedPoints = useTextEditingController();
    final _endingPoints = useTextEditingController();
    final _titleFocusNode = useFocusNode();
    final _bodyFocusNode = useFocusNode();
    final _featuresFocusNode = useFocusNode();
    final _rulesFocusNode = useFocusNode();
    final _bagPackingFocusNode = useFocusNode();
    final _helpingHandsFocusNode = useFocusNode();
    final _startedPointsFocusNode = useFocusNode();
    final _endingPointsFocusNode = useFocusNode();
    return HookBuilder(builder: (context) {
      final state = useProvider(adminPannelController);
      final size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(onTap: () {
            Navigator.of(context).pop();
          }),
          centerTitle: true,
          title: Text(
            tr('Destination Details'),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: CustomBodyWidget(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text('Title'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      textEditingController: _titileController,
                      focusNode: _titleFocusNode,
                      hintText: tr('Title...'),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_bodyFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Title required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('About Info.'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 10,
                      textEditingController: _bodyController,
                      focusNode: _bodyFocusNode,
                      hintText: tr('Info...'),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_featuresFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Info required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Features'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 7,
                      textEditingController: _featuresController,
                      focusNode: _featuresFocusNode,
                      hintText: tr('Features...'),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_rulesFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Features required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Permits rules'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 7,
                      textEditingController: _rulesController,
                      focusNode: _rulesFocusNode,
                      hintText: tr('Permits rules...'),
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_bagPackingFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Highlights and rulesrequired');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Backpacking Tips'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 6,
                      textEditingController: _backPackingController,
                      focusNode: _bagPackingFocusNode,
                      hintText: tr('Backpacking...'),
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_helpingHandsFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Bag-packing required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Helping lines'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 5,
                      textEditingController: _helpingHandsController,
                      focusNode: _helpingHandsFocusNode,
                      hintText: tr('Helping lines...'),
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_startedPointsFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Helpng lines required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Images'),
                    const SizedBox(height: 10),
                    Container(
                      height: size.width / 2.4,
                      width: size.width / 1.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue[50],
                          image: DecorationImage(
                            image: FileImage(
                              _imageFile,
                            ),
                            fit: BoxFit.cover,
                          )),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return uploadImages(context);
                              });
                        },
                        child: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    const Text('Started Lat, Lng'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 1,
                      textEditingController: _startedPoints,
                      focusNode: _startedPointsFocusNode,
                      hintText: tr('Started Lat, Lng'),
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_endingPointsFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Started Lat, Lng required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Ending Lat, Lng'),
                    const SizedBox(height: 10),
                    CustomTextfield(
                      maxLine: 1,
                      textEditingController: _endingPoints,
                      focusNode: _endingPointsFocusNode,
                      hintText: tr('Started Lat, Lng'),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return tr('Ending Lat, Lng required');
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    ProviderListener(
                      provider: adminPannelController,
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
                          _titileController.clear();
                          _bodyController.clear();
                          _featuresController.clear();
                          _rulesController.clear();
                          _backPackingController.clear();
                          _helpingHandsController.clear();
                          _startedPoints.clear();
                          _endingPoints.clear();
                          await context.router.pop();
                        }
                      },
                      child: CustomButton(
                        isLoading: state is BaseLoading,
                        buttonText: tr('Add +'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read(adminPannelController.notifier)
                                .uploadTrekDestination(
                                  title: _titileController.text.trim(),
                                  aboutInfo: _bodyController.text.trim(),
                                  features: _featuresController.text.trim(),
                                  rules: _rulesController.text.trim(),
                                  bagPacking:
                                      _backPackingController.text.trim(),
                                  helpingLines:
                                      _helpingHandsController.text.trim(),
                                  image: _imageFile,
                                  startedPoints: _startedPoints.text.trim(),
                                  endingPoints: _endingPoints.text.trim(),
                                );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 50)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  BackdropFilter uploadImages(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: size.height / 3.6,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8, // soften the shadow
              spreadRadius: 5, //extend the shadow
              offset: const Offset(
                -1, // Move to right 10  horizontally
                -10, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('Choose from gallery'),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                takePhoto(ImageSource.gallery);
              },
              child: Image.asset(
                'assets/images/gallery.png',
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
            )
          ],
        ),
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
