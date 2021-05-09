part of 'user_cubit.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoadingState extends UserState {
  UserLoadingState();
}

class UserCompletedState extends UserState {
  final List<UserModel> response;

  UserCompletedState(this.response);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCompletedState &&
          runtimeType == other.runtimeType &&
          response == other.response;

  @override
  int get hashCode => response.hashCode;
}

class SuccessLoginState extends UserState {
  final UserModel response;

  SuccessLoginState(this.response);
}

class FilledLoginState extends UserState {
  final Checking response;

  FilledLoginState(this.response);
}

class AddUserState extends UserState {
  final UserModel userModel;
  AddUserState(this.userModel);
}

class UpdateUserState extends UserState {
  UpdateUserState();
}

class DeleteUserState extends UserState {
  DeleteUserState();
}

class SelecetUserState extends UserState {
  final UserModel _userModel;

  UserModel get userModel => _userModel;

  SelecetUserState(this._userModel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelecetUserState &&
          runtimeType == other.runtimeType &&
          _userModel == other._userModel;

  @override
  int get hashCode => _userModel.hashCode;
}

class SelecetAllUserState extends UserState {
  final List<Yoxlama> _userModel;

  List<Yoxlama> get userModel => _userModel;

  SelecetAllUserState(this._userModel);
}

class LoadingUser extends UserState {
  LoadingUser();
}

class Erroruser extends UserState {
  Erroruser();
}

class LoginViewState extends UserState {
  LoginViewState();
}

class HomeViewState extends UserState {
  final UserModel _userModel;
  HomeViewState(this._userModel);

  UserModel get userModel => _userModel;
}
