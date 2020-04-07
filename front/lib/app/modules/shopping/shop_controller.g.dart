// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShopController on _ShopControllerBase, Store {
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
  Future postOrder({String msg, String email, String telefone}) {
    return _$postOrderAsyncAction
        .run(() => super.postOrder(msg: msg, email: email, telefone: telefone));
  }

  @override
  String toString() {
    final string = 'finalMessage: ${finalMessage.toString()}';
    return '{$string}';
  }
}
