// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:famous_actors/data/models/home_page_model.dart';
import 'package:famous_actors/data/repository/wallpapers_repo.dart';

import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final WallpapersRepo wallpapersRepo;
  List<HomePageModel> wallpaper = [];
  HomeScreenCubit(this.wallpapersRepo) : super(HomeScreenInitial());

  List<HomePageModel> getWallpapers() {
    wallpapersRepo.getHomePage().then((wallpaper) {
      this.wallpaper = wallpaper;
      emit(HomeScreenloaded(wallpaper));
    });
    return wallpaper;
  }
}
