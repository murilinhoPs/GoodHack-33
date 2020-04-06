import 'package:flutter_modular/flutter_modular.dart';
import 'package:good_hack/app/modules/home/home_module.dart';
import 'package:good_hack/app/modules/shopping/shop_controller.dart';
import 'package:good_hack/app/modules/shopping/shop_module.dart';
import 'package:good_hack/app/shared/models/markets_model.dart';
import 'package:good_hack/app/shared/services/api_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ApiRepository _repository;

  _HomeControllerBase(this._repository) {
    fetchMarkets();
  }

  @observable
  List<MarketModel> markets;

  @action
  Future fetchMarkets() async {
    print('dsdddadadad');
    //print(ShopModule.to.get<ShopController>());
    try {
      var response = await _repository.responseGet();

      markets = response;
      print('dsdddadadad22222');
      print(ShopModule.to.get<ShopController>());
    } catch (e) {
      print(e.message);
    }
  }
}
