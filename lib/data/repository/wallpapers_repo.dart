
import 'package:famous_actors/data/Services/api_services.dart';
import 'package:famous_actors/data/models/home_page_model.dart';

class WallpapersRepo {
  final ApiServices apiServices;

  WallpapersRepo(this.apiServices);
  Future<List<HomePageModel>> getHomePage() async {
    final wallpapers = await apiServices.getHomePage();
    return wallpapers
        .map((wallpapers) => HomePageModel.fromJson(wallpapers))
        .toList();
  }
}
