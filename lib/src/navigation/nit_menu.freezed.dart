// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nit_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NitMenuModel {
  List<NitMenuItem> get items => throw _privateConstructorUsedError;
  int? get activeIndex => throw _privateConstructorUsedError;
  int? get previousIndex => throw _privateConstructorUsedError;
  int get defaultIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NitMenuModelCopyWith<NitMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NitMenuModelCopyWith<$Res> {
  factory $NitMenuModelCopyWith(
          NitMenuModel value, $Res Function(NitMenuModel) then) =
      _$NitMenuModelCopyWithImpl<$Res, NitMenuModel>;
  @useResult
  $Res call(
      {List<NitMenuItem> items,
      int? activeIndex,
      int? previousIndex,
      int defaultIndex});
}

/// @nodoc
class _$NitMenuModelCopyWithImpl<$Res, $Val extends NitMenuModel>
    implements $NitMenuModelCopyWith<$Res> {
  _$NitMenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? activeIndex = freezed,
    Object? previousIndex = freezed,
    Object? defaultIndex = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NitMenuItem>,
      activeIndex: freezed == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      previousIndex: freezed == previousIndex
          ? _value.previousIndex
          : previousIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultIndex: null == defaultIndex
          ? _value.defaultIndex
          : defaultIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NitMenuModelImplCopyWith<$Res>
    implements $NitMenuModelCopyWith<$Res> {
  factory _$$NitMenuModelImplCopyWith(
          _$NitMenuModelImpl value, $Res Function(_$NitMenuModelImpl) then) =
      __$$NitMenuModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NitMenuItem> items,
      int? activeIndex,
      int? previousIndex,
      int defaultIndex});
}

/// @nodoc
class __$$NitMenuModelImplCopyWithImpl<$Res>
    extends _$NitMenuModelCopyWithImpl<$Res, _$NitMenuModelImpl>
    implements _$$NitMenuModelImplCopyWith<$Res> {
  __$$NitMenuModelImplCopyWithImpl(
      _$NitMenuModelImpl _value, $Res Function(_$NitMenuModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? activeIndex = freezed,
    Object? previousIndex = freezed,
    Object? defaultIndex = null,
  }) {
    return _then(_$NitMenuModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NitMenuItem>,
      activeIndex: freezed == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      previousIndex: freezed == previousIndex
          ? _value.previousIndex
          : previousIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      defaultIndex: null == defaultIndex
          ? _value.defaultIndex
          : defaultIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NitMenuModelImpl with DiagnosticableTreeMixin implements _NitMenuModel {
  const _$NitMenuModelImpl(
      {required final List<NitMenuItem> items,
      this.activeIndex,
      this.previousIndex,
      this.defaultIndex = 0})
      : _items = items;

  final List<NitMenuItem> _items;
  @override
  List<NitMenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? activeIndex;
  @override
  final int? previousIndex;
  @override
  @JsonKey()
  final int defaultIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NitMenuModel(items: $items, activeIndex: $activeIndex, previousIndex: $previousIndex, defaultIndex: $defaultIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NitMenuModel'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('activeIndex', activeIndex))
      ..add(DiagnosticsProperty('previousIndex', previousIndex))
      ..add(DiagnosticsProperty('defaultIndex', defaultIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NitMenuModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.previousIndex, previousIndex) ||
                other.previousIndex == previousIndex) &&
            (identical(other.defaultIndex, defaultIndex) ||
                other.defaultIndex == defaultIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      activeIndex,
      previousIndex,
      defaultIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NitMenuModelImplCopyWith<_$NitMenuModelImpl> get copyWith =>
      __$$NitMenuModelImplCopyWithImpl<_$NitMenuModelImpl>(this, _$identity);
}

abstract class _NitMenuModel implements NitMenuModel {
  const factory _NitMenuModel(
      {required final List<NitMenuItem> items,
      final int? activeIndex,
      final int? previousIndex,
      final int defaultIndex}) = _$NitMenuModelImpl;

  @override
  List<NitMenuItem> get items;
  @override
  int? get activeIndex;
  @override
  int? get previousIndex;
  @override
  int get defaultIndex;
  @override
  @JsonKey(ignore: true)
  _$$NitMenuModelImplCopyWith<_$NitMenuModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
