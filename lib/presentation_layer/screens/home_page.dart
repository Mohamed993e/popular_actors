import 'dart:developer';

import 'package:famous_actors/data/Services/api_services.dart';
import 'package:famous_actors/data/models/home_page_model.dart';
import 'package:famous_actors/data/repository/wallpapers_repo.dart';
import 'package:famous_actors/presentation_layer/widgets/my_progress_indecator.dart';
import 'package:famous_actors/presentation_layer/widgets/wallpaper_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<HomePageModel> home_page_model = [];
  ApiServices apiServices = ApiServices();
  late WallpapersRepo wallpapersRepo;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    wallpapersRepo = WallpapersRepo(apiServices);
    home_page_model = await wallpapersRepo.getHomePage();

    setState(() {});
  }

  Widget buildBlocWidget() {
    return home_page_model.isEmpty
        ? showLoadingIndicator()
        : buildLoadedListWidget();
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: MyCircleProgressIndecator(),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildWallpaperList(),
        ],
      ),
    );
  }

  Widget buildWallpaperList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: home_page_model.length,
      itemBuilder: (context, index) {
        return WallpaperWidget(
          homePageModel: home_page_model[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: const Text(
            "Popular Actors",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple,
          actions: [],
        ),
        // Display the bloc widget (either loading or data)
        body: Container(
            color: const Color.fromARGB(141, 155, 39, 176),
            child: buildBlocWidget()),
      ),
    );
  }
}
