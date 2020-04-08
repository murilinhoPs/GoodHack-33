// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShopController on _ShopControllerBase, Store {
  final _$storeNameAtom = Atom(name: '_ShopControllerBase.storeName');

  @override
  String get storeName {
    _$storeNameAtom.context.enforceReadPolicy(_$storeNameAtom);
    _$storeNameAtom.reportObserved();
    return super.storeName;
  }

  @override
  set storeName(String value) {
    _$storeNameAtom.context.conditionallyRunInAction(() {
      super.storeName = value;
      _$storeNameAtom.reportChanged();
    }, _$storeNameAtom, name: '${_$storeNameAtom.name}_set');
  }

  final _$finalMessageAtom = Atom(name: '_ShopControllerBase.finalMessage');

  @override
  String get finalMessage {
    _$finalMessageAtom.context.enforceReadPolicy(_$finalMessageAtom);
    _$finalMessageAtom.reportObserved();
    return super.finalMessage;
  }

  @override
  set finalMessage(String value) {
    _$finalMessageAtom.context.conditionallyRunInAction(() {
      super.finalMessage = value;
      _$finalMessageAtom.reportChanged();
    }, _$finalMessageAtom, name: '${_$finalMessageAtom.name}_set');
  }

  final _$postOrderAsyncAction = AsyncAction('postOrder');

  @override
  Future postOrder({String msg, String email, String telefone, String loja}) {
    return _$postOrderAsyncAction.run(() => super
        .postOrder(msg: msg, email: email, telefone: telefone, loja: loja));
  }

  final _$_ShopControllerBaseActionController =
      ActionController(name: '_ShopControllerBase');

  @override
  dynamic name(dynamic newName) {
    final _$actionInfo = _$_ShopControllerBaseActionController.startAction();
    try {
      return super.name(newName);
    } finally {
      _$_ShopControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'storeName: ${storeName.toString()},finalMessage: ${finalMessage.toString()}';
    return '{$string}';
  }
}
