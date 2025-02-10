import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthStateModel with _$AuthStateModel {
  const factory AuthStateModel({
    required bool signedIn,
  }) = _AuthStateModel;
}

@riverpod
class AuthState extends _$AuthState {
  @override
  AuthStateModel build() {
    return const AuthStateModel(signedIn: false);
  }

  void signIn() {
    state = state.copyWith(signedIn: true);
  }

  signOut() {
    state = state.copyWith(signedIn: false);
  }
}
