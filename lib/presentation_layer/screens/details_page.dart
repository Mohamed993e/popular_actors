

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:famous_actors/data/Services/api_services.dart';
import 'package:famous_actors/data/models/actor_info_model.dart';
import 'package:famous_actors/data/models/home_page_model.dart';
import 'package:famous_actors/data/models/images_model.dart';
import 'package:famous_actors/data/repository/actor_info_repo.dart';
import 'package:famous_actors/data/repository/images_repo.dart';
import 'package:famous_actors/presentation_layer/widgets/my_progress_indecator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.wallpaper,
    required this.imagesId,
  });
  final int imagesId;
  final HomePageModel wallpaper;
  late ImagesModel imagesModel;
  late List<ImagesModel> images = [];
  late ActorInfoModel actorInfo = ActorInfoModel();

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _is_loading = true;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    ImagesRepo imagesRepo = ImagesRepo(apiServices, widget.wallpaper);
    widget.images = await imagesRepo.getImages();
    ActorInfoRepo actorInfoRepo = ActorInfoRepo(apiServices, widget.wallpaper);
    final info = await actorInfoRepo.getInfo();
    setState(() {
      widget.actorInfo = info;
      _is_loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.wallpaper.name!,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(181, 155, 39, 176),
        ),
        body: _is_loading == true
            ? MyCircleProgressIndecator()
            : Container(
                color: const Color.fromARGB(115, 155, 39, 176),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.6,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            pauseAutoPlayOnTouch: true,
                          ),
                          items: [
                            for (int i = 0; i < widget.images.length; i++)
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500${widget.images[i].file_path}',
                                  placeholder: (context, url) =>
                                      MyCircleProgressIndecator(),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.wallpaper.name == null
                                ? "No Name Found"
                                : '${widget.wallpaper.name}',
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          widget.actorInfo.alsoKnownAs == null ||
                                  widget.actorInfo.alsoKnownAs!.isEmpty
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Known As : ',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                    ),
                                    Text(
                                      widget.actorInfo.alsoKnownAs!.isEmpty
                                          ? "No Also Known As"
                                          : '${widget.actorInfo.alsoKnownAs.toString()}',
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Biography : ',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(widget.actorInfo?.biography == null ||
                                  widget.actorInfo?.biography == ''
                              ? "We Don't Have a Bio For ${widget.actorInfo.name} "
                              : '${widget.actorInfo?.biography}'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Birthday : ',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.actorInfo?.birthday == null ||
                                      widget.actorInfo?.birthday == ''
                                  ? "No Birthday"
                                  : '${widget.actorInfo?.birthday}'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Place of Birth : ',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(widget.actorInfo?.placeOfBirth == null ||
                                  widget.actorInfo?.placeOfBirth == ''
                              ? "No Place of Birth"
                              : '${widget.actorInfo?.placeOfBirth}'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
