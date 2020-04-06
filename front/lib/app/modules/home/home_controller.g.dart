// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$marketsAtom = Atom(name: '_HomeControllerBase.markets');

  @override
  List<MarketModel> get markets {
    _$marketsAtom.context.enforceReadPolicy(_$marketsAtom);
    _$marketsAtom.reportObserved();
    return super.markets;
  }

  @override
  set markets(List<MarketModel> value) {
    _$marketsAtom.context.conditionallyRunInAction(() {
      super.markets = value;
      _$marketsAtom.reportChanged();
    }, _$marketsAtom, name: '${_$marketsAtom.name}_set');
  }

  final _$fetchMarketsAsyncAction = AsyncAction('fetchMarkets');

  @override
  Future<dynamic> fetchMarkets() {
    return _$fetchMarketsAsyncAction.run(() => super.fetchMarkets());
  }

  @override
  String toString() {
    final string = 'markets: ${markets.toString()}';
    return '{$string}';
  }
}
