
import 'package:famous_actors/data/Services/search_api.dart';
import 'package:famous_actors/data/models/home_page_model.dart';

class SearchRepo {
  final SearchApi searchApi;
  final HomePageModel homePageModel;
  late String text ;

  SearchRepo(this.searchApi, this.homePageModel, this.text);
  Future<List<HomePageModel>> search() async {
    final image = await searchApi.searchPerson(text);
    return image.map((image) => HomePageModel.fromJson(image)).toList();
  }
}
