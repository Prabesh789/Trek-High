import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';

class YourStoryWidget extends StatefulWidget {
  const YourStoryWidget({
    Key? key,
    required this.useId,
  }) : super(key: key);
  final String useId;

  @override
  State<YourStoryWidget> createState() => _YourStoryWidgetState();
}

class _YourStoryWidgetState extends State<YourStoryWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 220,
      child: StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('travelers_stories')
            .snapshots(),
        builder: (context, AsyncSnapshot<Object> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No stories are posted yet.'),
            );
          } else if (snapshot.data != null) {
            final storiesData = snapshot.data! as QuerySnapshot;
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: storiesData.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if ('${storiesData.docs[index]['userId']}' == widget.useId) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            SizedBox(
                              height: size.height / 4,
                              width: size.width / 2.4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${storiesData.docs[index]['image']}',
                                  fit: BoxFit.cover,
                                  placeholder: (contexr, url) {
                                    return CustomShimmer(
                                      radius: 0,
                                      height: size.height / 4,
                                      width: size.width,
                                    );
                                  },
                                  errorWidget: (context, error, url) {
                                    return CustomShimmer(
                                      radius: 0,
                                      height: size.height / 4,
                                      width: size.width,
                                    );
                                  },
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(.4),
                                            BlendMode.darken,
                                          ),
                                          image: imageProvider,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                SizedBox(
                                  width: size.width / 2.4,
                                  child: Text(
                                    '${storiesData.docs[index]['title']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    maxLines: 20,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: size.width / 2.2,
                                  child: InkWell(
                                    onTap: () {
                                      deleteAlertDialog(
                                        id: storiesData.docs[index].id,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        const Text('Delete'),
                                        IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.delete_forever),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                  // return Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 70,
                  //       child: Image.asset('assets/images/empty_box.jpg'),
                  //     ),
                  //     SizedBox(
                  //       width: size.width,
                  //       child: Center(
                  //         child: Column(
                  //           children: const [
                  //             Spacer(),
                  //             Text(
                  //               'You do not have any stories',
                  //             ),
                  //             SizedBox(height: 20)
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // );
                }
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void deleteAlertDialog({required String id}) {
    final Widget cancelButton = TextButton(
      child: Text(
        'Cancel',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    final Widget yesButton = TextButton(
      child: Text(
        'Yes',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
      ),
      onPressed: () {
        deletePersonalStories(id: id);
        Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: 'The destination has been deleted.',
        );

        Navigator.of(context).pop();
      },
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: Text(
              'Are you sure !',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            content: const Text(
              'Delete your story.',
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              cancelButton,
              yesButton,
            ],
          ),
        );
      },
    );
  }

  Future<void> deletePersonalStories({required String id}) async {
    final users = FirebaseFirestore.instance.collection('travelers_stories');
    await users.doc(id).delete().then(
      (value) {
        return const Text('Oops sorry !');
      },
    ).catchError((error) {
      return Text(error.toString());
    });
  }
}
