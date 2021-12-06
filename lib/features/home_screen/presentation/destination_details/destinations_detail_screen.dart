import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trek_high/core/widgets/custom_back_button.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';

class DestinationDetailScreen extends StatefulHookWidget {
  const DestinationDetailScreen({
    Key? key,
    required this.destinationId,
    required this.destinationTitle,
    required this.aboutInfo,
    required this.features,
    required this.helpingLines,
    required this.permitRules,
    required this.images,
    required this.startedLatLng,
    required this.endingLatLng,
    required this.backPacking,
  }) : super(key: key);
  final String destinationId;
  final String destinationTitle;
  final String aboutInfo;
  final String features;
  final String permitRules;
  final String helpingLines;
  final String images;
  final String startedLatLng;
  final String endingLatLng;
  final String backPacking;

  @override
  _DestinationDetailScreenState createState() =>
      _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: HookBuilder(builder: (context) {
        // final aboutInfo = widget.aboutInfo;
        // final idx = aboutInfo.indexOf('#');
        // final firstPart = aboutInfo.substring(0, idx).trim();
        // final secondPart = aboutInfo.substring(idx + 1).trim();

        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                title: AnimatedOpacity(
                  opacity: innerBoxIsScrolled ? 1 : 0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 600),
                  child: Text(
                    widget.destinationTitle,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                elevation: 6,
                backgroundColor: Theme.of(context).backgroundColor,
                expandedHeight: size.height / 2.6,
                floating: true,
                pinned: true,
                leading: CustomBackButton(onTap: () {
                  Navigator.of(context).pop();
                }),
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                    height: size.height / 2.6,
                    width: size.width,
                    child: CachedNetworkImage(
                      imageUrl: widget.images,
                      fit: BoxFit.cover,
                      errorWidget: (context, error, url) {
                        return CustomShimmer(
                          radius: 0,
                          height: size.height / 2.6,
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
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.destinationTitle,
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.aboutInfo,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 20,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Features',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.features,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 20,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Permit Rules',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.permitRules,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 20,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Backpacking',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.backPacking,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 20,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Helping Lines',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.helpingLines,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 20,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Started Lat, Lng: ',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.startedLatLng,
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 20,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Ending Lat, Lng: ',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.endingLatLng,
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 20,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
