import 'package:cached_network_image/cached_network_image.dart';
import 'package:famous_actors/Constants/my_colors.dart';
import 'package:famous_actors/data/models/home_page_model.dart';
import 'package:famous_actors/presentation_layer/screens/details_page.dart';
import 'package:flutter/material.dart';

class WallpaperWidget extends StatelessWidget {
  final HomePageModel homePageModel;

  const WallpaperWidget({
    super.key,
    required this.homePageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsetsDirectional.fromSTEB(5, 8, 5, 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 87, 19, 99),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GridTile(
          // ignore: sort_child_properties_last
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                  wallpaper: homePageModel,
                  imagesId: homePageModel.id!,
                ),
              ));
            },
            child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: MyColors.myGrey,
                ),
                child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${homePageModel.profilePath}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error))),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15, vertical: 10),
            color: const Color.fromARGB(137, 155, 39, 176),
            alignment: Alignment.bottomCenter,
            child: Text(
              homePageModel.name == null
                  ? 'We Dont Have a Name Yet'
                  : homePageModel.name!,
              style: TextStyle(
                  height: 3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.myWhite),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
