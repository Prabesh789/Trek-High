import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trek_high/core/widgets/custom_textfield.dart';

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
  final int hasImage = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _storyTextController = useTextEditingController();
    final _storyTextfocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  child: SvgPicture.asset(
                    'assets/images/img_folder.svg',
                    height: size.height / 4,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
