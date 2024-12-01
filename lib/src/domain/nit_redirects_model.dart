import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nit_router/nit_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'nit_redirects_model.g.dart';
part 'nit_redirects_model.freezed.dart';

@freezed
abstract class NitRedirectsStateModel with _$NitRedirectsStateModel {
  const factory NitRedirectsStateModel({
    required Map<NavigationZoneEnum, NavigationZoneEnum> redirects,
  }) = _NitRedirectsStateModel;
}

// @riverpod
// class NitRedirectsState extends _$NitRedirectsState {
// @override
// NitRedirectsStateModel build() {
// return NitRedirectsStateModel(

// );
// }
// }