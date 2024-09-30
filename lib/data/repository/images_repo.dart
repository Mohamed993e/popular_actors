// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:famous_actors/data/Services/api_services.dart';
import 'package:famous_actors/data/models/home_page_model.dart';
import 'package:famous_actors/data/models/images_model.dart';
import 'package:flutter/material.dart';

class ImagesRepo {
  final ApiServices apiServices;
  final HomePageModel homePageModel;

  ImagesRepo(this.apiServices, this.homePageModel);
  Future<List<ImagesModel>> getImages() async {
    final image = await apiServices.GetImages(homePageModel.id!);
    return image.map((image) => ImagesModel.fromJson(image)).toList();
  }
}
