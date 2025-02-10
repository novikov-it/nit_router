// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthStateModel {
  bool get signedIn => throw _privateConstructorUsedError;

  /// Create a copy of AuthStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateModelCopyWith<AuthStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateModelCopyWith<$Res> {
  factory $AuthStateModelCopyWith(
          AuthStateModel value, $Res Function(AuthStateModel) then) =
      _$AuthStateModelCopyWithImpl<$Res, AuthStateModel>;
  @useResult
  $Res call({bool signedIn});
}

/// @nodoc
class _$AuthStateModelCopyWithImpl<$Res, $Val extends AuthStateModel>
    implements $AuthStateModelCopyWith<$Res> {
  _$AuthStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
  }) {
    return _then(_value.copyWith(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateModelImplCopyWith<$Res>
    implements $AuthStateModelCopyWith<$Res> {
  factory _$$AuthStateModelImplCopyWith(_$AuthStateModelImpl value,
          $Res Function(_$AuthStateModelImpl) then) =
      __$$AuthStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool signedIn});
}

/// @nodoc
class __$$AuthStateModelImplCopyWithImpl<$Res>
    extends _$AuthStateModelCopyWithImpl<$Res, _$AuthStateModelImpl>
    implements _$$AuthStateModelImplCopyWith<$Res> {
  __$$AuthStateModelImplCopyWithImpl(
      _$AuthStateModelImpl _value, $Res Function(_$AuthStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
  }) {
    return _then(_$AuthStateModelImpl(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateModelImpl implements _AuthStateModel {
  const _$AuthStateModelImpl({required this.signedIn});

  @override
  final bool signedIn;

  @override
  String toString() {
    return 'AuthStateModel(signedIn: $signedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateModelImpl &&
            (identical(other.signedIn, signedIn) ||
                other.signedIn == signedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signedIn);

  /// Create a copy of AuthStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateModelImplCopyWith<_$AuthStateModelImpl> get copyWith =>
      __$$AuthStateModelImplCopyWithImpl<_$AuthStateModelImpl>(
          this, _$identity);
}

abstract class _AuthStateModel implements AuthStateModel {
  const factory _AuthStateModel({required final bool signedIn}) =
      _$AuthStateModelImpl;

  @override
  bool get signedIn;

  /// Create a copy of AuthStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateModelImplCopyWith<_$AuthStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
