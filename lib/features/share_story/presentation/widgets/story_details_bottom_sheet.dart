import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/entities/base_state.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';
import 'package:trek_high/features/auth/application/auth_controller.dart';
import 'package:trek_high/features/share_story/application/share_story_controller.dart';

final sharemyStoryController =
    StateNotifierProvider.autoDispose<ShareStoryController, BaseState>(
        shareStoryController);

class StoryDetailBottomSheet {
  static void showStoryDetailBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return const StoryDetails();
      },
    );
  }
}

class StoryDetails extends StatefulHookWidget {
  const StoryDetails({Key? key}) : super(key: key);

  @override
  _StoryDetailsState createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  late int hasImage = 1;
  late File _imageFile = File('');
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _storyTextController = useTextEditingController();
    final _storyTextfocusNode = useFocusNode();

    return HookBuilder(builder: (context) {
      final userId = useProvider(userIdProvider);
      final state = useProvider(sharemyStoryController);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(width: size.width / 4),
                  const Spacer(),
                  const Text('Your Story'),
                  const Spacer(),
                  SizedBox(
                    width: size.width / 4,
                    child: ProviderListener(
                      provider: sharemyStoryController,
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
                          _storyTextController.clear();
                          await context.router.pop();
                        }
                      },
                      child: CustomButton(
                        isLoading: state is BaseLoading,
                        buttonHeigh: 40,
                        onPressed: () {
                          context
                              .read(sharemyStoryController.notifier)
                              .shareStory(
                                title: _storyTextController.text.trim(),
                                image: _imageFile,
                                userId: userId.state,
                                isFavorite: false,
                              );
                        },
                        buttonText: 'Post',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Text('Title'),
              const SizedBox(height: 15),
              CustomTextfield(
                maxLine: 3,
                textEditingController: _storyTextController,
                focusNode: _storyTextfocusNode,
                hintText: tr('Text...'),
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              const SizedBox(height: 20),
              const Text('Image'),
              const SizedBox(height: 10),
              if (hasImage != 1) ...[
                Container(
                  height: size.height / 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                    image: DecorationImage(
                      image: FileImage(
                        _imageFile,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ] else ...[
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        takePhoto(ImageSource.gallery);
                      },
                      child: SvgPicture.asset(
                        'assets/images/img_folder.svg',
                        height: size.height / 4,
                      ),
                    ),
                  ),
                ),
              ],
              SizedBox(height: size.width),
            ],
          ),
        ),
      );
    });
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
    setState(() {
      hasImage = 2;
    });
  }
}
