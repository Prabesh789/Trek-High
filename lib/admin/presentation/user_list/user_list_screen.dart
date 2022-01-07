// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';

class UserListScreen extends StatefulHookWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
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
          tr('User List'),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: HookBuilder(builder: (context) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            final userData = snapshots.data?.docs;
            if (snapshots.data == null) {
              return const Center(
                child: Text('Loading...'),
              );
            } else if (userData!.isEmpty) {
              return const Center(
                child: Text('No user are registered yet...!'),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  if (userData[index]['admin'] != true) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.cyan[50],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.teal[50],
                                    backgroundImage: CachedNetworkImageProvider(
                                      '${userData[index]['image']}',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Full Name: ',
                                          ),
                                          Text(
                                            '${userData[index]['fullName']}',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Email: ',
                                          ),
                                          Text(
                                            '${userData[index]['email']}',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      deleteAlertDialog(
                                        id: snapshots.data!.docs[index].id,
                                        username:
                                            '${userData[index]['fullName']}',
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              );
            }
          },
        );
      }),
    );
  }

  void deleteAlertDialog({required String id, required String username}) {
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
        deleteUser(id: id);
        Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: 'The user has been deleted.',
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
            content: Text('Delete the user : ' + username + '?',
                style: const TextStyle(fontSize: 16)),
            actions: [
              cancelButton,
              yesButton,
            ],
          ),
        );
      },
    );
  }

  Future<void> deleteUser({required String id}) async {
    final users = FirebaseFirestore.instance.collection('users');
    await users.doc(id).delete().then(
      (value) {
        return const Text('Oops sorry !');
      },
    ).catchError((error) {
      return Text(error.toString());
    });
  }
}
