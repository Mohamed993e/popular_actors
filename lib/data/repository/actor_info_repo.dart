
import 'package:famous_actors/data/Services/api_services.dart';
import 'package:famous_actors/data/models/actor_info_model.dart';
import 'package:famous_actors/data/models/home_page_model.dart';

class ActorInfoRepo {
  final ApiServices apiServices;
  final HomePageModel homePageModel;

  ActorInfoRepo(this.apiServices, this.homePageModel);

  Future<ActorInfoModel> getInfo() async {
    final Map<String, dynamic> info =
        await apiServices.GetActorInfo(homePageModel.id!);

    return ActorInfoModel.fromJson(info);
  }
}
