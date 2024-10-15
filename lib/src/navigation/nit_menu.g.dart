// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'nit_menu.dart';

// // **************************************************************************
// // RiverpodGenerator
// // **************************************************************************

// String _$nitMenuHash() => r'2f642bd7c635ce5c8701b0bdf488f7a90ae452fb';

// /// Copied from Dart SDK
// class _SystemHash {
//   _SystemHash._();

//   static int combine(int hash, int value) {
//     // ignore: parameter_assignments
//     hash = 0x1fffffff & (hash + value);
//     // ignore: parameter_assignments
//     hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
//     return hash ^ (hash >> 6);
//   }

//   static int finish(int hash) {
//     // ignore: parameter_assignments
//     hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
//     // ignore: parameter_assignments
//     hash = hash ^ (hash >> 11);
//     return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
//   }
// }

// abstract class _$NitMenu extends BuildlessAutoDisposeNotifier<NitMenuModel> {
//   late final List<NitMenuItem> menuItems;

//   NitMenuModel build(
//     List<NitMenuItem> menuItems,
//   );
// }

// /// See also [NitMenu].
// @ProviderFor(NitMenu)
// const nitMenuProvider = NitMenuFamily();

// /// See also [NitMenu].
// class NitMenuFamily extends Family<NitMenuModel> {
//   /// See also [NitMenu].
//   const NitMenuFamily();

//   /// See also [NitMenu].
//   NitMenuProvider call(
//     List<NitMenuItem> menuItems,
//   ) {
//     return NitMenuProvider(
//       menuItems,
//     );
//   }

//   @override
//   NitMenuProvider getProviderOverride(
//     covariant NitMenuProvider provider,
//   ) {
//     return call(
//       provider.menuItems,
//     );
//   }

//   static const Iterable<ProviderOrFamily>? _dependencies = null;

//   @override
//   Iterable<ProviderOrFamily>? get dependencies => _dependencies;

//   static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

//   @override
//   Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
//       _allTransitiveDependencies;

//   @override
//   String? get name => r'nitMenuProvider';
// }

// /// See also [NitMenu].
// class NitMenuProvider
//     extends AutoDisposeNotifierProviderImpl<NitMenu, NitMenuModel> {
//   /// See also [NitMenu].
//   NitMenuProvider(
//     List<NitMenuItem> menuItems,
//   ) : this._internal(
//           () => NitMenu()..menuItems = menuItems,
//           from: nitMenuProvider,
//           name: r'nitMenuProvider',
//           debugGetCreateSourceHash:
//               const bool.fromEnvironment('dart.vm.product')
//                   ? null
//                   : _$nitMenuHash,
//           dependencies: NitMenuFamily._dependencies,
//           allTransitiveDependencies: NitMenuFamily._allTransitiveDependencies,
//           menuItems: menuItems,
//         );

//   NitMenuProvider._internal(
//     super._createNotifier, {
//     required super.name,
//     required super.dependencies,
//     required super.allTransitiveDependencies,
//     required super.debugGetCreateSourceHash,
//     required super.from,
//     required this.menuItems,
//   }) : super.internal();

//   final List<NitMenuItem> menuItems;

//   @override
//   NitMenuModel runNotifierBuild(
//     covariant NitMenu notifier,
//   ) {
//     return notifier.build(
//       menuItems,
//     );
//   }

//   @override
//   Override overrideWith(NitMenu Function() create) {
//     return ProviderOverride(
//       origin: this,
//       override: NitMenuProvider._internal(
//         () => create()..menuItems = menuItems,
//         from: from,
//         name: null,
//         dependencies: null,
//         allTransitiveDependencies: null,
//         debugGetCreateSourceHash: null,
//         menuItems: menuItems,
//       ),
//     );
//   }

//   @override
//   AutoDisposeNotifierProviderElement<NitMenu, NitMenuModel> createElement() {
//     return _NitMenuProviderElement(this);
//   }

//   @override
//   bool operator ==(Object other) {
//     return other is NitMenuProvider && other.menuItems == menuItems;
//   }

//   @override
//   int get hashCode {
//     var hash = _SystemHash.combine(0, runtimeType.hashCode);
//     hash = _SystemHash.combine(hash, menuItems.hashCode);

//     return _SystemHash.finish(hash);
//   }
// }

// mixin NitMenuRef on AutoDisposeNotifierProviderRef<NitMenuModel> {
//   /// The parameter `menuItems` of this provider.
//   List<NitMenuItem> get menuItems;
// }

// class _NitMenuProviderElement
//     extends AutoDisposeNotifierProviderElement<NitMenu, NitMenuModel>
//     with NitMenuRef {
//   _NitMenuProviderElement(super.provider);

//   @override
//   List<NitMenuItem> get menuItems => (origin as NitMenuProvider).menuItems;
// }
// // ignore_for_file: type=lint
// // ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
