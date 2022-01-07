import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';

class UploadedDestinationListScreen extends StatefulWidget {
  const UploadedDestinationListScreen({Key? key}) : super(key: key);

  @override
  _UploadedDestinationListScreenState createState() =>
      _UploadedDestinationListScreenState();
}

class _UploadedDestinationListScreenState
    extends State<UploadedDestinationListScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          tr('Destination List'),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('trek_destination')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                final destinationData = snapshots.data?.docs;
                if (snapshots.data == null) {
                  return const Center(
                    child: Text('Loading...'),
                  );
                } else if (destinationData!.isEmpty) {
                  return const Center(
                    child: Text('No any destination yet...!'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: destinationData.length,
                      itemBuilder: (context, item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
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
                              children: [
                                SizedBox(
                                  height: size.height / 6,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.router
                                              .push(DestinationDetailRoute(
                                            destinationId:
                                                destinationData[item].id,
                                            destinationTitle:
                                                destinationData[item]['title']
                                                    .toString(),
                                            aboutInfo: destinationData[item]
                                                    ['aboutInfo']
                                                .toString(),
                                            features: destinationData[item]
                                                    ['features']
                                                .toString(),
                                            endingLatLng: destinationData[item]
                                                    ['endingPoints']
                                                .toString(),
                                            helpingLines: destinationData[item]
                                                    ['helpingLines']
                                                .toString(),
                                            permitRules: destinationData[item]
                                                    ['rules']
                                                .toString(),
                                            images: destinationData[item]
                                                    ['image']
                                                .toString(),
                                            startedLatLng: destinationData[item]
                                                    ['startedPoints']
                                                .toString(),
                                            backPacking: destinationData[item]
                                                    ['bagPacking']
                                                .toString(),
                                          ));
                                        },
                                        child: SizedBox(
                                          width: size.width / 2,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${destinationData[item]['image']}',
                                              fit: BoxFit.fill,
                                              placeholder: (contexr, url) {
                                                return CustomShimmer(
                                                  radius: 0,
                                                  height: size.height / 6,
                                                  width: size.width,
                                                );
                                              },
                                              errorWidget:
                                                  (context, error, url) {
                                                return CustomShimmer(
                                                  radius: 0,
                                                  height: size.height / 6,
                                                  width: size.width,
                                                );
                                              },
                                              imageBuilder:
                                                  (context, imageProvider) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.black
                                                            .withOpacity(.4),
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
                                      ),
                                      SizedBox(
                                        width: size.width / 2.7,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 20),
                                            Text(
                                              '${destinationData[item]['title']}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                const SizedBox(width: 10),
                                                const Icon(
                                                  Icons.upcoming,
                                                  color: Colors.grey,
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    deleteAlertDialog(
                                                        id: destinationData[
                                                                item]
                                                            .id,
                                                        title:
                                                            '${destinationData[item]['title']}');
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: kTextTabBarHeight,
            )
          ],
        ),
      ),
    );
  }

  void deleteAlertDialog({required String id, required String title}) {
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
        deleteDestination(id: id);
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
            content: Text('Delete this destination,\n $title',
                style: const TextStyle(fontSize: 15)),
            actions: [
              cancelButton,
              yesButton,
            ],
          ),
        );
      },
    );
  }

  Future<void> deleteDestination({required String id}) async {
    final users = FirebaseFirestore.instance.collection('trek_destination');
    await users.doc(id).delete().then(
      (value) {
        return const Text('Oops sorry !');
      },
    ).catchError((error) {
      return Text(error.toString());
    });
  }
}
