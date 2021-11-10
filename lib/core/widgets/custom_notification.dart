import 'package:flutter/material.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 17,
        ),
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).backgroundColor,
                size: 23,
              ),
              onPressed: () {},
            ),
            Positioned(
              right: 12,
              top: 10,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '2',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
