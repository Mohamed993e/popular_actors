import 'package:famous_actors/Constants/pageroute.dart';
import 'package:famous_actors/bussiness_logic/cubit/home_screen/home_screen_cubit.dart';
import 'package:famous_actors/data/Services/api_services.dart';
import 'package:famous_actors/data/repository/wallpapers_repo.dart';
import 'package:famous_actors/presentation_layer/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late WallpapersRepo wallpapersRepo;
  late HomeScreenCubit homeScreenCubit;
  AppRoute() {
    wallpapersRepo = WallpapersRepo(ApiServices());
    homeScreenCubit = HomeScreenCubit(wallpapersRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => HomeScreenCubit(wallpapersRepo),
              child: const HomePage()),
        );
    }
    return null;
  }
}
