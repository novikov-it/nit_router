// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'nit_menu_item.dart';

// part 'nit_menu.freezed.dart';
// part 'nit_menu.g.dart';

// @riverpod
// class NitMenu extends _$NitMenu {
//   @override
//   NitMenuModel build(List<NitMenuItem> menuItems) {
//     return NitMenuModel(
//       items: menuItems,
//     );
//   }

//   void setActiveIndex(
//     int newIndex, {
//     bool savePrevious = true,
//   }) {
//     state = state.copyWith(
//       activeIndex: newIndex,
//       previousIndex: savePrevious ? state.activeIndex : null,
//     );
//   }

//   void setDefaultIndex(int newIndex) {
//     state = state.copyWith(
//       defaultIndex: newIndex,
//     );
//   }

//   // void setItems(List<NitMenuItem> newItems) {
//   //   state = state.copyWith(
//   //     items: newItems,
//   //   );
//   // }
// }

// @freezed
// class NitMenuModel with _$NitMenuModel {
//   const factory NitMenuModel({
//     required List<NitMenuItem> items,
//     int? activeIndex,
//     int? previousIndex,
//     @Default(0) int defaultIndex,
//   }) = _NitMenuModel;
// }
