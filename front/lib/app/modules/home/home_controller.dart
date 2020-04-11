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
  List<MarketModel> markets = [];

  @action
  Future fetchMarkets() async {
    try {
      var response = await _repository.responseGet();

      markets = response;
    } catch (e) {
      print('Error Message: ${e.message}');
    }
  }
}
