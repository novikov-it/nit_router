// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nit_redirects_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NitRedirectsStateModel {
  Map<NavigationZoneEnum<Listenable>, NavigationZoneEnum<Listenable>>
      get redirects => throw _privateConstructorUsedError;

  /// Create a copy of NitRedirectsStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NitRedirectsStateModelCopyWith<NitRedirectsStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NitRedirectsStateModelCopyWith<$Res> {
  factory $NitRedirectsStateModelCopyWith(NitRedirectsStateModel value,
          $Res Function(NitRedirectsStateModel) then) =
      _$NitRedirectsStateModelCopyWithImpl<$Res, NitRedirectsStateModel>;
  @useResult
  $Res call(
      {Map<NavigationZoneEnum<Listenable>, NavigationZoneEnum<Listenable>>
          redirects});
}

/// @nodoc
class _$NitRedirectsStateModelCopyWithImpl<$Res,
        $Val extends NitRedirectsStateModel>
    implements $NitRedirectsStateModelCopyWith<$Res> {
  _$NitRedirectsStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NitRedirectsStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirects = null,
  }) {
    return _then(_value.copyWith(
      redirects: null == redirects
          ? _value.redirects
          : redirects // ignore: cast_nullable_to_non_nullable
              as Map<NavigationZoneEnum<Listenable>,
                  NavigationZoneEnum<Listenable>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NitRedirectsStateModelImplCopyWith<$Res>
    implements $NitRedirectsStateModelCopyWith<$Res> {
  factory _$$NitRedirectsStateModelImplCopyWith(
          _$NitRedirectsStateModelImpl value,
          $Res Function(_$NitRedirectsStateModelImpl) then) =
      __$$NitRedirectsStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<NavigationZoneEnum<Listenable>, NavigationZoneEnum<Listenable>>
          redirects});
}

/// @nodoc
class __$$NitRedirectsStateModelImplCopyWithImpl<$Res>
    extends _$NitRedirectsStateModelCopyWithImpl<$Res,
        _$NitRedirectsStateModelImpl>
    implements _$$NitRedirectsStateModelImplCopyWith<$Res> {
  __$$NitRedirectsStateModelImplCopyWithImpl(
      _$NitRedirectsStateModelImpl _value,
      $Res Function(_$NitRedirectsStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NitRedirectsStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirects = null,
  }) {
    return _then(_$NitRedirectsStateModelImpl(
      redirects: null == redirects
          ? _value._redirects
          : redirects // ignore: cast_nullable_to_non_nullable
              as Map<NavigationZoneEnum<Listenable>,
                  NavigationZoneEnum<Listenable>>,
    ));
  }
}

/// @nodoc

class _$NitRedirectsStateModelImpl implements _NitRedirectsStateModel {
  const _$NitRedirectsStateModelImpl(
      {required final Map<NavigationZoneEnum<Listenable>,
              NavigationZoneEnum<Listenable>>
          redirects})
      : _redirects = redirects;

  final Map<NavigationZoneEnum<Listenable>, NavigationZoneEnum<Listenable>>
      _redirects;
  @override
  Map<NavigationZoneEnum<Listenable>, NavigationZoneEnum<Listenable>>
      get redirects {
    if (_redirects is EqualUnmodifiableMapView) return _redirects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_redirects);
  }

  @override
  String toString() {
    return 'NitRedirectsStateModel(redirects: $redirects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NitRedirectsStateModelImpl &&
            const DeepCollectionEquality()
                .equals(other._redirects, _redirects));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_redirects));

  /// Create a copy of NitRedirectsStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NitRedirectsStateModelImplCopyWith<_$NitRedirectsStateModelImpl>
      get copyWith => __$$NitRedirectsStateModelImplCopyWithImpl<
          _$NitRedirectsStateModelImpl>(this, _$identity);
}

abstract class _NitRedirectsStateModel implements NitRedirectsStateModel {
  const factory _NitRedirectsStateModel(
      {required final Map<NavigationZoneEnum<Listenable>,
              NavigationZoneEnum<Listenable>>
          redirects}) = _$NitRedirectsStateModelImpl;

  @override
  Map<NavigationZoneEnum<Listenable>, NavigationZoneEnum<Listenable>>
      get redirects;

  /// Create a copy of NitRedirectsStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NitRedirectsStateModelImplCopyWith<_$NitRedirectsStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
